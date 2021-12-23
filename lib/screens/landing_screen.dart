import 'package:flutter/material.dart';
import '../screens/tabs_screen.dart';
import '../screens/auth_screen.dart';
import '../models/app_user.dart';
import 'package:provider/provider.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';

import 'splash_screen.dart';

class LandingScreen extends StatelessWidget {
  static const routeName = '/landing';

  Future<bool> isSignedIn() async {
    try {
      AuthUser res = await Amplify.Auth.getCurrentUser();
      print(res);
    } catch (e) {
      print(e);
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: isSignedIn(),
      builder: (ctx, AsyncSnapshot<bool> snapshot) =>
      snapshot.hasData ? snapshot.data
          ? TabsScreen()
          : AuthScreen()
      : SplashScreen(),
    );
  }
}