import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:retail_store_management_system/operations/InventoryOperation.dart';
import 'package:retail_store_management_system/operations/Product.dart';
import 'package:retail_store_management_system/operations/ProductListView.dart';
import 'package:retail_store_management_system/operations/StoreInfo.dart';
import 'package:retail_store_management_system/routes/ProductList.dart';

class PrototypeDashboard extends StatefulWidget {
  @override
  _PrototypeDashboard createState() => _PrototypeDashboard();
}

class _PrototypeDashboard extends State<PrototypeDashboard> {
  var selected = 0;
  final pageController = PageController();
  final product = Product.generateStore();
  var a = InventoryOperation();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor("#faf7f7"),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          StoreInfo(),
          ProductList(selected, (int index) {
            setState(() {
              selected = index;
            });
            pageController.jumpToPage(index);
          }, product),
          Expanded(
            child: ProductListView(selected, (int index) {
              setState(() {
                selected = index;
              });
            }, pageController, product),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Colors.yellow,
          elevation: 2,
          child: Icon(
            Icons.shopping_bag_outlined,
            color: Colors.black,
            size: 30,
          )),
    );
  }
}