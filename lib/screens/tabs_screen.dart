import 'package:flutter/material.dart';
import '../providers/cart.dart';
import '../screens/payment_screen.dart';
import '../screens/settings_screen.dart';
import '../screens/splash_screen.dart';
import '../widgets/app_drawer.dart';
import '../widgets/badge.dart';
import 'package:provider/provider.dart';

import '../screens/categories_screen.dart';
import '../models/meal.dart';
import '../screens/cart_screen.dart';

class TabsScreen extends StatefulWidget {
  static const routeName = '/tabs-screen';

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, Object>> _pages;
  int _selectedPageIndex = 0;

  @override
  void initState() {
    _pages = [
      {
        'page': CategoriesScreen(),
        'title': 'Home',
      },
      {
        'page': SplashScreen(),
        'title': 'Your Favorite',
      },
      {
        'page': SplashScreen(),
        'title': 'Locations',
      },
      {
        'page': SplashScreen(),
        'title': 'Payment',
      },
    ];
    super.initState();
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]['title'], style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        actions: [
          IconButton(
            color: Colors.black,
            icon: Icon(
              Icons.settings_outlined,
            ),
            onPressed: () {
              Navigator.of(context).pushNamed(SettingsScreen.routeName);
            },
          ),
          Consumer<Cart>(
            builder: (_, cart, ch) => Badge(
              child: ch,
              value: cart.itemCount.toString(),
            ),
            child: IconButton(
              color: Colors.black,
              icon: Icon(
                Icons.shopping_cart,
              ),
              onPressed: () {
                Navigator.of(context).pushNamed(CartScreen.routeName);
              },
            ),
          ),
        ],
      ),
      drawer: AppDrawer(),
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.black,
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
        currentIndex: _selectedPageIndex,
        // type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.home_outlined),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.favorite_border),
            title: Text('Favorites'),
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.location_on_outlined),
            title: Text('Nearby'),
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.account_balance_wallet_outlined),
            title: Text('Wallet'),
          ),
        ],
      ),
    );
  }
}
