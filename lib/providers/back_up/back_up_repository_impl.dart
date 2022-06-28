import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

import '../../models/record.dart';
import '../../secrets.dart';

final backUpRepository = Provider((ref) => BackUpRepositoryImpl());

class BackUpRepositoryImpl {
  Future<void> backUpRecords(List<Record> records) async {
    final url = Uri.parse('$rootUrl2/records');
    final body = records.map((e) => e.toJson()).toList();
    await http.post(url, body: body);
  }
}
