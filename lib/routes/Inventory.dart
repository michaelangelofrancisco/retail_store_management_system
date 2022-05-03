import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';
import 'package:retail_store_management_system/Tables/InventoryList.dart';
import 'package:retail_store_management_system/models/InventoryModel.dart';

import '../operations/InventoryOperation.dart';

class Inventory extends StatefulWidget {
  const Inventory({Key? key}) : super(key: key);

  @override
  _Inventory createState() => _Inventory();
}

class _Inventory extends State<Inventory> {
  final productName = TextEditingController();
  final price = TextEditingController();
  final size = TextEditingController();
  final qty = TextEditingController();
  var dateinput = TextEditingController();
  late Future<List<InventoryModel>> inventoryShow;
  var inventory = InventoryOperation();
  var a = InventoryOperation();

  @override
  void initState() {
    setState(() {
      inventoryShow = a.fetchInventory();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              shadowColor: Colors.black,
              elevation: 5,
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    TextButton.icon(
                      //Today collection graph
                      icon: Icon(
                        Icons.trending_up,
                        size: 24,
                        color: Colors.black,
                      ),
                      label: Text(
                        //vars here to be setState
                        'Coke',
                        softWrap: true,
                        style: TextStyle(
                          fontSize: 50,
                          color: HexColor("#155293"),
                          fontFamily: 'Cairo_Bold',
                        ),
                      ),
                      onPressed: () {}, //pwdeng refresh button
                    ),
                    Center(
                      child: Text(
                        'BEST SELLER',
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              shadowColor: Colors.black,
              elevation: 5,
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    TextButton.icon(
                      //this weeek collection graph
                      icon: Icon(
                        Icons.trending_down,
                        size: 24,
                        color: Colors.black,
                      ),
                      label: Text(
                        //vars here to be setState
                        'Sprite',
                        softWrap: true,
                        style: TextStyle(
                          fontSize: 50,
                          color: HexColor("#155293"),
                          fontFamily: 'Cairo_Bold',
                        ),
                      ),
                      onPressed: () {}, //pwdeng refresh button
                    ),
                    Center(
                      child: Text(
                        'LATEST SELLER',
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              shadowColor: Colors.black,
              elevation: 5,
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    TextButton.icon(
                      //Month collection graph
                      icon: Icon(
                        Icons.shopping_cart,
                        size: 24,
                        color: Colors.black,
                      ),
                      label: Text(
                        //vars here to be setState
                        '3000',
                        softWrap: true,
                        style: TextStyle(
                          fontSize: 50,
                          color: HexColor("#155293"),
                          fontFamily: 'Cairo_Bold',
                        ),
                      ),
                      onPressed: () {}, //pwdeng refresh button
                    ),
                    Center(
                      child: Text(
                        'TODAY SALES',
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              shadowColor: Colors.black,
              elevation: 5,
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    TextButton.icon(
                      //Month collection graph
                      icon: Icon(
                        Icons.event_available,
                        size: 24,
                        color: Colors.black,
                      ),
                      label: Text(
                        //vars here to be setState
                        '10000',
                        softWrap: true,
                        style: TextStyle(
                          fontSize: 50,
                          color: HexColor("#155293"),
                          fontFamily: 'Cairo_Bold',
                        ),
                      ),
                      onPressed: () {}, //pwdeng refresh button
                    ),
                    Center(
                      child: Text(
                        'TOTAL SALES',
                      ),
                    ),
                  ],
                ),
              ),
            ),
            //inputs
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              width: (MediaQuery.of(context).size.width) / 5,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Text(
                      'New Product',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: HexColor("#155293"),
                        fontFamily: 'Cairo_Bold',
                        fontSize: 30,
                        overflow: TextOverflow.fade,
                      ),
                      maxLines: 2,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(6),
                    child: TextField(
                      controller: productName,
                      decoration: InputDecoration(
                        hintText: 'Product name',
                        filled: true,
                        fillColor: Colors.blueGrey[50],
                        labelStyle: TextStyle(fontSize: 10),
                        contentPadding: EdgeInsets.only(left: 15),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.blueGrey.shade50),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.blueGrey.shade50),
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(6),
                    child: TextField(
                      controller: price,
                      decoration: InputDecoration(
                        hintText: 'Price',
                        filled: true,
                        fillColor: Colors.blueGrey[50],
                        labelStyle: TextStyle(fontSize: 12),
                        contentPadding: EdgeInsets.only(left: 15),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.blueGrey.shade50),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.blueGrey.shade50),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(6),
                    child: TextField(
                      controller: size,
                      decoration: InputDecoration(
                        hintText: 'Size',
                        filled: true,
                        fillColor: Colors.blueGrey[50],
                        labelStyle: TextStyle(fontSize: 12),
                        contentPadding: EdgeInsets.only(left: 15),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.blueGrey.shade50),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.blueGrey.shade50),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(6),
                    child: TextField(
                      controller: qty,
                      decoration: InputDecoration(
                        hintText: 'Quantity',
                        filled: true,
                        fillColor: Colors.blueGrey[50],
                        labelStyle: TextStyle(fontSize: 12),
                        contentPadding: EdgeInsets.only(left: 15),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.blueGrey.shade50),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.blueGrey.shade50),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 15),
                    child: TextField(
                      controller: dateinput,
                      decoration: InputDecoration(
                        labelStyle: TextStyle(fontSize: 12),
                        contentPadding: EdgeInsets.only(left: 15),
                        filled: true,
                        hintText: 'Date Today',
                        fillColor: Colors.blueGrey[50],
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.blueGrey.shade50),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.blueGrey.shade50),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      //readOnly: true,
                      onTap: () async {
                        DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2022),
                          lastDate: DateTime(2032),
                          builder: (context, child) {
                            return Theme(
                              data: Theme.of(context).copyWith(
                                colorScheme: ColorScheme.light(
                                  primary: Colors.red, //Background Color
                                  onPrimary: Colors.white, //Text Color
                                ),
                                textButtonTheme: TextButtonThemeData(
                                  style: TextButton.styleFrom(
                                    primary: Colors.black, //Button Text Color
                                  ),
                                ),
                              ),
                              child: child!,
                            );
                          },
                        );
                        if (pickedDate != null) {
                          String formatDate =
                              DateFormat('yyyy-MM-dd').format(pickedDate);
                          setState(() {
                            dateinput.text = formatDate;
                          });
                        } else {
                          print("Date is not selected");
                        }
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Stack(
                        children: <Widget>[
                          Positioned.fill(
                            child: Container(
                              decoration: BoxDecoration(
                                color: HexColor("#155293"),
                              ),
                            ),
                          ),
                          TextButton(
                            style: TextButton.styleFrom(
                              padding: const EdgeInsets.only(
                                top: 18,
                                bottom: 18,
                                left: 120,
                                right: 120,
                              ),
                              primary: Colors.white,
                              textStyle: TextStyle(
                                fontFamily: 'Cairo_SemiBold',
                                fontSize: 20,
                              ),
                            ),
                            child: const Text('ADD'),
                            onPressed: () {
                              inventory
                                  .sendInventory(
                                      productName.text,
                                      double.parse(price.text),
                                      size.text,
                                      int.parse(qty.text),
                                      dateinput.text)
                                  .then((value) =>
                                      print('New product has been added'));
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            FutureBuilder<List<InventoryModel>>(
              future: inventoryShow,
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const CircularProgressIndicator();
                }
                if (snapshot.hasData) {
                  return SizedBox(
                    width: (MediaQuery.of(context).size.width) / 1.5,
                    height: (MediaQuery.of(context).size.height) / 2,
                    child: InventoryList(
                      inventoryList: snapshot.data,
                    ),
                  );
                }
                return const Text('No data');
              },
            )
          ],
        ),
      ],
    );
  }
}
