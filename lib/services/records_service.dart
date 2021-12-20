import 'dart:async';
import 'package:hive/hive.dart';
import '../source.dart';

class RecordsService {
  final _recordsBox = Hive.box(kRecords);
  final _totalRecordsBox = Hive.box(kTotalRecords);
  final _recordList = <Record>[];
  var _totalRecords = TotalRecords();

  final controller = StreamController<Map<String, dynamic>>.broadcast();
  Stream<Map<String, dynamic>> get getRecordsStream => controller.stream;

  List<Record> getAll() {
    if (_recordsBox.isNotEmpty) {
      final values = _recordsBox.values;
      for (Record record in values) {
        _recordList.add(record);
      }
      return _recordList;
    }
    return [];
  }

  TotalRecords getTotalAmounts() {
    if (_totalRecordsBox.isEmpty) return TotalRecords();
    _totalRecords = _totalRecordsBox.get(kTotalRecords);
    return _totalRecords;
  }

  void add(Category category, int amount) {
    log(_recordList.length.toString());

    final date = DateTime.now();
    final record = Record(amount: amount, category: category, date: date);
    _recordsBox.put(date.toString(), record);
    _recordList.add(record);
    _updateTotalRecords(amount, category.type);
    _addToController();
  }

  void _updateTotalRecords(int amount, String type) {
    _totalRecords = _totalRecords.copyWith(
        totalIncome: _totalRecords.totalIncome + (type == kIncome ? amount : 0),
        totalExpenses:
            _totalRecords.totalExpenses + (type == kExpense ? amount : 0));
    _totalRecordsBox.put(kTotalRecords, _totalRecords);
  }

  _addToController() =>
      controller.add({kRecords: _recordList, kTotalRecords: _totalRecords});
}
