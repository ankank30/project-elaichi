// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:elaichi/graphql/serializers.gql.dart' as _i1;

part 'mutations.data.gql.g.dart';

abstract class GAuthUsersData
    implements Built<GAuthUsersData, GAuthUsersDataBuilder> {
  GAuthUsersData._();

  factory GAuthUsersData([Function(GAuthUsersDataBuilder b) updates]) =
      _$GAuthUsersData;

  static void _initializeBuilder(GAuthUsersDataBuilder b) =>
      b..G__typename = 'Mutation';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @nullable
  GAuthUsersData_authUser get authUser;
  static Serializer<GAuthUsersData> get serializer =>
      _$gAuthUsersDataSerializer;
  Map<String, dynamic> toJson() =>
      _i1.serializers.serializeWith(GAuthUsersData.serializer, this);
  static GAuthUsersData fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GAuthUsersData.serializer, json);
}

abstract class GAuthUsersData_authUser
    implements Built<GAuthUsersData_authUser, GAuthUsersData_authUserBuilder> {
  GAuthUsersData_authUser._();

  factory GAuthUsersData_authUser(
          [Function(GAuthUsersData_authUserBuilder b) updates]) =
      _$GAuthUsersData_authUser;

  static void _initializeBuilder(GAuthUsersData_authUserBuilder b) =>
      b..G__typename = 'User';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @nullable
  String get id;
  @nullable
  String get name;
  @nullable
  String get username;
  @nullable
  String get gmailAuthMail;
  @nullable
  String get mobile;
  @nullable
  String get displayPicture;
  static Serializer<GAuthUsersData_authUser> get serializer =>
      _$gAuthUsersDataAuthUserSerializer;
  Map<String, dynamic> toJson() =>
      _i1.serializers.serializeWith(GAuthUsersData_authUser.serializer, this);
  static GAuthUsersData_authUser fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GAuthUsersData_authUser.serializer, json);
}
