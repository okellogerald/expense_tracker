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

  final controller = StreamController<Map<String, dynamic>>.broadcast();
  Stream<Map<String, dynamic>> get getRecordsStream => controller.stream;

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
  List<double> getTotalAmountsByDay(int day) {
    double expenses = 0;
    double income = 0;
    final list = _recordList.where((e) => e.date.day == day).toList();
    for (Record record in list) {
      if (record.category.type == kExpense) expenses += record.amount;
      if (record.category.type == kIncome) income += record.amount;
    }
    return [income, expenses];
  }

  TotalRecords getTotalAmounts() {
    if (_totalRecordsBox.isEmpty) return TotalRecords();
    _totalRecords = _totalRecordsBox.get(kTotalRecords);
    return _totalRecords;
  }

  void add(Category category, double amount, String notes) {
    final date = DateTime.now();
    final id = uuid.v4();
    final record = Record(
        id: id, amount: amount, category: category, date: date, notes: notes);
    _recordsBox.put(id, record);
    _recordList.add(record);
    _updateTotalRecords(amount, category.type);
    _addToController();
  }

  void edit(String id, Category category, double amount, String notes) {
    final record = _recordsBox.get(id) as Record;
    final newRecord =
        record.copyWith(category: category, amount: amount, notes: notes);
    _recordsBox.put(id, newRecord);

    final index = _recordList.indexWhere((e) => e.id == id);
    _updateTotalRecords(amount, category.type,
        isEditing: true, beforeEditAmount: _recordList[index].amount);
    _recordList[index] = newRecord;
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

  _addToController() =>
      controller.add({kRecords: _recordList, kTotalRecords: _totalRecords});
}
