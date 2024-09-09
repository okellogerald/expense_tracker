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
    double amount,
    DateTime payDate, {
    String? title,
    String? notes,
    ExpenseCategory? category,
  }) {
    RealmObjectBase.set(this, '_id', id);
    RealmObjectBase.set(this, 'amount', amount);
    RealmObjectBase.set(this, 'payDate', payDate);
    RealmObjectBase.set(this, 'title', title);
    RealmObjectBase.set(this, 'notes', notes);
    RealmObjectBase.set(this, 'category', category);
  }

  FutureExpense._();

  @override
  ObjectId get id => RealmObjectBase.get<ObjectId>(this, '_id') as ObjectId;
  @override
  set id(ObjectId value) => RealmObjectBase.set(this, '_id', value);

  @override
  double get amount => RealmObjectBase.get<double>(this, 'amount') as double;
  @override
  set amount(double value) => RealmObjectBase.set(this, 'amount', value);

  @override
  DateTime get payDate =>
      RealmObjectBase.get<DateTime>(this, 'payDate') as DateTime;
  @override
  set payDate(DateTime value) => RealmObjectBase.set(this, 'payDate', value);

  @override
  String? get title => RealmObjectBase.get<String>(this, 'title') as String?;
  @override
  set title(String? value) => RealmObjectBase.set(this, 'title', value);

  @override
  String? get notes => RealmObjectBase.get<String>(this, 'notes') as String?;
  @override
  set notes(String? value) => RealmObjectBase.set(this, 'notes', value);

  @override
  ExpenseCategory? get category =>
      RealmObjectBase.get<ExpenseCategory>(this, 'category')
          as ExpenseCategory?;
  @override
  set category(covariant ExpenseCategory? value) =>
      RealmObjectBase.set(this, 'category', value);

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
      '_id': id.toEJson(),
      'amount': amount.toEJson(),
      'payDate': payDate.toEJson(),
      'title': title.toEJson(),
      'notes': notes.toEJson(),
      'category': category.toEJson(),
    };
  }

  static EJsonValue _toEJson(FutureExpense value) => value.toEJson();
  static FutureExpense _fromEJson(EJsonValue ejson) {
    if (ejson is! Map<String, dynamic>) return raiseInvalidEJson(ejson);
    return switch (ejson) {
      {
        '_id': EJsonValue id,
        'amount': EJsonValue amount,
        'payDate': EJsonValue payDate,
      } =>
        FutureExpense(
          fromEJson(id),
          fromEJson(amount),
          fromEJson(payDate),
          title: fromEJson(ejson['title']),
          notes: fromEJson(ejson['notes']),
          category: fromEJson(ejson['category']),
        ),
      _ => raiseInvalidEJson(ejson),
    };
  }

  static final schema = () {
    RealmObjectBase.registerFactory(FutureExpense._);
    register(_toEJson, _fromEJson);
    return const SchemaObject(
        ObjectType.realmObject, FutureExpense, 'FutureExpense', [
      SchemaProperty('id', RealmPropertyType.objectid,
          mapTo: '_id', primaryKey: true),
      SchemaProperty('amount', RealmPropertyType.double),
      SchemaProperty('payDate', RealmPropertyType.timestamp),
      SchemaProperty('title', RealmPropertyType.string, optional: true),
      SchemaProperty('notes', RealmPropertyType.string, optional: true),
      SchemaProperty('category', RealmPropertyType.object,
          optional: true, linkTarget: 'ExpenseCategory'),
    ]);
  }();

  @override
  SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
}
