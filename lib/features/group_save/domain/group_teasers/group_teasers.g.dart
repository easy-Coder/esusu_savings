// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group_teasers.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_GroupTeaser _$$_GroupTeaserFromJson(Map<String, dynamic> json) =>
    _$_GroupTeaser(
      id: json['id'] as String?,
      groupId: json['group_id'] as String,
      authorId: json['author_id'] as String,
      members: (json['members'] as List<dynamic>?)
              ?.map((e) => Map<String, String>.from(e as Map))
              .toList() ??
          const [],
      name: json['name'] as String,
    );

Map<String, dynamic> _$$_GroupTeaserToJson(_$_GroupTeaser instance) =>
    <String, dynamic>{
      'id': instance.id,
      'group_id': instance.groupId,
      'author_id': instance.authorId,
      'members': instance.members,
      'name': instance.name,
    };
