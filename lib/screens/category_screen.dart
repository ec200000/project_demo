import 'package:flutter/material.dart';
import '../widgets/credit_card.dart';
import '../screens/edit_product_screen.dart';
import 'package:provider/provider.dart';

import '../widgets/app_drawer.dart';
import '../widgets/products_grid.dart';
import '../widgets/badge.dart';
import '../providers/cart.dart';
import './cart_screen.dart';
import '../providers/products.dart';

enum FilterOptions {
  Favorites,
  All,
}

class CategoryScreen extends StatefulWidget {
  static const routeName = '/category';

  String title;

  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  var _showOnlyFavorites = false;
  var _isInit = true;
  var _isLoading = false;

  @override
  void initState() {
    // Provider.of<Products>(context).fetchAndSetProducts(); // WON'T WORK!
    // Future.delayed(Duration.zero).then((_) {
    //   Provider.of<Products>(context).fetchAndSetProducts();
    // });
    super.initState();
  }

  @override
  void didChangeDependencies() {
    final routeArgs = ModalRoute.of(context).settings.arguments as Map<String, String>;
    widget.title = routeArgs['title'];
    if (_isInit) {
      setState(() {
        _isLoading = false;
      });
      Provider.of<Products>(context).fetchAndSetProducts().then((_) {
        setState(() {
          _isLoading = false;
        });
      });
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // elevation: 0,
        // iconTheme: IconThemeData(color: Colors.black),
        // backgroundColor: Colors.transparent,
        title: Text(widget.title, ),
      ),
      body: _isLoading
          ? Center(
        child: CircularProgressIndicator(),
      )
          : Column(
            children: [
              CreditCardWidget(),
              CreditCardWidget(),
              CreditCardWidget(),
            ],
          ),
    );
  }
}
