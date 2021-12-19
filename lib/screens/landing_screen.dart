import 'package:flutter/material.dart';
import '../screens/tabs_screen.dart';
import '../screens/auth_screen.dart';
import '../models/app_user.dart';
import 'package:provider/provider.dart';

class LandingScreen extends StatelessWidget {
  static const routeName = '/landing';

  @override
  Widget build(BuildContext context) {
    final appUser = context.watch<AppUser>().isSignedIn;
    print(appUser);
    return appUser ? TabsScreen() : AuthScreen();
  }
}