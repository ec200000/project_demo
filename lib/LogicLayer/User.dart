import 'package:project_demo/LogicLayer/DigitalWallet.dart';
import 'package:project_demo/LogicLayer/OnlineStore.dart';
import 'package:project_demo/LogicLayer/ShoppingBag.dart';
import 'package:project_demo/LogicLayer/StoreOwnerState.dart';
import 'package:flutter/material.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:project_demo/DataLayer/user_authenticator.dart';
import 'package:project_demo/models/ModelProvider.dart';
import 'package:project_demo/screens/landing_screen.dart';

class User extends ChangeNotifier {
  String email;
  String name;
  List<OnlineStore> favoriteStores;
  List<String> creditCards;
  String imageUrl;
  String bankAccount;
  StoreOwnerState storeOwnerState;
  DigitalWallet digitalWallet;
  List<ShoppingBag> bagInStores;

  bool isSignedIn = false;

  User();
  void userFromModel(UserModel model) {
    this.email = model.email;
    this.name = model.name;
    this.imageUrl = model.imageUrl;
    this.digitalWallet =
        DigitalWallet.digitalWalletFromModel(model.digitalWalletModel);
    //TODO: generate credit card list from json
    this.bankAccount = model.bankAccount;
    //TODO: check if we need the other fields (because we are writing directly to the cloud)
  }

  void signIn(AuthProvider authProvider, BuildContext context) async {
    try {
      var currUser = await UserAuthenticator().signIn(authProvider);
      isSignedIn = currUser != null;
      if (isSignedIn) {
        userFromModel(currUser);
      }
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
