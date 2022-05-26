import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:retail_store_management_system/interfaces/ShopCartDashboard.dart';
import 'package:retail_store_management_system/operations/Collection.dart';
import 'package:retail_store_management_system/operations/InventoryOperation.dart';
import 'package:retail_store_management_system/operations/NewInventory/InventoryListView.dart';
import 'package:retail_store_management_system/operations/Product.dart';
import 'package:retail_store_management_system/routes/AddInventory.dart';
import 'package:retail_store_management_system/routes/Atrry.dart';

class PrototypeInventory extends StatefulWidget {
  @override
  _PrototypeInventory createState() => _PrototypeInventory();
}

class _PrototypeInventory extends State<PrototypeInventory> {
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
          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: InventoryListView(selected, (int index) {
                setState(() {
                  selected = index;
                });
              }, pageController, product),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (BuildContext context) => Atrry()));
          },
          backgroundColor: Colors.yellow,
          elevation: 2,
          child: Icon(
            Icons.add_circle,
            color: Colors.black,
            size: 30,
          )),
    );
  }
}
