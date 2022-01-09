import 'dart:html';

import 'package:flutter/foundation.dart';
import 'package:project_demo/LogicLayer/Categories.dart';

class PhysicalStore with ChangeNotifier{
  String id;
  String name;
  String phoneNumber;
  String address;
  List<Categories> categories;
  Map<int, DateTime> operationHours;
  String qrCode;
  File image;

  PhysicalStore({
    @required this.name,
    @required this.phoneNumber,
    @required this.address,
    @required this.categories,
    @required this.operationHours,
    this.qrCode,
    @required this.image
  });
}
