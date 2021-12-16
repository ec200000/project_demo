import 'package:amplify_flutter/amplify.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';

class UserAuthenticator {
  static final UserAuthenticator _singleton = UserAuthenticator._internal();

  factory UserAuthenticator() {
    return _singleton;
  }

  UserAuthenticator._internal();

  Future<bool> signIn(AuthProvider authProvider) async {
    try {
      await Amplify.Auth.signInWithWebUI(provider: authProvider);
    } catch (e) {
      print(e);
      return false;
    }
    return true;
  }

  Future<bool> signOut() async {
    try {
      await Amplify.Auth.signOut();
    } on AuthException catch (e) {
      print(e.message);
      return true;
    }
    return false; //false indicating the user is not signed in anymore
  }
}
