import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';
import 'package:retail_store_management_system/operations/InventoryOperation.dart';
import 'package:retail_store_management_system/operations/NewInventory/InventoryListView.dart';
import 'package:retail_store_management_system/operations/Picker.dart';
import 'package:retail_store_management_system/operations/Product.dart';
import 'package:retail_store_management_system/operations/item.dart';

class Inventory extends StatefulWidget {
  @override
  _Inventory createState() => _Inventory();
}

class _Inventory extends State<Inventory> {
  final productName = TextEditingController();
  final price = TextEditingController();
  final size = TextEditingController();
  final qty = TextEditingController();
  var dateinput = TextEditingController();
  final description = TextEditingController();
  var inventory = InventoryOperation();

  String state = 'inventory';

  var selected = 0;
  final pageController = PageController();
  final product = Product.generateStore();
  var a = InventoryOperation();
  String fileName = 'UPLOAD IMAGE';

  var pick = Picker();

  int randomNumber() {
    Random random = new Random();
    var randomNumber = random.nextInt(100);

    return randomNumber;
  }

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
          Container(
            alignment: Alignment.topRight,
            child: Container(
              width: 500,
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Search:',
                  suffixIcon: Icon(
                    Icons.search,
                  ),
                ),
              ),
            ),
          ),
          Row(
            children: [
              Container(
                width: 400,
                height: 600,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      'New Product',
                      softWrap: true,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Cairo_Bold',
                        fontSize: 27,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Container(
                      width: 30,
                      child: Divider(
                        color: HexColor("#C23B23"),
                        thickness: 2,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 14),
                      child: Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Product Name:',
                          style: TextStyle(fontSize: 10),
                        ),
                      ),
                    ),
                    Container(
                      width: 380,
                      padding: EdgeInsets.only(bottom: 10),
                      child: TextField(
                        controller: productName,
                        maxLength: 30,
                        decoration: InputDecoration(
                          counterText: '',
                          hintText: 'Product Name:',
                          filled: true,
                          fillColor: Colors.blueGrey[50],
                          labelStyle: TextStyle(fontSize: 10),
                          contentPadding: EdgeInsets.only(left: 10),
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
                      padding: EdgeInsets.only(left: 14),
                      child: Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Price',
                          style: TextStyle(fontSize: 10),
                        ),
                      ),
                    ),
                    Container(
                      width: 380,
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 10),
                        child: TextField(
                          controller: price,
                          maxLength: 12,
                          decoration: InputDecoration(
                            counterText: '',
                            hintText: 'Price',
                            filled: true,
                            fillColor: Colors.blueGrey[50],
                            labelStyle: TextStyle(fontSize: 10),
                            contentPadding: EdgeInsets.only(left: 10),
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
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 14),
                      child: Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Size',
                          style: TextStyle(fontSize: 10),
                        ),
                      ),
                    ),
                    Container(
                      width: 380,
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 10),
                        child: TextField(
                          controller: size,
                          decoration: InputDecoration(
                            hintText: 'Size',
                            filled: true,
                            fillColor: Colors.blueGrey[50],
                            labelStyle: TextStyle(fontSize: 10),
                            contentPadding: EdgeInsets.only(left: 10),
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
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 14),
                      child: Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Quantity',
                          style: TextStyle(fontSize: 10),
                        ),
                      ),
                    ),
                    Container(
                      width: 380,
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 10),
                        child: TextField(
                          controller: qty,
                          decoration: InputDecoration(
                            hintText: 'Quantity',
                            filled: true,
                            fillColor: Colors.blueGrey[50],
                            labelStyle: TextStyle(fontSize: 10),
                            contentPadding: EdgeInsets.only(left: 10),
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
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 14),
                      child: Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Date Today',
                          style: TextStyle(fontSize: 10),
                        ),
                      ),
                    ),
                    Container(
                      width: 380,
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 10),
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
                                        primary:
                                            Colors.black, //Button Text Color
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
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 14),
                      child: Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Description',
                          style: TextStyle(fontSize: 10),
                        ),
                      ),
                    ),
                    Container(
                      width: 380,
                      padding: EdgeInsets.only(bottom: 10),
                      child: TextField(
                        controller: description,
                        maxLength: 100,
                        decoration: InputDecoration(
                          counterText: '',
                          hintText: 'Description',
                          filled: true,
                          fillColor: Colors.blueGrey[50],
                          labelStyle: TextStyle(fontSize: 10),
                          contentPadding: EdgeInsets.only(left: 10),
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
                    /*Padding(
                      padding: EdgeInsets.only(top: 3),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Stack(
                          children: <Widget>[
                            Positioned.fill(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: HexColor("#155293"),
                                ),
                              ),
                            ),
                            TextButton.icon(
                              icon:
                                  Icon(Icons.attach_file, color: Colors.white),
                              style: TextButton.styleFrom(
                                primary: Colors.white,
                                textStyle: TextStyle(
                                    fontSize: 12, fontFamily: 'Cairo_SemiBold'),
                              ),
                              label: Text(fileName),
                              onPressed: () {
                                //get the filename and display it
                                pick.pickFile().then((value) {
                                  setState(() {
                                    fileName = value;
                                  });
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                    ),*/
                    Container(
                      width: 380,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [
                            BoxShadow(
                              color: HexColor("#C23B23").withOpacity(0.2),
                              spreadRadius: 1,
                            )
                          ]),
                      child: ElevatedButton(
                        child: Container(
                          width: double.infinity,
                          height: 50,
                          child: Center(child: Text('ADD')),
                        ),
                        onPressed: () {
                          inventory
                              .sendInventory(
                                productName.text,
                                double.parse(price.text),
                                size.text,
                                int.parse(qty.text),
                                dateinput.text,
                                description.text,
                                state,
                              )
                              .then((value) => {
                                    setState(() {
                                      a.fetchInventory();
                                    }),
                                  });
                        },
                        style: ElevatedButton.styleFrom(
                            primary: HexColor("#C23B23"),
                            onPrimary: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15))),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 15,
              ),
              Expanded(
                child: Container(
                  width: 1000,
                  height: 500,
                  child: InventoryListView(selected, (int index) {
                    setState(() {
                      selected = index;
                    });
                  }, pageController, product),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
