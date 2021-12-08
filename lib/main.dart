import 'package:flutter/material.dart';
import 'package:project_demo/screens/settings_screen.dart';
import 'package:provider/provider.dart';

import './providers/great_places.dart';
import './screens/places_list_screen.dart';
import './screens/add_place_screen.dart';
import './screens/place_detail_screen.dart';
import 'providers/auth.dart';
import 'providers/cart.dart';
import 'providers/orders.dart';
import 'providers/products.dart';
import 'screens/auth_screen.dart';
import 'screens/cart_screen.dart';
import 'screens/category_meals_screen.dart';
import 'screens/edit_product_screen.dart';
import 'screens/filters_screen.dart';
import 'screens/meal_detail_screen.dart';
import 'screens/orders_screen.dart';
import 'screens/product_detail_screen.dart';
import 'screens/products_overview_screen.dart';
import 'screens/splash_screen.dart';
import 'screens/tabs_screen.dart';
import 'screens/user_products_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  Map<int, Color> color =
  {
    50:Color.fromRGBO(243, 90, 106, .1),
    100:Color.fromRGBO(243, 90, 106, .2),
    200:Color.fromRGBO(243, 90, 106, .3),
    300:Color.fromRGBO(243, 90, 106, .4),
    400:Color.fromRGBO(243, 90, 106, .5),
    500:Color.fromRGBO(243, 90, 106, .6),
    600:Color.fromRGBO(243, 90, 106, .7),
    700:Color.fromRGBO(243, 90, 106, .8),
    800:Color.fromRGBO(243, 90, 106, .9),
    900:Color.fromRGBO(243, 90, 106, 1),
  };
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Auth(),
        ),
        ChangeNotifierProxyProvider<Auth, Products>(
          create: null,
          update: (con, val, old) => Products(val.token, val.userId, old == null ? [] : old.items),
        ),
        ChangeNotifierProvider.value(
          value: Cart(),
        ),
        ChangeNotifierProxyProvider<Auth, Orders>(
          create: null,
          update: (con, val, old) => Orders(val.token, val.userId, old == null ? [] : old.orders),
        ),
        ChangeNotifierProvider.value(
          value: GreatPlaces(),
        ),
      ],
      child: Consumer<Auth>(
          builder: (ctx, auth, _) => MaterialApp(
            title: 'MyShop',
            theme: ThemeData(
              primarySwatch: MaterialColor(0xFFF35A6A, color),
              accentColor: Colors.purple,
            ),
            home: auth.isAuth
                ? ProductDetailScreen()
                : FutureBuilder(
              future: auth.tryAutoLogin(),
              builder: (ctx, authResultSnapshot) =>
              authResultSnapshot.connectionState ==
                  ConnectionState.waiting
                  ? SplashScreen()
                  : AuthScreen(),
            ),
            routes: {
              ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),
              CartScreen.routeName: (ctx) => CartScreen(),
              OrdersScreen.routeName: (ctx) => OrdersScreen(),
              UserProductsScreen.routeName: (ctx) => UserProductsScreen(),
              EditProductScreen.routeName: (ctx) => EditProductScreen(),
              CategoryMealsScreen.routeName: (ctx) => CategoryMealsScreen(),
              TabsScreen.routeName: (ctx) => TabsScreen(),
              SettingsScreen.routeName: (ctx) => SettingsScreen(),
            },
          ),
      ),
    );
  }
}
