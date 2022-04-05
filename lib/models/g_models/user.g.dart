// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_User _$$_UserFromJson(Map<String, dynamic> json) => _$_User(
      displayName: json['display_name'] as String? ?? '',
      email: json['email'] as String? ?? '',
      signUpOption:
          json['signup_option'] as String? ?? SigningUpOptions.email_password,
      photoUrl: json['photo_url'] as String? ?? '',
      backUpOption:
          json['backup_option'] as String? ?? BackUpOptions.on_button_tap,
      currency: json['currency'] as String? ?? '',
    );

Map<String, dynamic> _$$_UserToJson(_$_User instance) => <String, dynamic>{
      'display_name': instance.displayName,
      'email': instance.email,
      'signup_option': instance.signUpOption,
      'photo_url': instance.photoUrl,
      'backup_option': instance.backUpOption,
      'currency': instance.currency,
    };
