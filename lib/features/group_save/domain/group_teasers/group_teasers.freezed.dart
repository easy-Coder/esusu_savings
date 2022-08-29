// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'group_teasers.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GroupTeaser _$GroupTeaserFromJson(Map<String, dynamic> json) {
  return _GroupTeaser.fromJson(json);
}

/// @nodoc
mixin _$GroupTeaser {
  String? get id => throw _privateConstructorUsedError;
  String get groupId => throw _privateConstructorUsedError;
  String get authorId => throw _privateConstructorUsedError;
  List<dynamic> get members => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GroupTeaserCopyWith<GroupTeaser> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GroupTeaserCopyWith<$Res> {
  factory $GroupTeaserCopyWith(
          GroupTeaser value, $Res Function(GroupTeaser) then) =
      _$GroupTeaserCopyWithImpl<$Res>;
  $Res call(
      {String? id,
      String groupId,
      String authorId,
      List<dynamic> members,
      String name});
}

/// @nodoc
class _$GroupTeaserCopyWithImpl<$Res> implements $GroupTeaserCopyWith<$Res> {
  _$GroupTeaserCopyWithImpl(this._value, this._then);

  final GroupTeaser _value;
  // ignore: unused_field
  final $Res Function(GroupTeaser) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? groupId = freezed,
    Object? authorId = freezed,
    Object? members = freezed,
    Object? name = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      groupId: groupId == freezed
          ? _value.groupId
          : groupId // ignore: cast_nullable_to_non_nullable
              as String,
      authorId: authorId == freezed
          ? _value.authorId
          : authorId // ignore: cast_nullable_to_non_nullable
              as String,
      members: members == freezed
          ? _value.members
          : members // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_GroupTeaserCopyWith<$Res>
    implements $GroupTeaserCopyWith<$Res> {
  factory _$$_GroupTeaserCopyWith(
          _$_GroupTeaser value, $Res Function(_$_GroupTeaser) then) =
      __$$_GroupTeaserCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? id,
      String groupId,
      String authorId,
      List<dynamic> members,
      String name});
}

/// @nodoc
class __$$_GroupTeaserCopyWithImpl<$Res> extends _$GroupTeaserCopyWithImpl<$Res>
    implements _$$_GroupTeaserCopyWith<$Res> {
  __$$_GroupTeaserCopyWithImpl(
      _$_GroupTeaser _value, $Res Function(_$_GroupTeaser) _then)
      : super(_value, (v) => _then(v as _$_GroupTeaser));

  @override
  _$_GroupTeaser get _value => super._value as _$_GroupTeaser;

  @override
  $Res call({
    Object? id = freezed,
    Object? groupId = freezed,
    Object? authorId = freezed,
    Object? members = freezed,
    Object? name = freezed,
  }) {
    return _then(_$_GroupTeaser(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      groupId: groupId == freezed
          ? _value.groupId
          : groupId // ignore: cast_nullable_to_non_nullable
              as String,
      authorId: authorId == freezed
          ? _value.authorId
          : authorId // ignore: cast_nullable_to_non_nullable
              as String,
      members: members == freezed
          ? _value._members
          : members // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_GroupTeaser extends _GroupTeaser {
  _$_GroupTeaser(
      {this.id,
      required this.groupId,
      required this.authorId,
      final List<dynamic> members = const [],
      required this.name})
      : _members = members,
        super._();

  factory _$_GroupTeaser.fromJson(Map<String, dynamic> json) =>
      _$$_GroupTeaserFromJson(json);

  @override
  final String? id;
  @override
  final String groupId;
  @override
  final String authorId;
  final List<dynamic> _members;
  @override
  @JsonKey()
  List<dynamic> get members {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_members);
  }

  @override
  final String name;

  @override
  String toString() {
    return 'GroupTeaser(id: $id, groupId: $groupId, authorId: $authorId, members: $members, name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GroupTeaser &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.groupId, groupId) &&
            const DeepCollectionEquality().equals(other.authorId, authorId) &&
            const DeepCollectionEquality().equals(other._members, _members) &&
            const DeepCollectionEquality().equals(other.name, name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(groupId),
      const DeepCollectionEquality().hash(authorId),
      const DeepCollectionEquality().hash(_members),
      const DeepCollectionEquality().hash(name));

  @JsonKey(ignore: true)
  @override
  _$$_GroupTeaserCopyWith<_$_GroupTeaser> get copyWith =>
      __$$_GroupTeaserCopyWithImpl<_$_GroupTeaser>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GroupTeaserToJson(
      this,
    );
  }
}

abstract class _GroupTeaser extends GroupTeaser {
  factory _GroupTeaser(
      {final String? id,
      required final String groupId,
      required final String authorId,
      final List<dynamic> members,
      required final String name}) = _$_GroupTeaser;
  _GroupTeaser._() : super._();

  factory _GroupTeaser.fromJson(Map<String, dynamic> json) =
      _$_GroupTeaser.fromJson;

  @override
  String? get id;
  @override
  String get groupId;
  @override
  String get authorId;
  @override
  List<dynamic> get members;
  @override
  String get name;
  @override
  @JsonKey(ignore: true)
  _$$_GroupTeaserCopyWith<_$_GroupTeaser> get copyWith =>
      throw _privateConstructorUsedError;
}
