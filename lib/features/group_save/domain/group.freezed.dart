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
  List<String> get members => throw _privateConstructorUsedError;
  @JsonKey(name: "saving_goal")
  double get savingGoal => throw _privateConstructorUsedError;
  @JsonEnum(fieldRename: FieldRename.snake)
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
      List<String> members,
      @JsonKey(name: "saving_goal") double savingGoal,
      @JsonEnum(fieldRename: FieldRename.snake) GroupsType type});
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
    Object? savingGoal = freezed,
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
              as List<String>,
      savingGoal: savingGoal == freezed
          ? _value.savingGoal
          : savingGoal // ignore: cast_nullable_to_non_nullable
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
      List<String> members,
      @JsonKey(name: "saving_goal") double savingGoal,
      @JsonEnum(fieldRename: FieldRename.snake) GroupsType type});
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
    Object? savingGoal = freezed,
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
              as List<String>,
      savingGoal: savingGoal == freezed
          ? _value.savingGoal
          : savingGoal // ignore: cast_nullable_to_non_nullable
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
class _$_Group extends _Group {
  const _$_Group(
      {this.id,
      required this.name,
      required final List<String> members,
      @JsonKey(name: "saving_goal") required this.savingGoal,
      @JsonEnum(fieldRename: FieldRename.snake) required this.type})
      : _members = members,
        super._();

  factory _$_Group.fromJson(Map<String, dynamic> json) =>
      _$$_GroupFromJson(json);

  @override
  final String? id;
  @override
  final String name;
  final List<String> _members;
  @override
  List<String> get members {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_members);
  }

  @override
  @JsonKey(name: "saving_goal")
  final double savingGoal;
  @override
  @JsonEnum(fieldRename: FieldRename.snake)
  final GroupsType type;

  @override
  String toString() {
    return 'Group(id: $id, name: $name, members: $members, savingGoal: $savingGoal, type: $type)';
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
                .equals(other.savingGoal, savingGoal) &&
            const DeepCollectionEquality().equals(other.type, type));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(_members),
      const DeepCollectionEquality().hash(savingGoal),
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

abstract class _Group extends Group {
  const factory _Group(
      {final String? id,
      required final String name,
      required final List<String> members,
      @JsonKey(name: "saving_goal")
          required final double savingGoal,
      @JsonEnum(fieldRename: FieldRename.snake)
          required final GroupsType type}) = _$_Group;
  const _Group._() : super._();

  factory _Group.fromJson(Map<String, dynamic> json) = _$_Group.fromJson;

  @override
  String? get id;
  @override
  String get name;
  @override
  List<String> get members;
  @override
  @JsonKey(name: "saving_goal")
  double get savingGoal;
  @override
  @JsonEnum(fieldRename: FieldRename.snake)
  GroupsType get type;
  @override
  @JsonKey(ignore: true)
  _$$_GroupCopyWith<_$_Group> get copyWith =>
      throw _privateConstructorUsedError;
}