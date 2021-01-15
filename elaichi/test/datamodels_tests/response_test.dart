import 'package:elaichi/datamodels/response.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("AuthUser tests", () {
    test("Authorized response", () {
      const String jsonResponse = """
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
      """;

      final response = responseFromJson(jsonResponse);
      expect(response.data.authUser.id, "5ffc93b4f44bfe29dbba99cf");
      expect(response.data.authUser.name, "test 1");
      expect(response.data.authUser.username, "test 2");
      expect(response.data.authUser.gmailAuthMail, "a@b.c");
      expect(response.data.authUser.mobile, null);
      expect(response.data.authUser.displayPicture, "hsuih.jpg");
    });
  });
}
