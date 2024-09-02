import 'package:realm/realm.dart';

base class RealmCore {
  late Realm _realm;

  init(LocalConfiguration config) {
    _realm = Realm(config);
  }

  List<T> getAll<T extends RealmObject>() {
    final result = _realm.all<T>();
    return result.indexed.map((e) => e.$2).toList();
  }

  Stream<RealmResultsChanges<T>> getStream<T extends RealmObject>() {
    return _realm.all<T>().changes.asBroadcastStream();
  }

  Stream<List<T>> getReactiveList<T extends RealmObject>() {
    return _realm
        .all<T>()
        .changes
        .asBroadcastStream()
        .map((e) => e.results.indexed.map((e) => e.$2).toList());
  }

  T add<T extends RealmObject>(T input) {
    late T c;
    _realm.write(() {
      c = _realm.add<T>(input);
    });

    return c;
  }

  void clearAll<T extends RealmObject>() {
    _realm.write(() {
      _realm.deleteAll<T>();
    });
  }
}
