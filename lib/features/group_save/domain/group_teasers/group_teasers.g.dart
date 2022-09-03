// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group_teasers.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_GroupTeaser _$$_GroupTeaserFromJson(Map<String, dynamic> json) =>
    _$_GroupTeaser(
      id: json['id'] as String?,
      groupId: json['group_id'] as String,
      type: $enumDecode(_$GroupsTypeEnumMap, json['type']),
      authorId: json['author_id'] as String,
      members: (json['members'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(
                k,
                e == null
                    ? null
                    : InvitedUser.fromJson(e as Map<String, dynamic>)),
          ) ??
          const {},
      name: json['name'] as String,
    );

Map<String, dynamic> _$$_GroupTeaserToJson(_$_GroupTeaser instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  val['group_id'] = instance.groupId;
  val['type'] = _$GroupsTypeEnumMap[instance.type]!;
  val['author_id'] = instance.authorId;
  val['members'] = instance.members.map((k, e) => MapEntry(k, e?.toJson()));
  val['name'] = instance.name;
  return val;
}

const _$GroupsTypeEnumMap = {
  GroupsType.goals: 'goals',
  GroupsType.rotational: 'rotational',
};
