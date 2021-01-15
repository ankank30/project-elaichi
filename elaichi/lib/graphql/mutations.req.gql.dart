// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:elaichi/graphql/mutations.ast.gql.dart' as _i5;
import 'package:elaichi/graphql/mutations.data.gql.dart' as _i2;
import 'package:elaichi/graphql/mutations.var.gql.dart' as _i3;
import 'package:elaichi/graphql/serializers.gql.dart' as _i6;
import 'package:ferry_exec/ferry_exec.dart' as _i1;
import 'package:gql_exec/gql_exec.dart' as _i4;

part 'mutations.req.gql.g.dart';

abstract class GAuthUsersReq
    implements
        Built<GAuthUsersReq, GAuthUsersReqBuilder>,
        _i1.OperationRequest<_i2.GAuthUsersData, _i3.GAuthUsersVars> {
  GAuthUsersReq._();

  factory GAuthUsersReq([Function(GAuthUsersReqBuilder b) updates]) =
      _$GAuthUsersReq;

  static void _initializeBuilder(GAuthUsersReqBuilder b) => b
    ..operation =
        _i4.Operation(document: _i5.document, operationName: 'AuthUsers')
    ..executeOnListen = true;
  _i3.GAuthUsersVars get vars;
  _i4.Operation get operation;
  _i4.Request get execRequest =>
      _i4.Request(operation: operation, variables: vars.toJson());
  @nullable
  String get requestId;
  @nullable
  @BuiltValueField(serialize: false)
  _i2.GAuthUsersData Function(_i2.GAuthUsersData, _i2.GAuthUsersData)
      get updateResult;
  @nullable
  _i2.GAuthUsersData get optimisticResponse;
  @nullable
  String get updateCacheHandlerKey;
  @nullable
  Map<String, dynamic> get updateCacheHandlerContext;
  @nullable
  _i1.FetchPolicy get fetchPolicy;
  @nullable
  bool get executeOnListen;
  @override
  _i2.GAuthUsersData parseData(Map<String, dynamic> json) =>
      _i2.GAuthUsersData.fromJson(json);
  static Serializer<GAuthUsersReq> get serializer => _$gAuthUsersReqSerializer;
  Map<String, dynamic> toJson() =>
      _i6.serializers.serializeWith(GAuthUsersReq.serializer, this);
  static GAuthUsersReq fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(GAuthUsersReq.serializer, json);
}
