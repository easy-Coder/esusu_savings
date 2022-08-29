// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AppUser _$AppUserFromJson(Map<String, dynamic> json) {
  return _AppUser.fromJson(json);
}

/// @nodoc
mixin _$AppUser {
  String get id => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;
  @JsonKey(name: "first_name")
  String get firstName => throw _privateConstructorUsedError;
  String get surname => throw _privateConstructorUsedError;
  String get bvn => throw _privateConstructorUsedError;
  @JsonKey(name: "profile_pics")
  String? get profilePics => throw _privateConstructorUsedError;
  @JsonKey(name: "date_created")
  DateTime? get dateCreated => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AppUserCopyWith<AppUser> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppUserCopyWith<$Res> {
  factory $AppUserCopyWith(AppUser value, $Res Function(AppUser) then) =
      _$AppUserCopyWithImpl<$Res>;
  $Res call(
      {String id,
      String username,
      @JsonKey(name: "first_name") String firstName,
      String surname,
      String bvn,
      @JsonKey(name: "profile_pics") String? profilePics,
      @JsonKey(name: "date_created") DateTime? dateCreated});
}

/// @nodoc
class _$AppUserCopyWithImpl<$Res> implements $AppUserCopyWith<$Res> {
  _$AppUserCopyWithImpl(this._value, this._then);

  final AppUser _value;
  // ignore: unused_field
  final $Res Function(AppUser) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? username = freezed,
    Object? firstName = freezed,
    Object? surname = freezed,
    Object? bvn = freezed,
    Object? profilePics = freezed,
    Object? dateCreated = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      username: username == freezed
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: firstName == freezed
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      surname: surname == freezed
          ? _value.surname
          : surname // ignore: cast_nullable_to_non_nullable
              as String,
      bvn: bvn == freezed
          ? _value.bvn
          : bvn // ignore: cast_nullable_to_non_nullable
              as String,
      profilePics: profilePics == freezed
          ? _value.profilePics
          : profilePics // ignore: cast_nullable_to_non_nullable
              as String?,
      dateCreated: dateCreated == freezed
          ? _value.dateCreated
          : dateCreated // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
abstract class _$$_AppUserCopyWith<$Res> implements $AppUserCopyWith<$Res> {
  factory _$$_AppUserCopyWith(
          _$_AppUser value, $Res Function(_$_AppUser) then) =
      __$$_AppUserCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      String username,
      @JsonKey(name: "first_name") String firstName,
      String surname,
      String bvn,
      @JsonKey(name: "profile_pics") String? profilePics,
      @JsonKey(name: "date_created") DateTime? dateCreated});
}

/// @nodoc
class __$$_AppUserCopyWithImpl<$Res> extends _$AppUserCopyWithImpl<$Res>
    implements _$$_AppUserCopyWith<$Res> {
  __$$_AppUserCopyWithImpl(_$_AppUser _value, $Res Function(_$_AppUser) _then)
      : super(_value, (v) => _then(v as _$_AppUser));

  @override
  _$_AppUser get _value => super._value as _$_AppUser;

  @override
  $Res call({
    Object? id = freezed,
    Object? username = freezed,
    Object? firstName = freezed,
    Object? surname = freezed,
    Object? bvn = freezed,
    Object? profilePics = freezed,
    Object? dateCreated = freezed,
  }) {
    return _then(_$_AppUser(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      username: username == freezed
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: firstName == freezed
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      surname: surname == freezed
          ? _value.surname
          : surname // ignore: cast_nullable_to_non_nullable
              as String,
      bvn: bvn == freezed
          ? _value.bvn
          : bvn // ignore: cast_nullable_to_non_nullable
              as String,
      profilePics: profilePics == freezed
          ? _value.profilePics
          : profilePics // ignore: cast_nullable_to_non_nullable
              as String?,
      dateCreated: dateCreated == freezed
          ? _value.dateCreated
          : dateCreated // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AppUser extends _AppUser {
  const _$_AppUser(
      {required this.id,
      required this.username,
      @JsonKey(name: "first_name") required this.firstName,
      required this.surname,
      required this.bvn,
      @JsonKey(name: "profile_pics") required this.profilePics,
      @JsonKey(name: "date_created") this.dateCreated})
      : super._();

  factory _$_AppUser.fromJson(Map<String, dynamic> json) =>
      _$$_AppUserFromJson(json);

  @override
  final String id;
  @override
  final String username;
  @override
  @JsonKey(name: "first_name")
  final String firstName;
  @override
  final String surname;
  @override
  final String bvn;
  @override
  @JsonKey(name: "profile_pics")
  final String? profilePics;
  @override
  @JsonKey(name: "date_created")
  final DateTime? dateCreated;

  @override
  String toString() {
    return 'AppUser(id: $id, username: $username, firstName: $firstName, surname: $surname, bvn: $bvn, profilePics: $profilePics, dateCreated: $dateCreated)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AppUser &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.username, username) &&
            const DeepCollectionEquality().equals(other.firstName, firstName) &&
            const DeepCollectionEquality().equals(other.surname, surname) &&
            const DeepCollectionEquality().equals(other.bvn, bvn) &&
            const DeepCollectionEquality()
                .equals(other.profilePics, profilePics) &&
            const DeepCollectionEquality()
                .equals(other.dateCreated, dateCreated));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(username),
      const DeepCollectionEquality().hash(firstName),
      const DeepCollectionEquality().hash(surname),
      const DeepCollectionEquality().hash(bvn),
      const DeepCollectionEquality().hash(profilePics),
      const DeepCollectionEquality().hash(dateCreated));

  @JsonKey(ignore: true)
  @override
  _$$_AppUserCopyWith<_$_AppUser> get copyWith =>
      __$$_AppUserCopyWithImpl<_$_AppUser>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AppUserToJson(
      this,
    );
  }
}

abstract class _AppUser extends AppUser {
  const factory _AppUser(
      {required final String id,
      required final String username,
      @JsonKey(name: "first_name") required final String firstName,
      required final String surname,
      required final String bvn,
      @JsonKey(name: "profile_pics") required final String? profilePics,
      @JsonKey(name: "date_created") final DateTime? dateCreated}) = _$_AppUser;
  const _AppUser._() : super._();

  factory _AppUser.fromJson(Map<String, dynamic> json) = _$_AppUser.fromJson;

  @override
  String get id;
  @override
  String get username;
  @override
  @JsonKey(name: "first_name")
  String get firstName;
  @override
  String get surname;
  @override
  String get bvn;
  @override
  @JsonKey(name: "profile_pics")
  String? get profilePics;
  @override
  @JsonKey(name: "date_created")
  DateTime? get dateCreated;
  @override
  @JsonKey(ignore: true)
  _$$_AppUserCopyWith<_$_AppUser> get copyWith =>
      throw _privateConstructorUsedError;
}
