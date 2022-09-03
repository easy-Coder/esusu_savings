// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'group.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Group _$GroupFromJson(Map<String, dynamic> json) {
  return _Group.fromJson(json);
}

/// @nodoc
mixin _$Group {
  String? get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  List<InvitedUser?> get members => throw _privateConstructorUsedError;
  int get totalParticipant => throw _privateConstructorUsedError;
  String get author => throw _privateConstructorUsedError;

  /// only needed for goal oriented plan
  double? get savingGoal => throw _privateConstructorUsedError;

  /// only needed for goal oriented plan
  DateTime? get duration => throw _privateConstructorUsedError;

  /// will be calculated if group type is goal oriented.
  double get savingAmount => throw _privateConstructorUsedError;
  GroupsType get type => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GroupCopyWith<Group> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GroupCopyWith<$Res> {
  factory $GroupCopyWith(Group value, $Res Function(Group) then) =
      _$GroupCopyWithImpl<$Res>;
  $Res call(
      {String? id,
      String name,
      List<InvitedUser?> members,
      int totalParticipant,
      String author,
      double? savingGoal,
      DateTime? duration,
      double savingAmount,
      GroupsType type});
}

/// @nodoc
class _$GroupCopyWithImpl<$Res> implements $GroupCopyWith<$Res> {
  _$GroupCopyWithImpl(this._value, this._then);

  final Group _value;
  // ignore: unused_field
  final $Res Function(Group) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? members = freezed,
    Object? totalParticipant = freezed,
    Object? author = freezed,
    Object? savingGoal = freezed,
    Object? duration = freezed,
    Object? savingAmount = freezed,
    Object? type = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      members: members == freezed
          ? _value.members
          : members // ignore: cast_nullable_to_non_nullable
              as List<InvitedUser?>,
      totalParticipant: totalParticipant == freezed
          ? _value.totalParticipant
          : totalParticipant // ignore: cast_nullable_to_non_nullable
              as int,
      author: author == freezed
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as String,
      savingGoal: savingGoal == freezed
          ? _value.savingGoal
          : savingGoal // ignore: cast_nullable_to_non_nullable
              as double?,
      duration: duration == freezed
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      savingAmount: savingAmount == freezed
          ? _value.savingAmount
          : savingAmount // ignore: cast_nullable_to_non_nullable
              as double,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as GroupsType,
    ));
  }
}

/// @nodoc
abstract class _$$_GroupCopyWith<$Res> implements $GroupCopyWith<$Res> {
  factory _$$_GroupCopyWith(_$_Group value, $Res Function(_$_Group) then) =
      __$$_GroupCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? id,
      String name,
      List<InvitedUser?> members,
      int totalParticipant,
      String author,
      double? savingGoal,
      DateTime? duration,
      double savingAmount,
      GroupsType type});
}

/// @nodoc
class __$$_GroupCopyWithImpl<$Res> extends _$GroupCopyWithImpl<$Res>
    implements _$$_GroupCopyWith<$Res> {
  __$$_GroupCopyWithImpl(_$_Group _value, $Res Function(_$_Group) _then)
      : super(_value, (v) => _then(v as _$_Group));

  @override
  _$_Group get _value => super._value as _$_Group;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? members = freezed,
    Object? totalParticipant = freezed,
    Object? author = freezed,
    Object? savingGoal = freezed,
    Object? duration = freezed,
    Object? savingAmount = freezed,
    Object? type = freezed,
  }) {
    return _then(_$_Group(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      members: members == freezed
          ? _value._members
          : members // ignore: cast_nullable_to_non_nullable
              as List<InvitedUser?>,
      totalParticipant: totalParticipant == freezed
          ? _value.totalParticipant
          : totalParticipant // ignore: cast_nullable_to_non_nullable
              as int,
      author: author == freezed
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as String,
      savingGoal: savingGoal == freezed
          ? _value.savingGoal
          : savingGoal // ignore: cast_nullable_to_non_nullable
              as double?,
      duration: duration == freezed
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      savingAmount: savingAmount == freezed
          ? _value.savingAmount
          : savingAmount // ignore: cast_nullable_to_non_nullable
              as double,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as GroupsType,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Group implements _Group {
  const _$_Group(
      {this.id,
      required this.name,
      final List<InvitedUser?> members = const [],
      required this.totalParticipant,
      required this.author,
      this.savingGoal,
      this.duration,
      required this.savingAmount,
      required this.type})
      : _members = members;

  factory _$_Group.fromJson(Map<String, dynamic> json) =>
      _$$_GroupFromJson(json);

  @override
  final String? id;
  @override
  final String name;
  final List<InvitedUser?> _members;
  @override
  @JsonKey()
  List<InvitedUser?> get members {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_members);
  }

  @override
  final int totalParticipant;
  @override
  final String author;

  /// only needed for goal oriented plan
  @override
  final double? savingGoal;

  /// only needed for goal oriented plan
  @override
  final DateTime? duration;

  /// will be calculated if group type is goal oriented.
  @override
  final double savingAmount;
  @override
  final GroupsType type;

  @override
  String toString() {
    return 'Group(id: $id, name: $name, members: $members, totalParticipant: $totalParticipant, author: $author, savingGoal: $savingGoal, duration: $duration, savingAmount: $savingAmount, type: $type)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Group &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other._members, _members) &&
            const DeepCollectionEquality()
                .equals(other.totalParticipant, totalParticipant) &&
            const DeepCollectionEquality().equals(other.author, author) &&
            const DeepCollectionEquality()
                .equals(other.savingGoal, savingGoal) &&
            const DeepCollectionEquality().equals(other.duration, duration) &&
            const DeepCollectionEquality()
                .equals(other.savingAmount, savingAmount) &&
            const DeepCollectionEquality().equals(other.type, type));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(_members),
      const DeepCollectionEquality().hash(totalParticipant),
      const DeepCollectionEquality().hash(author),
      const DeepCollectionEquality().hash(savingGoal),
      const DeepCollectionEquality().hash(duration),
      const DeepCollectionEquality().hash(savingAmount),
      const DeepCollectionEquality().hash(type));

  @JsonKey(ignore: true)
  @override
  _$$_GroupCopyWith<_$_Group> get copyWith =>
      __$$_GroupCopyWithImpl<_$_Group>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GroupToJson(
      this,
    );
  }
}

abstract class _Group implements Group {
  const factory _Group(
      {final String? id,
      required final String name,
      final List<InvitedUser?> members,
      required final int totalParticipant,
      required final String author,
      final double? savingGoal,
      final DateTime? duration,
      required final double savingAmount,
      required final GroupsType type}) = _$_Group;

  factory _Group.fromJson(Map<String, dynamic> json) = _$_Group.fromJson;

  @override
  String? get id;
  @override
  String get name;
  @override
  List<InvitedUser?> get members;
  @override
  int get totalParticipant;
  @override
  String get author;
  @override

  /// only needed for goal oriented plan
  double? get savingGoal;
  @override

  /// only needed for goal oriented plan
  DateTime? get duration;
  @override

  /// will be calculated if group type is goal oriented.
  double get savingAmount;
  @override
  GroupsType get type;
  @override
  @JsonKey(ignore: true)
  _$$_GroupCopyWith<_$_Group> get copyWith =>
      throw _privateConstructorUsedError;
}
