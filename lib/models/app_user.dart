import 'package:flutter/material.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:project_demo/DataLayer/user_authenticator.dart';
import 'package:project_demo/screens/landing_screen.dart';

class AppUser extends ChangeNotifier {
  bool isSignedIn = false;
  String username;

  AppUser();

  void signIn(AuthProvider authProvider, BuildContext context) async {
    try {
      isSignedIn = await UserAuthenticator().signIn(authProvider);
      notifyListeners();
      Navigator.of(context).pushNamed(LandingScreen.routeName);
    } catch (e) {
      throw e;
    }
  }

  void signOut() async {
    try {
      isSignedIn = await UserAuthenticator().signOut();
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }
}