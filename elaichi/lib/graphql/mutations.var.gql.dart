// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:elaichi/graphql/schema.schema.gql.dart' as _i1;
import 'package:elaichi/graphql/serializers.gql.dart' as _i2;

part 'mutations.var.gql.g.dart';

abstract class GAuthUsersVars
    implements Built<GAuthUsersVars, GAuthUsersVarsBuilder> {
  GAuthUsersVars._();

  factory GAuthUsersVars([Function(GAuthUsersVarsBuilder b) updates]) =
      _$GAuthUsersVars;

  @nullable
  _i1.GUserInputType get userInput;
  static Serializer<GAuthUsersVars> get serializer =>
      _$gAuthUsersVarsSerializer;
  Map<String, dynamic> toJson() =>
      _i2.serializers.serializeWith(GAuthUsersVars.serializer, this);
  static GAuthUsersVars fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(GAuthUsersVars.serializer, json);
}
