// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expense.category.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

// ignore_for_file: type=lint
class ExpenseCategory extends $ExpenseCategory
    with RealmEntity, RealmObjectBase, RealmObject {
  ExpenseCategory(
    ObjectId id,
    String name, {
    ExpenseGroup? group,
    int? icon,
    String? notes,
  }) {
    RealmObjectBase.set(this, 'id', id);
    RealmObjectBase.set(this, 'name', name);
    RealmObjectBase.set(this, 'group', group);
    RealmObjectBase.set(this, 'icon', icon);
    RealmObjectBase.set(this, 'notes', notes);
  }

  ExpenseCategory._();

  @override
  ObjectId get id => RealmObjectBase.get<ObjectId>(this, 'id') as ObjectId;
  @override
  set id(ObjectId value) => RealmObjectBase.set(this, 'id', value);

  @override
  String get name => RealmObjectBase.get<String>(this, 'name') as String;
  @override
  set name(String value) => RealmObjectBase.set(this, 'name', value);

  @override
  ExpenseGroup? get group =>
      RealmObjectBase.get<ExpenseGroup>(this, 'group') as ExpenseGroup?;
  @override
  set group(covariant ExpenseGroup? value) =>
      RealmObjectBase.set(this, 'group', value);

  @override
  int? get icon => RealmObjectBase.get<int>(this, 'icon') as int?;
  @override
  set icon(int? value) => RealmObjectBase.set(this, 'icon', value);

  @override
  String? get notes => RealmObjectBase.get<String>(this, 'notes') as String?;
  @override
  set notes(String? value) => RealmObjectBase.set(this, 'notes', value);

  @override
  Stream<RealmObjectChanges<ExpenseCategory>> get changes =>
      RealmObjectBase.getChanges<ExpenseCategory>(this);

  @override
  Stream<RealmObjectChanges<ExpenseCategory>> changesFor(
          [List<String>? keyPaths]) =>
      RealmObjectBase.getChangesFor<ExpenseCategory>(this, keyPaths);

  @override
  ExpenseCategory freeze() =>
      RealmObjectBase.freezeObject<ExpenseCategory>(this);

  EJsonValue toEJson() {
    return <String, dynamic>{
      'id': id.toEJson(),
      'name': name.toEJson(),
      'group': group.toEJson(),
      'icon': icon.toEJson(),
      'notes': notes.toEJson(),
    };
  }

  static EJsonValue _toEJson(ExpenseCategory value) => value.toEJson();
  static ExpenseCategory _fromEJson(EJsonValue ejson) {
    if (ejson is! Map<String, dynamic>) return raiseInvalidEJson(ejson);
    return switch (ejson) {
      {
        'id': EJsonValue id,
        'name': EJsonValue name,
      } =>
        ExpenseCategory(
          fromEJson(id),
          fromEJson(name),
          group: fromEJson(ejson['group']),
          icon: fromEJson(ejson['icon']),
          notes: fromEJson(ejson['notes']),
        ),
      _ => raiseInvalidEJson(ejson),
    };
  }

  static final schema = () {
    RealmObjectBase.registerFactory(ExpenseCategory._);
    register(_toEJson, _fromEJson);
    return const SchemaObject(
        ObjectType.realmObject, ExpenseCategory, 'ExpenseCategory', [
      SchemaProperty('id', RealmPropertyType.objectid, primaryKey: true),
      SchemaProperty('name', RealmPropertyType.string),
      SchemaProperty('group', RealmPropertyType.object,
          optional: true, linkTarget: 'ExpenseGroup'),
      SchemaProperty('icon', RealmPropertyType.int, optional: true),
      SchemaProperty('notes', RealmPropertyType.string, optional: true),
    ]);
  }();

  @override
  SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
}
