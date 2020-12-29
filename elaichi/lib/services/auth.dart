import 'package:elaichi/app/logger.dart';
import 'package:elaichi/strings.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

/// A single point authentication service
@singleton
class Auth {
  // Create default instances of _GoogleAuthService and _FirebaseAuthService
  // for in app use.
  _GoogleAuthService _googleAuthService = _GoogleAuthService();
  _FirebaseAuthService _firebaseAuthService = _FirebaseAuthService();

  /// `googleSignIn` and `firebaseAuth` can be used to pass the instances for
  /// further functions. If not provided then default instances are used. These
  /// are useful for situations like mocking from test file.
  void setTestInstances(
      {GoogleSignIn googleSignIn, FirebaseAuth firebaseAuth}) {
    _firebaseAuthService = _FirebaseAuthService(firebaseAuth: firebaseAuth);
    _googleAuthService = _GoogleAuthService(googleSignIn: googleSignIn);
  }

  /// First try to signInWithGoogle, if successful send web endpoint the user
  /// credentials. Finally, after the response from web endpoint return user
  /// info [UserModel]
  Future<void> signInWithGoogle() async {
    final AuthCredential credential = await _googleAuthService.signIn();
    final User user =
        await _firebaseAuthService.signInWithCredenials(credential: credential);
    final jwtToken = user.getIdToken();
  }

  /// Send passwordless verification email to user. Call [verifyAndSignIn] after
  /// retriving email link from deep links.
  ///
  /// Use following code in a [StatefulWidget] to retrieve email link
  /// ```dart
  /// @override
  /// void didChangeAppLifecycleState(AppLifecycleState state) {
  ///   if (state == AppLifecycleState.resumed) {
  ///     emailLink = retrieveEmailLink();
  ///     Auth.verifyAndSignIn(email: email, emailLink: emailLink);
  ///   }
  /// }
  /// ```
  Future<bool> sentVerificationMail({@required String email}) =>
      _firebaseAuthService.sendSignInLinkToEmail(email: email).then((_) {
        return true;
      });

  /// After retrival of email link from deep link,
  Future<void> verifyAndSignIn(
      {@required String email, @required String emailLink}) async {
    final User user = await _firebaseAuthService.verifyEmailLink(
        email: email, emailLink: emailLink);
    final jwtToken = user.getIdToken();
  }

  /// Sign out from all the accounts
  Future<void> signOut() async {
    await _firebaseAuthService.signOut();
    await _googleAuthService.signOut();
  }
}

/// Handles all the Firebase login related functions
class _FirebaseAuthService {
  final Logger _logger = getLogger("Authentication");
  FirebaseAuth _firebaseAuth;
  User _user;

  /// Constructor of [_FirebaseAuthService]
  _FirebaseAuthService({FirebaseAuth firebaseAuth})
      : _firebaseAuth = firebaseAuth {
    _firebaseAuth ??= FirebaseAuth.instance;
  }

  /// User details if sign in was successful.
  User get user => _user;

  /// Send email for firebase passwordless login
  Future<bool> sendSignInLinkToEmail({@required String email}) {
    final ActionCodeSettings actionCodeSettings = ActionCodeSettings(
        url: Strings.BASE_URL,
        dynamicLinkDomain: Strings.DYNAMIC_LINK_DOMAIN,
        androidPackageName: Strings.PACKAGE_NAME,
        androidInstallApp: true,
        androidMinimumVersion: 16,
        iOSBundleId: Strings.IOS_BUNDLE_ID,
        handleCodeInApp: true);

    return _firebaseAuth
        .sendSignInLinkToEmail(
            email: email, actionCodeSettings: actionCodeSettings)
        .then((_) {
      _logger.i("Verification email sent");
      return true;
    }).catchError((error, stackTrace) {
      _logger.e("Failed to send verification email", error, stackTrace);
      return false;
    });
  }

  /// Sign in user with `credential` (like Google, Twitter, Microsoft)
  Future<User> signInWithCredenials({@required AuthCredential credential}) =>
      _firebaseAuth.signInWithCredential(credential).then((userCredential) {
        _logger.i("Firebase login successful");
        _user = userCredential.user;
        return userCredential.user;
      }).catchError((error, stackTrace) {
        _logger.e("Failed to send verification email", error, stackTrace);
        throw Exception("Unable to sign in with credentials");
      });

  Future<void> signOut() => _firebaseAuth.signOut();

  /// Verify the retrieved link is valid. The email should be same as provided
  /// to [sendSignInLinkToEmail]
  Future<User> verifyEmailLink(
      {@required String email, @required String emailLink}) {
    if (_firebaseAuth.isSignInWithEmailLink(emailLink)) {
      return _firebaseAuth
          .signInWithEmailLink(email: email, emailLink: emailLink)
          .then((userCredential) {
        _logger.i("Login with email link successful");
        _user = userCredential.user;
        return userCredential.user;
      }).catchError((error, stackTrace) {
        _logger.e("Email link verification failed", error, stackTrace);
        throw Exception("Login failed");
      });
    } else {
      _logger.i("Email link provided is not a firebase email link");
      throw Exception("Login failed");
    }
  }
}

/// Google Authentication manager
class _GoogleAuthService {
  GoogleSignIn _googleSignIn;

  /// Contructor of Service
  _GoogleAuthService({GoogleSignIn googleSignIn})
      : _googleSignIn = googleSignIn {
    _googleSignIn ??= GoogleSignIn();
  }

  /// Signin by creating a google interactive dialog
  Future<AuthCredential> signIn() async {
    final GoogleSignInAccount googleSignInAccount =
        await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );

    return credential;
  }

  /// Sign out from google
  Future<GoogleSignInAccount> signOut() => _googleSignIn.signOut();
}