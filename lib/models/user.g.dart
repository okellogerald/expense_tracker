// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      displayName: json['display_name'] as String,
      email: json['email'] as String,
      signUpOption: json['signup_option'] as String,
      photoUrl: json['photo_url'] as String,
      backUpOption: json['backup_option'] as String,
      currencyCodePoint: json['currency'] as int,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'display_name': instance.displayName,
      'email': instance.email,
      'signup_option': instance.signUpOption,
      'photo_url': instance.photoUrl,
      'backup_option': instance.backUpOption,
      'currency': instance.currencyCodePoint,
    };
