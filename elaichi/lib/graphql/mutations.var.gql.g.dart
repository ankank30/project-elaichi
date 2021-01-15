// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mutations.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GAuthUsersVars> _$gAuthUsersVarsSerializer =
    new _$GAuthUsersVarsSerializer();

class _$GAuthUsersVarsSerializer
    implements StructuredSerializer<GAuthUsersVars> {
  @override
  final Iterable<Type> types = const [GAuthUsersVars, _$GAuthUsersVars];
  @override
  final String wireName = 'GAuthUsersVars';

  @override
  Iterable<Object> serialize(Serializers serializers, GAuthUsersVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.userInput != null) {
      result
        ..add('userInput')
        ..add(serializers.serialize(object.userInput,
            specifiedType: const FullType(_i1.GUserInputType)));
    }
    return result;
  }

  @override
  GAuthUsersVars deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GAuthUsersVarsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'userInput':
          result.userInput.replace(serializers.deserialize(value,
                  specifiedType: const FullType(_i1.GUserInputType))
              as _i1.GUserInputType);
          break;
      }
    }

    return result.build();
  }
}

class _$GAuthUsersVars extends GAuthUsersVars {
  @override
  final _i1.GUserInputType userInput;

  factory _$GAuthUsersVars([void Function(GAuthUsersVarsBuilder) updates]) =>
      (new GAuthUsersVarsBuilder()..update(updates)).build();

  _$GAuthUsersVars._({this.userInput}) : super._();

  @override
  GAuthUsersVars rebuild(void Function(GAuthUsersVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GAuthUsersVarsBuilder toBuilder() =>
      new GAuthUsersVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GAuthUsersVars && userInput == other.userInput;
  }

  @override
  int get hashCode {
    return $jf($jc(0, userInput.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GAuthUsersVars')
          ..add('userInput', userInput))
        .toString();
  }
}

class GAuthUsersVarsBuilder
    implements Builder<GAuthUsersVars, GAuthUsersVarsBuilder> {
  _$GAuthUsersVars _$v;

  _i1.GUserInputTypeBuilder _userInput;
  _i1.GUserInputTypeBuilder get userInput =>
      _$this._userInput ??= new _i1.GUserInputTypeBuilder();
  set userInput(_i1.GUserInputTypeBuilder userInput) =>
      _$this._userInput = userInput;

  GAuthUsersVarsBuilder();

  GAuthUsersVarsBuilder get _$this {
    if (_$v != null) {
      _userInput = _$v.userInput?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GAuthUsersVars other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$GAuthUsersVars;
  }

  @override
  void update(void Function(GAuthUsersVarsBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GAuthUsersVars build() {
    _$GAuthUsersVars _$result;
    try {
      _$result = _$v ?? new _$GAuthUsersVars._(userInput: _userInput?.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'userInput';
        _userInput?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'GAuthUsersVars', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
