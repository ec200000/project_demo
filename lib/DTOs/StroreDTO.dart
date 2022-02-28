import 'package:flutter/material.dart';
import 'package:project_demo/LogicLayer/Categories.dart';

class StoreDTO {
  String name;
  String phoneNumber;
  String address;
  List<String> categories;
  Map<String, List<TimeOfDay>> operationHours;

  StoreDTO(this.name, this.phoneNumber, this.address, this.categories,
      this.operationHours);
}
