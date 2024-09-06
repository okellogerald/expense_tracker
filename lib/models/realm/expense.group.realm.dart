// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expense.group.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

// ignore_for_file: type=lint
class ExpenseGroup extends $ExpenseGroup
    with RealmEntity, RealmObjectBase, RealmObject {
  ExpenseGroup(
    ObjectId id,
    String name, {
    String? notes,
  }) {
    RealmObjectBase.set(this, 'id', id);
    RealmObjectBase.set(this, 'name', name);
    RealmObjectBase.set(this, 'notes', notes);
  }

  ExpenseGroup._();

  @override
  ObjectId get id => RealmObjectBase.get<ObjectId>(this, 'id') as ObjectId;
  @override
  set id(ObjectId value) => RealmObjectBase.set(this, 'id', value);

  @override
  String get name => RealmObjectBase.get<String>(this, 'name') as String;
  @override
  set name(String value) => RealmObjectBase.set(this, 'name', value);

  @override
  String? get notes => RealmObjectBase.get<String>(this, 'notes') as String?;
  @override
  set notes(String? value) => RealmObjectBase.set(this, 'notes', value);

  @override
  Stream<RealmObjectChanges<ExpenseGroup>> get changes =>
      RealmObjectBase.getChanges<ExpenseGroup>(this);

  @override
  Stream<RealmObjectChanges<ExpenseGroup>> changesFor(
          [List<String>? keyPaths]) =>
      RealmObjectBase.getChangesFor<ExpenseGroup>(this, keyPaths);

  @override
  ExpenseGroup freeze() => RealmObjectBase.freezeObject<ExpenseGroup>(this);

  EJsonValue toEJson() {
    return <String, dynamic>{
      'id': id.toEJson(),
      'name': name.toEJson(),
      'notes': notes.toEJson(),
    };
  }

  static EJsonValue _toEJson(ExpenseGroup value) => value.toEJson();
  static ExpenseGroup _fromEJson(EJsonValue ejson) {
    if (ejson is! Map<String, dynamic>) return raiseInvalidEJson(ejson);
    return switch (ejson) {
      {
        'id': EJsonValue id,
        'name': EJsonValue name,
      } =>
        ExpenseGroup(
          fromEJson(id),
          fromEJson(name),
          notes: fromEJson(ejson['notes']),
        ),
      _ => raiseInvalidEJson(ejson),
    };
  }

  static final schema = () {
    RealmObjectBase.registerFactory(ExpenseGroup._);
    register(_toEJson, _fromEJson);
    return const SchemaObject(
        ObjectType.realmObject, ExpenseGroup, 'ExpenseGroup', [
      SchemaProperty('id', RealmPropertyType.objectid, primaryKey: true),
      SchemaProperty('name', RealmPropertyType.string),
      SchemaProperty('notes', RealmPropertyType.string, optional: true),
    ]);
  }();

  @override
  SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
}
