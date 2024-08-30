// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expense.future.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

// ignore_for_file: type=lint
class FutureExpense extends $FutureExpense
    with RealmEntity, RealmObjectBase, RealmObject {
  FutureExpense(
    ObjectId id,
    String name,
    double amount, {
    ExpenseCategory? category,
    String? notes,
    int? icon,
    DateTime? expectedPayingDate,
  }) {
    RealmObjectBase.set(this, 'id', id);
    RealmObjectBase.set(this, 'category', category);
    RealmObjectBase.set(this, 'name', name);
    RealmObjectBase.set(this, 'amount', amount);
    RealmObjectBase.set(this, 'notes', notes);
    RealmObjectBase.set(this, 'icon', icon);
    RealmObjectBase.set(this, 'expectedPayingDate', expectedPayingDate);
  }

  FutureExpense._();

  @override
  ObjectId get id => RealmObjectBase.get<ObjectId>(this, 'id') as ObjectId;
  @override
  set id(ObjectId value) => RealmObjectBase.set(this, 'id', value);

  @override
  ExpenseCategory? get category =>
      RealmObjectBase.get<ExpenseCategory>(this, 'category')
          as ExpenseCategory?;
  @override
  set category(covariant ExpenseCategory? value) =>
      RealmObjectBase.set(this, 'category', value);

  @override
  String get name => RealmObjectBase.get<String>(this, 'name') as String;
  @override
  set name(String value) => RealmObjectBase.set(this, 'name', value);

  @override
  double get amount => RealmObjectBase.get<double>(this, 'amount') as double;
  @override
  set amount(double value) => RealmObjectBase.set(this, 'amount', value);

  @override
  String? get notes => RealmObjectBase.get<String>(this, 'notes') as String?;
  @override
  set notes(String? value) => RealmObjectBase.set(this, 'notes', value);

  @override
  int? get icon => RealmObjectBase.get<int>(this, 'icon') as int?;
  @override
  set icon(int? value) => RealmObjectBase.set(this, 'icon', value);

  @override
  DateTime? get expectedPayingDate =>
      RealmObjectBase.get<DateTime>(this, 'expectedPayingDate') as DateTime?;
  @override
  set expectedPayingDate(DateTime? value) =>
      RealmObjectBase.set(this, 'expectedPayingDate', value);

  @override
  Stream<RealmObjectChanges<FutureExpense>> get changes =>
      RealmObjectBase.getChanges<FutureExpense>(this);

  @override
  Stream<RealmObjectChanges<FutureExpense>> changesFor(
          [List<String>? keyPaths]) =>
      RealmObjectBase.getChangesFor<FutureExpense>(this, keyPaths);

  @override
  FutureExpense freeze() => RealmObjectBase.freezeObject<FutureExpense>(this);

  EJsonValue toEJson() {
    return <String, dynamic>{
      'id': id.toEJson(),
      'category': category.toEJson(),
      'name': name.toEJson(),
      'amount': amount.toEJson(),
      'notes': notes.toEJson(),
      'icon': icon.toEJson(),
      'expectedPayingDate': expectedPayingDate.toEJson(),
    };
  }

  static EJsonValue _toEJson(FutureExpense value) => value.toEJson();
  static FutureExpense _fromEJson(EJsonValue ejson) {
    if (ejson is! Map<String, dynamic>) return raiseInvalidEJson(ejson);
    return switch (ejson) {
      {
        'id': EJsonValue id,
        'name': EJsonValue name,
        'amount': EJsonValue amount,
      } =>
        FutureExpense(
          fromEJson(id),
          fromEJson(name),
          fromEJson(amount),
          category: fromEJson(ejson['category']),
          notes: fromEJson(ejson['notes']),
          icon: fromEJson(ejson['icon']),
          expectedPayingDate: fromEJson(ejson['expectedPayingDate']),
        ),
      _ => raiseInvalidEJson(ejson),
    };
  }

  static final schema = () {
    RealmObjectBase.registerFactory(FutureExpense._);
    register(_toEJson, _fromEJson);
    return const SchemaObject(
        ObjectType.realmObject, FutureExpense, 'FutureExpense', [
      SchemaProperty('id', RealmPropertyType.objectid, primaryKey: true),
      SchemaProperty('category', RealmPropertyType.object,
          optional: true, linkTarget: 'ExpenseCategory'),
      SchemaProperty('name', RealmPropertyType.string),
      SchemaProperty('amount', RealmPropertyType.double),
      SchemaProperty('notes', RealmPropertyType.string, optional: true),
      SchemaProperty('icon', RealmPropertyType.int, optional: true),
      SchemaProperty('expectedPayingDate', RealmPropertyType.timestamp,
          optional: true),
    ]);
  }();

  @override
  SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
}
