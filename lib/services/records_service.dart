import 'dart:async';

import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';

import '../source.dart';

class RecordsService {
  final _recordsBox = Hive.box(kRecords);
  final _totalRecordsBox = Hive.box(kTotalRecords);
  final _recordList = <Record>[];
  var _totalRecords = TotalRecords();
  final uuid = const Uuid();

  final controller = StreamController<Map>.broadcast();
  Stream<Map> get getRecordsStream => controller.stream;

  List<Record> getAll() {
    if (_recordsBox.isNotEmpty) {
      final values = _recordsBox.values;
      for (Record record in values) {
        final index = _recordList.indexWhere((e) => e.id == record.id);
        if (index == -1) _recordList.add(record);
      }
      return _recordList;
    }
    return [];
  }

  ///returns a list of two amounts, first is total amount of income and second is
  ///the total amount of expenses in the specific day.
  List<double> _getTotalAmountsByDay(int day) {
    double expenses = 0;
    double income = 0;
    final list = _recordList.where((e) => e.date.day == day).toList();
    for (Record record in list) {
      if (record.category.type == kExpense) expenses += record.amount;
      if (record.category.type == kIncome) income += record.amount;
    }
    return [income, expenses];
  }

  Map<int, List<double>> getAllTotalAmounts() {
    final days = Utils.getDaysInMonth();
    final amountsMap = <int, List<double>>{};
    for (int day = 1; day <= days; day++) {
      final amountsList = _getTotalAmountsByDay(day);
      amountsMap[day] = amountsList;
    }
    return amountsMap;
  }

  TotalRecords getTotalAmounts() {
    if (_totalRecordsBox.isEmpty) return TotalRecords();
    _totalRecords = _totalRecordsBox.get(kTotalRecords);
    return _totalRecords;
  }

  void add(Record record) {
    final date = DateTime.now();
    final id = uuid.v4();
    final record0 = record.copyWith(id: id, date: date);
    _recordsBox.put(id, record0);
    _recordList.add(record0);
    _updateTotalRecords(record0.amount, record0.category.type);
    _addToController();
  }

  void edit(Record record) {
    final record0 = _recordsBox.get(record.id) as Record;
    final updatedRecord = record0.copyWith(
        category: record.category, amount: record.amount, notes: record.notes);
    _recordsBox.put(updatedRecord.id, updatedRecord);

    final index = _recordList.indexWhere((e) => e.id == updatedRecord.id);
    _updateTotalRecords(updatedRecord.amount, updatedRecord.category.type,
        isEditing: true, beforeEditAmount: _recordList[index].amount);
    _recordList[index] = updatedRecord;
    _addToController();
  }

  void editSimilarCategories(Category category) {
    final recordList =
        _recordList.where((e) => e.category.id == category.id).toList();
    for (Record record in recordList) {
      final id = record.category.id;
      final index = _recordList.indexWhere((e) => e.category.id == id);
      final updatedRecord = record.copyWith(category: category);
      _recordList[index] = updatedRecord;
      _recordsBox.put(id, updatedRecord);
    }
    _addToController();
  }

  void delete(String id) {
    _recordsBox.delete(id);
    final index = _recordList.indexWhere((e) => e.id == id);
    final record = _recordList[index];
    _updateTotalRecords(record.amount, record.category.type, isDeleting: true);
    _recordList.removeAt(index);
    _addToController();
  }

  List<String> getCategoryIds() {
    final idList = <String>[];
    for (Record record in _recordList) {
      final id = record.category.id;
      idList.add(id);
    }
    return idList;
  }

  void _updateTotalRecords(double amount, String type,
      {bool isEditing = false,
      bool isDeleting = false,
      double beforeEditAmount = 0.0}) {
    if (isEditing) {
      if (type == kIncome) {
        _totalRecords = _totalRecords.copyWith(
            totalIncome:
                (_totalRecords.totalIncome - beforeEditAmount) + amount);
      } else {
        _totalRecords = _totalRecords.copyWith(
            totalExpenses:
                (_totalRecords.totalExpenses - beforeEditAmount) + amount);
      }
    } else if (isDeleting) {
      if (type == kIncome) {
        _totalRecords = _totalRecords.copyWith(
            totalIncome: _totalRecords.totalIncome - amount);
      } else {
        _totalRecords = _totalRecords.copyWith(
            totalExpenses: _totalRecords.totalExpenses - amount);
      }
    } else {
      _totalRecords = _totalRecords.copyWith(
          totalIncome:
              _totalRecords.totalIncome + (type == kIncome ? amount : 0),
          totalExpenses:
              _totalRecords.totalExpenses + (type == kExpense ? amount : 0));
    }
    _totalRecordsBox.put(kTotalRecords, _totalRecords);
  }

  ///Gets the amounts used for each category recorded, incomes and expenses.
  List<Record> getUniqueRecords() {
    var uniqueList = <Record>[];
    final idList = <String>[];

    for (Record record in _recordList) {
      final id = record.category.id;
      if (idList.contains(record.category.id)) {
        final index = uniqueList.indexWhere((e) => e.category.id == id);
        final record = uniqueList[index];
        uniqueList[index] =
            record.copyWith(amount: record.amount + record.amount);
      } else {
        uniqueList.add(record);
        idList.add(id);
      }
    }

    return uniqueList;
  }

  Map<int, double> getDailyAmountByCategory(Category category) {
    var dailyAmountMap = <int, double>{};
    final dateList = <int>[];

    final id = category.id;
    final list = _recordList.where((e) => e.category.id == id).toList();

    for (Record record in list) {
      final day = record.date.day;

      if (dateList.contains(day)) {
        final amount = dailyAmountMap[day]!;
        dailyAmountMap[day] = amount + record.amount;
      } else {
        dailyAmountMap[day] = record.amount;
        dateList.add(day);
      }
    }

    return dailyAmountMap;
  }

  _addToController() {
    final amountsMap = getAllTotalAmounts();
    controller.add({
      kRecords: _recordList,
      kTotalRecords: _totalRecords,
      kAllDaysTotals: amountsMap,
    });
  }
}
