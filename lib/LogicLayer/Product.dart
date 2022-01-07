import 'package:project_demo/LogicLayer/Categories.dart';

class Product {
  String name;
  List<Categories> categories;
  double price;
  String imageUrl;
  String description;

  Product(
      this.name, this.price, this.categories, this.imageUrl, this.description);
}
