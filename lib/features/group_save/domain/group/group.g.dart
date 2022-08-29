// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Group _$$_GroupFromJson(Map<String, dynamic> json) => _$_Group(
      id: json['id'] as String?,
      name: json['name'] as String,
      members: (json['members'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      author: json['author'] as String,
      savingGoal: (json['saving_goal'] as num).toDouble(),
      savingAmount: (json['saving_amount'] as num).toDouble(),
      type: $enumDecode(_$GroupsTypeEnumMap, json['type']),
    );

Map<String, dynamic> _$$_GroupToJson(_$_Group instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'members': instance.members,
      'author': instance.author,
      'saving_goal': instance.savingGoal,
      'saving_amount': instance.savingAmount,
      'type': _$GroupsTypeEnumMap[instance.type]!,
    };

const _$GroupsTypeEnumMap = {
  GroupsType.goals: 'goals',
  GroupsType.rotational: 'rotational',
};
