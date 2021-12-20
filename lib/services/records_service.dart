import 'dart:async';
import 'package:hive/hive.dart';
import '../source.dart';

typedef TRecordsStream = Stream<TotalRecords>;

class RecordsService {
  final _recordsBox = Hive.box(kRecords);
  final _totalRecordsBox = Hive.box(kTotalRecords);
  final _recordList = <Record>[];
  var _totalRecords = TotalRecords();

  final _recordsController = StreamController<List<Record>>.broadcast();
  Stream<List<Record>> get getRecordStream => _recordsController.stream;

  final _totalRecordsController = StreamController<TotalRecords>.broadcast();
  TRecordsStream get getTotalRecordsStream => _totalRecordsController.stream;

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
    final date = DateTime.now();
    final record = Record(amount: amount, category: category, date: date);
    _recordsBox.put(date.toString(), record);
    _recordList.add(record);
    _recordsController.add(_recordList);
    _updateTotalRecods(amount, category.type);
  }

  void _updateTotalRecods(int amount, String type) {
    final totalRecords = _totalRecords.copyWith(
        totalIncome: _totalRecords.totalIncome + (type == kIncome ? amount : 0),
        totalExpenses:
            _totalRecords.totalExpenses + (type == kExpense ? amount : 0));
    _totalRecordsBox.put(kTotalRecords, totalRecords);
    _totalRecordsController.add(totalRecords);
  }
}
