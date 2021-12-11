import 'dart:convert';
import 'dart:async';

import 'package:flutter/widgets.dart';
import '../models/http_exception.dart';
import 'package:http/http.dart' as http;

import 'user.dart';

class StoreOwner with ChangeNotifier implements User {
  String _token;
  DateTime _expiryDate;
  String _userId;
  Timer _authTimer;

  @override
  void login() {
    // TODO: implement login
  }

  @override
  void logout() {
    // TODO: implement logout
  }

  @override
  bool isStoreOwner = true;
}