import 'dart:async';
import 'package:hive/hive.dart';
import '../source.dart';

typedef GrossAmountsMap = Map<String, GrossAmount>;

class GrossAmountsService {
  static final box = Hive.box(kGrossAmounts);
  static var grossAmountsMap = <String, GrossAmount>{};

  final controller = StreamController<GrossAmountsMap>.broadcast();
  Stream<GrossAmountsMap> get getGrossAmountStream => controller.stream;

  void add(String id, String title, double amount) {
    final isAlreadyPresent = grossAmountsMap[id] != null;
    var grossAmount = GrossAmount.empty();
    if (isAlreadyPresent) {
      final prevGrossAmount = grossAmountsMap[id] as GrossAmount;
      grossAmount =
          prevGrossAmount.copyWith(amount: prevGrossAmount.amount + amount);
    } else {
      grossAmount = GrossAmount(
          id: id, title: title, amount: amount, lastDate: DateTime.now());
    }
    grossAmountsMap[id] = grossAmount;
    box.put(id, grossAmount);
  }

  void editTitle(String id, String title) {
    final grossAmount = box.get(id) as GrossAmount;
    final _grossAmount = grossAmount.copyWith(title: title);
    grossAmountsMap[id] = _grossAmount;
    box.put(id, _grossAmount);
  }

  void editAmount(String id, double amount, double beforeEditAmount) {
    final grossAmount = box.get(id) as GrossAmount?;
    if (grossAmount == null) return;
    final _grossAmount = grossAmount.copyWith(
        amount: grossAmount.amount - beforeEditAmount + amount);
    grossAmountsMap[id] = _grossAmount;
    box.put(id, _grossAmount);
  }

  GrossAmountsMap getAll() {
    final _grossAmountMap = <String, GrossAmount>{};
    for (GrossAmount grossAmount in box.values) {
      _grossAmountMap[grossAmount.id] = grossAmount;
    }
    grossAmountsMap = _grossAmountMap;
    return _grossAmountMap;
  }

  void delete(String id, double amount) => editAmount(id, amount * -1, 0);
}
