import 'package:project_demo/LogicLayer/Categories.dart';

class PhysicalStore {
  String name;
  String phoneNumber;
  String address;
  List<Categories> categories;
  Map<int, DateTime> operationHours;
  String qrCode;

  PhysicalStore(this.name, this.phoneNumber, this.address, this.categories,
      this.operationHours);
}
