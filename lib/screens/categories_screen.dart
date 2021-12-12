import 'package:flutter/material.dart';
import '../widgets/store_item.dart';

import '../dummy_data.dart';
import '../widgets/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 15.0, top: 10.0),
                child: Text("Categories", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
              ),
          ),
          SizedBox(
            height: 175,
            child: GridView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.all(25),
              children: [DUMMY_CATEGORIES.map(
                    (catData) => CategoryItem(
                  catData.id,
                  catData.title,
                  catData.color,
                ),
              ).toList()
              ,].expand((i) => i).toList(),
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                childAspectRatio: 1,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
              ),
            ),
          ),
          Divider(),
          Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Text("Near You", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
              ),
          ),
          SizedBox(
            height: 200,
            child: GridView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.all(25),
              children: [DUMMY_STORES.map(
                    (storeData) => StoreItem(
                      storeData.id,
                      storeData.title,
                      storeData.address,
                ),
              ).toList()
                ,].expand((i) => i).toList(),
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                childAspectRatio: 2 / 3,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
              ),
            ),
          ),
        ],
    ),
    );
  }
}
