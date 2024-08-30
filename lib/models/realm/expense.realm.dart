// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expense.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

// ignore_for_file: type=lint
class Expense extends $Expense with RealmEntity, RealmObjectBase, RealmObject {
  Expense(
    ObjectId id,
    String name,
    double amount,
    DateTime datePaid, {
    ExpenseCategory? category,
    String? notes,
    int? icon,
  }) {
    RealmObjectBase.set(this, 'id', id);
    RealmObjectBase.set(this, 'category', category);
    RealmObjectBase.set(this, 'name', name);
    RealmObjectBase.set(this, 'amount', amount);
    RealmObjectBase.set(this, 'notes', notes);
    RealmObjectBase.set(this, 'icon', icon);
    RealmObjectBase.set(this, 'datePaid', datePaid);
  }

  Expense._();

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
  DateTime get datePaid =>
      RealmObjectBase.get<DateTime>(this, 'datePaid') as DateTime;
  @override
  set datePaid(DateTime value) => RealmObjectBase.set(this, 'datePaid', value);

  @override
  Stream<RealmObjectChanges<Expense>> get changes =>
      RealmObjectBase.getChanges<Expense>(this);

  @override
  Stream<RealmObjectChanges<Expense>> changesFor([List<String>? keyPaths]) =>
      RealmObjectBase.getChangesFor<Expense>(this, keyPaths);

  @override
  Expense freeze() => RealmObjectBase.freezeObject<Expense>(this);

  EJsonValue toEJson() {
    return <String, dynamic>{
      'id': id.toEJson(),
      'category': category.toEJson(),
      'name': name.toEJson(),
      'amount': amount.toEJson(),
      'notes': notes.toEJson(),
      'icon': icon.toEJson(),
      'datePaid': datePaid.toEJson(),
    };
  }

  static EJsonValue _toEJson(Expense value) => value.toEJson();
  static Expense _fromEJson(EJsonValue ejson) {
    if (ejson is! Map<String, dynamic>) return raiseInvalidEJson(ejson);
    return switch (ejson) {
      {
        'id': EJsonValue id,
        'name': EJsonValue name,
        'amount': EJsonValue amount,
        'datePaid': EJsonValue datePaid,
      } =>
        Expense(
          fromEJson(id),
          fromEJson(name),
          fromEJson(amount),
          fromEJson(datePaid),
          category: fromEJson(ejson['category']),
          notes: fromEJson(ejson['notes']),
          icon: fromEJson(ejson['icon']),
        ),
      _ => raiseInvalidEJson(ejson),
    };
  }

  static final schema = () {
    RealmObjectBase.registerFactory(Expense._);
    register(_toEJson, _fromEJson);
    return const SchemaObject(ObjectType.realmObject, Expense, 'Expense', [
      SchemaProperty('id', RealmPropertyType.objectid, primaryKey: true),
      SchemaProperty('category', RealmPropertyType.object,
          optional: true, linkTarget: 'ExpenseCategory'),
      SchemaProperty('name', RealmPropertyType.string),
      SchemaProperty('amount', RealmPropertyType.double),
      SchemaProperty('notes', RealmPropertyType.string, optional: true),
      SchemaProperty('icon', RealmPropertyType.int, optional: true),
      SchemaProperty('datePaid', RealmPropertyType.timestamp),
    ]);
  }();

  @override
  SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
}
