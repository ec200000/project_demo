import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:flutter/material.dart';
import 'package:project_demo/models/app_user.dart';
import 'package:project_demo/widgets/sign_in_button.dart';
import 'package:provider/provider.dart';
import 'package:project_demo/models/buttons_enum.dart';

class SignInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Amplify Auth Demo'),
        elevation: 10,
      ),
      body: _buildContent(context),
      backgroundColor: Colors.grey[200],
    );
  }

  Widget _buildContent(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            child: Text(
              'Sign In',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w600,
              ),
            ),
            height: 50.0,
          ),
          SizedBox(
            height: 48.0,
          ),
          SocialSignInButton(
            button: Buttons.Google,
            onPressed: () =>
                context.read<AppUser>().signIn(AuthProvider.google),
            color: Colors.white,
            text: 'Sign in with Google',
            textColor: Colors.black87,
          ),
          SizedBox(
            height: 8.0,
          ),
          SocialSignInButton(
            button: Buttons.Facebook,
            onPressed: () =>
                context.read<AppUser>().signIn(AuthProvider.facebook),
            color: Color(0xFF334D92),
            text: 'Sign in with Facebook',
            textColor: Colors.white,
          ),
        ],
      ),
    );
  }
}
