import 'package:project_demo/LogicLayer/Categories.dart';

class OnlineStore {
  String name;
  String phoneNumber;
  String address;
  List<Categories> categories;
  Map<int, DateTime> operationHours;

  OnlineStore(this.name, this.phoneNumber, this.address, this.categories,
      this.operationHours);
}
