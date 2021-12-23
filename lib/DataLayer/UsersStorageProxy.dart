import 'package:amplify_flutter/amplify.dart';
import 'package:project_demo/models/ModelProvider.dart';

class UsersStorageProxy {
  static final UsersStorageProxy _singleton = UsersStorageProxy._internal();

  factory UsersStorageProxy() {
    return _singleton;
  }

  UsersStorageProxy._internal();

  Future<UserModel> createUser(
      String email, String name, String imageUrl) async {
    List<UserModel> users = await Amplify.DataStore.query(UserModel.classType,
        where: UserModel.EMAIL.eq(email));

    if (users.isEmpty) //no such user in the DB
    {
      DigitalWalletModel digitalWalletModel =
          DigitalWalletModel(cashBackAmount: 0);
      UserModel userModel = UserModel(
          email: email,
          name: name,
          imageUrl: imageUrl,
          digitalWalletModel: digitalWalletModel,
          userModelDigitalWalletModelId: digitalWalletModel.id);
      await Amplify.DataStore.save(digitalWalletModel);
      await Amplify.DataStore.save(userModel);
      print("Created user and saved to DB");
      return userModel;
    }
    return users.first;
  }

  Future<UserModel> getUser(String email) async {
    List<UserModel> users = await Amplify.DataStore.query(UserModel.classType,
        where: UserModel.EMAIL.eq(email));

    return users.isEmpty ? null : users.first;
  }
}
