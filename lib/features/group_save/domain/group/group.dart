import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:esusu_savings/constant/enum.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'group.freezed.dart';
part 'group.g.dart';

@freezed
class Group with _$Group {
  const Group._();
  const factory Group({
    String? id,
    required String name,
    @Default([]) List<String> members,
    required int totalParticipant,
    required String author,

    /// only needed for goal oriented plan
    double? savingGoal,

    /// only needed for goal oriented plan
    DateTime? duration,

    /// will be calculated if group type is goal oriented.
    required double savingAmount,
    required GroupsType type,
  }) = _Group;

  factory Group.fromJson(Map<String, dynamic> json) => _$GroupFromJson(json);

  static Group fromDocument(DocumentSnapshot<Map<String, dynamic>> doc) {
    final id = doc.id;
    final data = {"id": id, ...doc.data()!};
    return Group.fromJson(data);
  }
}
