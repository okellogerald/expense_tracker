// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expense.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

// ignore_for_file: type=lint
class Expense extends $Expense with RealmEntity, RealmObjectBase, RealmObject {
  Expense(
    ObjectId id,
    double amount,
    DateTime date, {
    String? title,
    String? notes,
    ExpenseCategory? category,
  }) {
    RealmObjectBase.set(this, '_id', id);
    RealmObjectBase.set(this, 'amount', amount);
    RealmObjectBase.set(this, 'date', date);
    RealmObjectBase.set(this, 'title', title);
    RealmObjectBase.set(this, 'notes', notes);
    RealmObjectBase.set(this, 'category', category);
  }

  Expense._();

  @override
  ObjectId get id => RealmObjectBase.get<ObjectId>(this, '_id') as ObjectId;
  @override
  set id(ObjectId value) => RealmObjectBase.set(this, '_id', value);

  @override
  double get amount => RealmObjectBase.get<double>(this, 'amount') as double;
  @override
  set amount(double value) => RealmObjectBase.set(this, 'amount', value);

  @override
  DateTime get date => RealmObjectBase.get<DateTime>(this, 'date') as DateTime;
  @override
  set date(DateTime value) => RealmObjectBase.set(this, 'date', value);

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
  Stream<RealmObjectChanges<Expense>> get changes =>
      RealmObjectBase.getChanges<Expense>(this);

  @override
  Stream<RealmObjectChanges<Expense>> changesFor([List<String>? keyPaths]) =>
      RealmObjectBase.getChangesFor<Expense>(this, keyPaths);

  @override
  Expense freeze() => RealmObjectBase.freezeObject<Expense>(this);

  EJsonValue toEJson() {
    return <String, dynamic>{
      '_id': id.toEJson(),
      'amount': amount.toEJson(),
      'date': date.toEJson(),
      'title': title.toEJson(),
      'notes': notes.toEJson(),
      'category': category.toEJson(),
    };
  }

  static EJsonValue _toEJson(Expense value) => value.toEJson();
  static Expense _fromEJson(EJsonValue ejson) {
    if (ejson is! Map<String, dynamic>) return raiseInvalidEJson(ejson);
    return switch (ejson) {
      {
        '_id': EJsonValue id,
        'amount': EJsonValue amount,
        'date': EJsonValue date,
      } =>
        Expense(
          fromEJson(id),
          fromEJson(amount),
          fromEJson(date),
          title: fromEJson(ejson['title']),
          notes: fromEJson(ejson['notes']),
          category: fromEJson(ejson['category']),
        ),
      _ => raiseInvalidEJson(ejson),
    };
  }

  static final schema = () {
    RealmObjectBase.registerFactory(Expense._);
    register(_toEJson, _fromEJson);
    return const SchemaObject(ObjectType.realmObject, Expense, 'Expense', [
      SchemaProperty('id', RealmPropertyType.objectid,
          mapTo: '_id', primaryKey: true),
      SchemaProperty('amount', RealmPropertyType.double),
      SchemaProperty('date', RealmPropertyType.timestamp),
      SchemaProperty('title', RealmPropertyType.string, optional: true),
      SchemaProperty('notes', RealmPropertyType.string, optional: true),
      SchemaProperty('category', RealmPropertyType.object,
          optional: true, linkTarget: 'ExpenseCategory'),
    ]);
  }();

  @override
  SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
}
