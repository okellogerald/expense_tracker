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
    int? icon,
    String? notes,
    ExpenseGroup? group,
  }) {
    RealmObjectBase.set(this, '_id', id);
    RealmObjectBase.set(this, 'name', name);
    RealmObjectBase.set(this, 'icon', icon);
    RealmObjectBase.set(this, 'notes', notes);
    RealmObjectBase.set(this, 'group', group);
  }

  ExpenseCategory._();

  @override
  ObjectId get id => RealmObjectBase.get<ObjectId>(this, '_id') as ObjectId;
  @override
  set id(ObjectId value) => RealmObjectBase.set(this, '_id', value);

  @override
  String get name => RealmObjectBase.get<String>(this, 'name') as String;
  @override
  set name(String value) => RealmObjectBase.set(this, 'name', value);

  @override
  int? get icon => RealmObjectBase.get<int>(this, 'icon') as int?;
  @override
  set icon(int? value) => RealmObjectBase.set(this, 'icon', value);

  @override
  String? get notes => RealmObjectBase.get<String>(this, 'notes') as String?;
  @override
  set notes(String? value) => RealmObjectBase.set(this, 'notes', value);

  @override
  ExpenseGroup? get group =>
      RealmObjectBase.get<ExpenseGroup>(this, 'group') as ExpenseGroup?;
  @override
  set group(covariant ExpenseGroup? value) =>
      RealmObjectBase.set(this, 'group', value);

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
      '_id': id.toEJson(),
      'name': name.toEJson(),
      'icon': icon.toEJson(),
      'notes': notes.toEJson(),
      'group': group.toEJson(),
    };
  }

  static EJsonValue _toEJson(ExpenseCategory value) => value.toEJson();
  static ExpenseCategory _fromEJson(EJsonValue ejson) {
    if (ejson is! Map<String, dynamic>) return raiseInvalidEJson(ejson);
    return switch (ejson) {
      {
        '_id': EJsonValue id,
        'name': EJsonValue name,
      } =>
        ExpenseCategory(
          fromEJson(id),
          fromEJson(name),
          icon: fromEJson(ejson['icon']),
          notes: fromEJson(ejson['notes']),
          group: fromEJson(ejson['group']),
        ),
      _ => raiseInvalidEJson(ejson),
    };
  }

  static final schema = () {
    RealmObjectBase.registerFactory(ExpenseCategory._);
    register(_toEJson, _fromEJson);
    return const SchemaObject(
        ObjectType.realmObject, ExpenseCategory, 'ExpenseCategory', [
      SchemaProperty('id', RealmPropertyType.objectid,
          mapTo: '_id', primaryKey: true),
      SchemaProperty('name', RealmPropertyType.string),
      SchemaProperty('icon', RealmPropertyType.int, optional: true),
      SchemaProperty('notes', RealmPropertyType.string, optional: true),
      SchemaProperty('group', RealmPropertyType.object,
          optional: true, linkTarget: 'ExpenseGroup'),
    ]);
  }();

  @override
  SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
}
