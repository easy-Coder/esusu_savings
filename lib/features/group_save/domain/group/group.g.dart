// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Group _$$_GroupFromJson(Map<String, dynamic> json) => _$_Group(
      id: json['id'] as String?,
      name: json['name'] as String,
      members: (json['members'] as List<dynamic>?)
              ?.map((e) => e == null
                  ? null
                  : InvitedUser.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      totalParticipant: json['total_participant'] as int,
      author: json['author'] as String,
      savingGoal: (json['saving_goal'] as num?)?.toDouble(),
      duration: json['duration'] == null
          ? null
          : DateTime.parse(json['duration'] as String),
      savingAmount: (json['saving_amount'] as num).toDouble(),
      type: $enumDecode(_$GroupsTypeEnumMap, json['type']),
    );

Map<String, dynamic> _$$_GroupToJson(_$_Group instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  val['name'] = instance.name;
  val['members'] = instance.members.map((e) => e?.toJson()).toList();
  val['total_participant'] = instance.totalParticipant;
  val['author'] = instance.author;
  writeNotNull('saving_goal', instance.savingGoal);
  writeNotNull('duration', instance.duration?.toIso8601String());
  val['saving_amount'] = instance.savingAmount;
  val['type'] = _$GroupsTypeEnumMap[instance.type]!;
  return val;
}

const _$GroupsTypeEnumMap = {
  GroupsType.goals: 'goals',
  GroupsType.rotational: 'rotational',
};
