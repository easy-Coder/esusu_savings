// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AppUser _$$_AppUserFromJson(Map<String, dynamic> json) => _$_AppUser(
      id: json['id'] as String,
      username: json['username'] as String,
      firstName: json['first_name'] as String,
      surname: json['surname'] as String,
      bvn: json['bvn'] as String,
      profilePics: json['profile_pics'] as String?,
      dateCreated: json['date_created'] == null
          ? null
          : DateTime.parse(json['date_created'] as String),
    );

Map<String, dynamic> _$$_AppUserToJson(_$_AppUser instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'first_name': instance.firstName,
      'surname': instance.surname,
      'bvn': instance.bvn,
      'profile_pics': instance.profilePics,
      'date_created': instance.dateCreated?.toIso8601String(),
    };
