import 'package:flutter/material.dart';
import 'package:project_demo/models/app_user.dart';
import 'package:project_demo/screens/home_page.dart';
import 'package:project_demo/screens/sign_in_page.dart';
import 'package:provider/provider.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appUser = context.watch<AppUser>().isSignedIn;
    print(appUser);
    return appUser ? HomePage() : SignInPage();
  }
}
