import 'package:elaichi/services/auth.dart';
import 'package:flutter_test/flutter_test.dart';

import '../setup/test_helpers.dart';

void main() {
  final Auth _auth = Auth();

  setUp(() async {
    registerServices();
  });
  tearDown(() {
    unregisterServices();
  });

  group("Web endpoint - ", () {
    test("Inform server", () {
      _auth.signInToWebpoint(username: "test", mobile: "+9190");
    });
  });
}
