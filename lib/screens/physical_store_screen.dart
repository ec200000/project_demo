import 'package:flutter/material.dart';
import '../screens/edit_product_screen.dart';
import 'package:provider/provider.dart';

import '../widgets/app_drawer.dart';
import '../widgets/products_grid.dart';
import '../widgets/badge.dart';
import '../providers/cart.dart';
import './cart_screen.dart';
import '../providers/products.dart';

class PhysicalStoreScreen extends StatefulWidget {
  static const routeName = '/physical-store';

  String title;
  String address;
  String image;

  @override
  _PhysicalStoreScreenState createState() => _PhysicalStoreScreenState();
}

class _PhysicalStoreScreenState extends State<PhysicalStoreScreen> {

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    final routeArgs = ModalRoute.of(context).settings.arguments as Map<String, String>;
    widget.title = routeArgs['title'];
    widget.address = routeArgs['address'];
    widget.image = routeArgs['image'];
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // elevation: 0,
        // iconTheme: IconThemeData(color: Colors.black),
        // backgroundColor: Colors.transparent,
        title: Text("" + widget.title, ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
              Center(
                child: Image.asset(widget.image),
              ),
            ListTile(
              title: Text("About the store", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
              onTap: () {
                //open change language
              },
              trailing: Icon(
                Icons.favorite_border,
                color: Colors.black,
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.circle,
                color: Colors.green,
              ),
              title: Text("Open Now"),
              onTap: () {
                //open change language
              },
            ),
            ListTile(
              leading: Icon(
                Icons.location_on,
                color: Colors.grey,
              ),
              title: Text(widget.address),
              onTap: () {
                //open change location
              },
            ),
            ListTile(
              leading: Icon(
                Icons.language,
                color: Colors.grey,
              ),
              title: Text("www.mooo.com", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blueAccent),),
              onTap: () {
                //open change language
              },
            ),
            ListTile(
              leading: Icon(
                Icons.phone,
                color: Colors.grey,
              ),
              title: Text("+44 345 3366"),
              onTap: () {
                //open change language
              },
            ),
            ],
          ),
        ),
    );
  }
}
