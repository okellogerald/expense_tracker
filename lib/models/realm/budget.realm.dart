// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'budget.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

// ignore_for_file: type=lint
class Budget extends $Budget with RealmEntity, RealmObjectBase, RealmObject {
  Budget(
    ObjectId id,
    double amount, {
    ExpenseCategory? category,
    ExpenseGroup? group,
    String? notes,
  }) {
    RealmObjectBase.set(this, '_id', id);
    RealmObjectBase.set(this, 'category', category);
    RealmObjectBase.set(this, 'group', group);
    RealmObjectBase.set(this, 'amount', amount);
    RealmObjectBase.set(this, 'notes', notes);
  }

  Budget._();

  @override
  ObjectId get id => RealmObjectBase.get<ObjectId>(this, '_id') as ObjectId;
  @override
  set id(ObjectId value) => RealmObjectBase.set(this, '_id', value);

  @override
  ExpenseCategory? get category =>
      RealmObjectBase.get<ExpenseCategory>(this, 'category')
          as ExpenseCategory?;
  @override
  set category(covariant ExpenseCategory? value) =>
      RealmObjectBase.set(this, 'category', value);

  @override
  ExpenseGroup? get group =>
      RealmObjectBase.get<ExpenseGroup>(this, 'group') as ExpenseGroup?;
  @override
  set group(covariant ExpenseGroup? value) =>
      RealmObjectBase.set(this, 'group', value);

  @override
  double get amount => RealmObjectBase.get<double>(this, 'amount') as double;
  @override
  set amount(double value) => RealmObjectBase.set(this, 'amount', value);

  @override
  String? get notes => RealmObjectBase.get<String>(this, 'notes') as String?;
  @override
  set notes(String? value) => RealmObjectBase.set(this, 'notes', value);

  @override
  Stream<RealmObjectChanges<Budget>> get changes =>
      RealmObjectBase.getChanges<Budget>(this);

  @override
  Stream<RealmObjectChanges<Budget>> changesFor([List<String>? keyPaths]) =>
      RealmObjectBase.getChangesFor<Budget>(this, keyPaths);

  @override
  Budget freeze() => RealmObjectBase.freezeObject<Budget>(this);

  EJsonValue toEJson() {
    return <String, dynamic>{
      '_id': id.toEJson(),
      'category': category.toEJson(),
      'group': group.toEJson(),
      'amount': amount.toEJson(),
      'notes': notes.toEJson(),
    };
  }

  static EJsonValue _toEJson(Budget value) => value.toEJson();
  static Budget _fromEJson(EJsonValue ejson) {
    if (ejson is! Map<String, dynamic>) return raiseInvalidEJson(ejson);
    return switch (ejson) {
      {
        '_id': EJsonValue id,
        'amount': EJsonValue amount,
      } =>
        Budget(
          fromEJson(id),
          fromEJson(amount),
          category: fromEJson(ejson['category']),
          group: fromEJson(ejson['group']),
          notes: fromEJson(ejson['notes']),
        ),
      _ => raiseInvalidEJson(ejson),
    };
  }

  static final schema = () {
    RealmObjectBase.registerFactory(Budget._);
    register(_toEJson, _fromEJson);
    return const SchemaObject(ObjectType.realmObject, Budget, 'Budget', [
      SchemaProperty('id', RealmPropertyType.objectid,
          mapTo: '_id', primaryKey: true),
      SchemaProperty('category', RealmPropertyType.object,
          optional: true, linkTarget: 'ExpenseCategory'),
      SchemaProperty('group', RealmPropertyType.object,
          optional: true, linkTarget: 'ExpenseGroup'),
      SchemaProperty('amount', RealmPropertyType.double),
      SchemaProperty('notes', RealmPropertyType.string, optional: true),
    ]);
  }();

  @override
  SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
}
