import 'package:elaichi/app/locator.dart';
import 'package:elaichi/datamodels/auth_user.dart';
import 'package:elaichi/services/graphql.dart';
import 'package:elaichi/services/local_db.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';

import '../setup/http_helper.dart';
import '../setup/test_helpers.dart';

class MockHttpClient extends Mock implements http.Client {}

class MockHiveBox extends Mock implements Box {}

void main() {
  final GraphQL _graphQL = GraphQL();
  final MockHttpClient _mockHttpClient = MockHttpClient();

  setUp(() async {
    await registerServices();

    final mockLocalDb = locator<LocalDb>();
    final _mockHiveBox = MockHiveBox();

    when(mockLocalDb.clearAndGetCacheBox())
        .thenAnswer((_) => Future.value(_mockHiveBox));

    await _graphQL.initGraphQL(
        token: "dummy token", httpClient: _mockHttpClient);
  });
  tearDown(() => unregisterServices());

  group("AuthUser test -", () {
    test("Simple request", () async {
      when(_mockHttpClient.send(any)).thenAnswer((_) async {
        // ignore: unnecessary_raw_strings
        return response(body: r'''
{
  "data": {
    "authUser": {
      "id": "5ffc93b4f44bfe29dbba99cf",
      "name": "test 1",
      "username": "test 2",
      "gmailAuthMail": "a@b.c",
      "mobile": null,
      "displayPicture": "hsuih.jpg"
    }
  }
}
        ''');
      });

      final AuthUser authUser = await _graphQL.authUser(
          username: "test 2",
          name: "test 1",
          mobile: "+91",
          email: "a@b.c",
          displayPicture: "hsuih.jpg");

      expect(authUser.name, "test 1");
    });
  });
}
