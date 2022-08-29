// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Group _$$_GroupFromJson(Map<String, dynamic> json) => _$_Group(
      id: json['id'] as String?,
      name: json['name'] as String,
      members:
          (json['members'] as List<dynamic>).map((e) => e as String).toList(),
      savingGoal: (json['saving_goal'] as num).toDouble(),
      type: $enumDecode(_$GroupsTypeEnumMap, json['type']),
    );

Map<String, dynamic> _$$_GroupToJson(_$_Group instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'members': instance.members,
      'saving_goal': instance.savingGoal,
      'type': _$GroupsTypeEnumMap[instance.type]!,
    };

const _$GroupsTypeEnumMap = {
  GroupsType.goals: 'goals',
  GroupsType.rotational: 'rotational',
};
