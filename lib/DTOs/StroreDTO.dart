import 'package:project_demo/LogicLayer/Categories.dart';

class StoreDTO {
  String name;
  String phoneNumber;
  String address;
  List<Categories> categories;
  Map<int, DateTime> operationHours;

  StoreDTO(this.name, this.phoneNumber, this.address, this.categories,
      this.operationHours);
}
