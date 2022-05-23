import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:retail_store_management_system/interfaces/DetailPage.dart';
import 'package:retail_store_management_system/operations/NewInventory/InventoryItem.dart';
import 'package:retail_store_management_system/operations/Product.dart';
import 'package:retail_store_management_system/operations/ProductItem.dart';

class InventoryListView extends StatelessWidget {
  final int selected;
  final Function callback;
  final PageController pageController;

  final Product product;

  InventoryListView(
      this.selected, this.callback, this.pageController, this.product);

  @override
  Widget build(BuildContext context) {
    final category = product.menu.keys.toList();

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25),
      child: PageView(
          controller: pageController,
          onPageChanged: (index) => callback(index),
          children: category
              .map((e) => ListView.separated(
                  padding: EdgeInsets.zero,
                  itemBuilder: (context, index) => GestureDetector(
                      //menus
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => DetailPage(
                                product.menu[category[selected]]![index])));
                      },
                      //laman ng menus
                      child: InventoryItem(
                          product.menu[category[selected]]![index])),
                  separatorBuilder: (_, index) => SizedBox(
                        height: 15,
                      ),
                  itemCount: product.menu[category[selected]]!.length))
              .toList()),
    );
  }
}
