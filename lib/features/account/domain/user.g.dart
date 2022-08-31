// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AppUser _$$_AppUserFromJson(Map<String, dynamic> json) => _$_AppUser(
      id: json['id'] as String?,
      firstName: json['first_name'] as String,
      surname: json['surname'] as String,
      bvn: json['bvn'] as String,
      address: json['address'] as String,
      state: json['state'] as String,
      profilePics: json['profile_pics'] as String?,
      dateCreated: DateTime.parse(json['date_created'] as String),
    );

Map<String, dynamic> _$$_AppUserToJson(_$_AppUser instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  val['first_name'] = instance.firstName;
  val['surname'] = instance.surname;
  val['bvn'] = instance.bvn;
  val['address'] = instance.address;
  val['state'] = instance.state;
  writeNotNull('profile_pics', instance.profilePics);
  val['date_created'] = instance.dateCreated.toIso8601String();
  return val;
}
