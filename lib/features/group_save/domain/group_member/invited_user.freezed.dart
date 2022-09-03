// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'invited_user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

InvitedUser _$InvitedUserFromJson(Map<String, dynamic> json) {
  return _InvitedUser.fromJson(json);
}

/// @nodoc
mixin _$InvitedUser {
  String get user_id => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;
  String get photoUrl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $InvitedUserCopyWith<InvitedUser> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InvitedUserCopyWith<$Res> {
  factory $InvitedUserCopyWith(
          InvitedUser value, $Res Function(InvitedUser) then) =
      _$InvitedUserCopyWithImpl<$Res>;
  $Res call({String user_id, String username, String photoUrl});
}

/// @nodoc
class _$InvitedUserCopyWithImpl<$Res> implements $InvitedUserCopyWith<$Res> {
  _$InvitedUserCopyWithImpl(this._value, this._then);

  final InvitedUser _value;
  // ignore: unused_field
  final $Res Function(InvitedUser) _then;

  @override
  $Res call({
    Object? user_id = freezed,
    Object? username = freezed,
    Object? photoUrl = freezed,
  }) {
    return _then(_value.copyWith(
      user_id: user_id == freezed
          ? _value.user_id
          : user_id // ignore: cast_nullable_to_non_nullable
              as String,
      username: username == freezed
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      photoUrl: photoUrl == freezed
          ? _value.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_InvitedUserCopyWith<$Res>
    implements $InvitedUserCopyWith<$Res> {
  factory _$$_InvitedUserCopyWith(
          _$_InvitedUser value, $Res Function(_$_InvitedUser) then) =
      __$$_InvitedUserCopyWithImpl<$Res>;
  @override
  $Res call({String user_id, String username, String photoUrl});
}

/// @nodoc
class __$$_InvitedUserCopyWithImpl<$Res> extends _$InvitedUserCopyWithImpl<$Res>
    implements _$$_InvitedUserCopyWith<$Res> {
  __$$_InvitedUserCopyWithImpl(
      _$_InvitedUser _value, $Res Function(_$_InvitedUser) _then)
      : super(_value, (v) => _then(v as _$_InvitedUser));

  @override
  _$_InvitedUser get _value => super._value as _$_InvitedUser;

  @override
  $Res call({
    Object? user_id = freezed,
    Object? username = freezed,
    Object? photoUrl = freezed,
  }) {
    return _then(_$_InvitedUser(
      user_id: user_id == freezed
          ? _value.user_id
          : user_id // ignore: cast_nullable_to_non_nullable
              as String,
      username: username == freezed
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      photoUrl: photoUrl == freezed
          ? _value.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_InvitedUser implements _InvitedUser {
  const _$_InvitedUser(
      {required this.user_id, required this.username, required this.photoUrl});

  factory _$_InvitedUser.fromJson(Map<String, dynamic> json) =>
      _$$_InvitedUserFromJson(json);

  @override
  final String user_id;
  @override
  final String username;
  @override
  final String photoUrl;

  @override
  String toString() {
    return 'InvitedUser(user_id: $user_id, username: $username, photoUrl: $photoUrl)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_InvitedUser &&
            const DeepCollectionEquality().equals(other.user_id, user_id) &&
            const DeepCollectionEquality().equals(other.username, username) &&
            const DeepCollectionEquality().equals(other.photoUrl, photoUrl));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(user_id),
      const DeepCollectionEquality().hash(username),
      const DeepCollectionEquality().hash(photoUrl));

  @JsonKey(ignore: true)
  @override
  _$$_InvitedUserCopyWith<_$_InvitedUser> get copyWith =>
      __$$_InvitedUserCopyWithImpl<_$_InvitedUser>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_InvitedUserToJson(
      this,
    );
  }
}

abstract class _InvitedUser implements InvitedUser {
  const factory _InvitedUser(
      {required final String user_id,
      required final String username,
      required final String photoUrl}) = _$_InvitedUser;

  factory _InvitedUser.fromJson(Map<String, dynamic> json) =
      _$_InvitedUser.fromJson;

  @override
  String get user_id;
  @override
  String get username;
  @override
  String get photoUrl;
  @override
  @JsonKey(ignore: true)
  _$$_InvitedUserCopyWith<_$_InvitedUser> get copyWith =>
      throw _privateConstructorUsedError;
}
