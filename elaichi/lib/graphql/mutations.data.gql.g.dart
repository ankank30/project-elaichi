// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mutations.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GAuthUsersData> _$gAuthUsersDataSerializer =
    new _$GAuthUsersDataSerializer();
Serializer<GAuthUsersData_authUser> _$gAuthUsersDataAuthUserSerializer =
    new _$GAuthUsersData_authUserSerializer();

class _$GAuthUsersDataSerializer
    implements StructuredSerializer<GAuthUsersData> {
  @override
  final Iterable<Type> types = const [GAuthUsersData, _$GAuthUsersData];
  @override
  final String wireName = 'GAuthUsersData';

  @override
  Iterable<Object> serialize(Serializers serializers, GAuthUsersData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    if (object.authUser != null) {
      result
        ..add('authUser')
        ..add(serializers.serialize(object.authUser,
            specifiedType: const FullType(GAuthUsersData_authUser)));
    }
    return result;
  }

  @override
  GAuthUsersData deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GAuthUsersDataBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'authUser':
          result.authUser.replace(serializers.deserialize(value,
                  specifiedType: const FullType(GAuthUsersData_authUser))
              as GAuthUsersData_authUser);
          break;
      }
    }

    return result.build();
  }
}

class _$GAuthUsersData_authUserSerializer
    implements StructuredSerializer<GAuthUsersData_authUser> {
  @override
  final Iterable<Type> types = const [
    GAuthUsersData_authUser,
    _$GAuthUsersData_authUser
  ];
  @override
  final String wireName = 'GAuthUsersData_authUser';

  @override
  Iterable<Object> serialize(
      Serializers serializers, GAuthUsersData_authUser object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    if (object.id != null) {
      result
        ..add('id')
        ..add(serializers.serialize(object.id,
            specifiedType: const FullType(String)));
    }
    if (object.name != null) {
      result
        ..add('name')
        ..add(serializers.serialize(object.name,
            specifiedType: const FullType(String)));
    }
    if (object.username != null) {
      result
        ..add('username')
        ..add(serializers.serialize(object.username,
            specifiedType: const FullType(String)));
    }
    if (object.gmailAuthMail != null) {
      result
        ..add('gmailAuthMail')
        ..add(serializers.serialize(object.gmailAuthMail,
            specifiedType: const FullType(String)));
    }
    if (object.mobile != null) {
      result
        ..add('mobile')
        ..add(serializers.serialize(object.mobile,
            specifiedType: const FullType(String)));
    }
    if (object.displayPicture != null) {
      result
        ..add('displayPicture')
        ..add(serializers.serialize(object.displayPicture,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  GAuthUsersData_authUser deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GAuthUsersData_authUserBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'username':
          result.username = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'gmailAuthMail':
          result.gmailAuthMail = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'mobile':
          result.mobile = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'displayPicture':
          result.displayPicture = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GAuthUsersData extends GAuthUsersData {
  @override
  final String G__typename;
  @override
  final GAuthUsersData_authUser authUser;

  factory _$GAuthUsersData([void Function(GAuthUsersDataBuilder) updates]) =>
      (new GAuthUsersDataBuilder()..update(updates)).build();

  _$GAuthUsersData._({this.G__typename, this.authUser}) : super._() {
    if (G__typename == null) {
      throw new BuiltValueNullFieldError('GAuthUsersData', 'G__typename');
    }
  }

  @override
  GAuthUsersData rebuild(void Function(GAuthUsersDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GAuthUsersDataBuilder toBuilder() =>
      new GAuthUsersDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GAuthUsersData &&
        G__typename == other.G__typename &&
        authUser == other.authUser;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, G__typename.hashCode), authUser.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GAuthUsersData')
          ..add('G__typename', G__typename)
          ..add('authUser', authUser))
        .toString();
  }
}

class GAuthUsersDataBuilder
    implements Builder<GAuthUsersData, GAuthUsersDataBuilder> {
  _$GAuthUsersData _$v;

  String _G__typename;
  String get G__typename => _$this._G__typename;
  set G__typename(String G__typename) => _$this._G__typename = G__typename;

  GAuthUsersData_authUserBuilder _authUser;
  GAuthUsersData_authUserBuilder get authUser =>
      _$this._authUser ??= new GAuthUsersData_authUserBuilder();
  set authUser(GAuthUsersData_authUserBuilder authUser) =>
      _$this._authUser = authUser;

  GAuthUsersDataBuilder() {
    GAuthUsersData._initializeBuilder(this);
  }

  GAuthUsersDataBuilder get _$this {
    if (_$v != null) {
      _G__typename = _$v.G__typename;
      _authUser = _$v.authUser?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GAuthUsersData other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$GAuthUsersData;
  }

  @override
  void update(void Function(GAuthUsersDataBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GAuthUsersData build() {
    _$GAuthUsersData _$result;
    try {
      _$result = _$v ??
          new _$GAuthUsersData._(
              G__typename: G__typename, authUser: _authUser?.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'authUser';
        _authUser?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'GAuthUsersData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GAuthUsersData_authUser extends GAuthUsersData_authUser {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String name;
  @override
  final String username;
  @override
  final String gmailAuthMail;
  @override
  final String mobile;
  @override
  final String displayPicture;

  factory _$GAuthUsersData_authUser(
          [void Function(GAuthUsersData_authUserBuilder) updates]) =>
      (new GAuthUsersData_authUserBuilder()..update(updates)).build();

  _$GAuthUsersData_authUser._(
      {this.G__typename,
      this.id,
      this.name,
      this.username,
      this.gmailAuthMail,
      this.mobile,
      this.displayPicture})
      : super._() {
    if (G__typename == null) {
      throw new BuiltValueNullFieldError(
          'GAuthUsersData_authUser', 'G__typename');
    }
  }

  @override
  GAuthUsersData_authUser rebuild(
          void Function(GAuthUsersData_authUserBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GAuthUsersData_authUserBuilder toBuilder() =>
      new GAuthUsersData_authUserBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GAuthUsersData_authUser &&
        G__typename == other.G__typename &&
        id == other.id &&
        name == other.name &&
        username == other.username &&
        gmailAuthMail == other.gmailAuthMail &&
        mobile == other.mobile &&
        displayPicture == other.displayPicture;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc($jc($jc(0, G__typename.hashCode), id.hashCode),
                        name.hashCode),
                    username.hashCode),
                gmailAuthMail.hashCode),
            mobile.hashCode),
        displayPicture.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GAuthUsersData_authUser')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('name', name)
          ..add('username', username)
          ..add('gmailAuthMail', gmailAuthMail)
          ..add('mobile', mobile)
          ..add('displayPicture', displayPicture))
        .toString();
  }
}

class GAuthUsersData_authUserBuilder
    implements
        Builder<GAuthUsersData_authUser, GAuthUsersData_authUserBuilder> {
  _$GAuthUsersData_authUser _$v;

  String _G__typename;
  String get G__typename => _$this._G__typename;
  set G__typename(String G__typename) => _$this._G__typename = G__typename;

  String _id;
  String get id => _$this._id;
  set id(String id) => _$this._id = id;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  String _username;
  String get username => _$this._username;
  set username(String username) => _$this._username = username;

  String _gmailAuthMail;
  String get gmailAuthMail => _$this._gmailAuthMail;
  set gmailAuthMail(String gmailAuthMail) =>
      _$this._gmailAuthMail = gmailAuthMail;

  String _mobile;
  String get mobile => _$this._mobile;
  set mobile(String mobile) => _$this._mobile = mobile;

  String _displayPicture;
  String get displayPicture => _$this._displayPicture;
  set displayPicture(String displayPicture) =>
      _$this._displayPicture = displayPicture;

  GAuthUsersData_authUserBuilder() {
    GAuthUsersData_authUser._initializeBuilder(this);
  }

  GAuthUsersData_authUserBuilder get _$this {
    if (_$v != null) {
      _G__typename = _$v.G__typename;
      _id = _$v.id;
      _name = _$v.name;
      _username = _$v.username;
      _gmailAuthMail = _$v.gmailAuthMail;
      _mobile = _$v.mobile;
      _displayPicture = _$v.displayPicture;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GAuthUsersData_authUser other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$GAuthUsersData_authUser;
  }

  @override
  void update(void Function(GAuthUsersData_authUserBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GAuthUsersData_authUser build() {
    final _$result = _$v ??
        new _$GAuthUsersData_authUser._(
            G__typename: G__typename,
            id: id,
            name: name,
            username: username,
            gmailAuthMail: gmailAuthMail,
            mobile: mobile,
            displayPicture: displayPicture);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
