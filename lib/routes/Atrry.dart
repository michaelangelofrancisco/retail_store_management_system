import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';
import 'package:retail_store_management_system/interfaces/accountNotify.dart';
import 'package:retail_store_management_system/models/InventoryModel.dart';
import 'package:retail_store_management_system/operations/InventoryOperation.dart';
import 'package:retail_store_management_system/operations/Product.dart';
import 'package:retail_store_management_system/routes/PrototypeInventory.dart';
import 'package:retail_store_management_system/routes/login.dart';

class Atrry extends StatefulWidget {
  @override
  _Atrry createState() => _Atrry();
}

class _Atrry extends State<Atrry> {
  final productName = TextEditingController();
  final price = TextEditingController();
  final size = TextEditingController();
  final qty = TextEditingController();
  var dateinput = TextEditingController();
  late Future<List<InventoryModel>> inventoryShow;
  var inventory = InventoryOperation();

  var selected = 0;
  final pageController = PageController();
  final product = Product.generateStore();
  var a = InventoryOperation();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actionsPadding: EdgeInsets.only(bottom: 5, left: 5, right: 5),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      actions: <Widget>[
        Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                icon: Icon(
                  Icons.cancel,
                  color: Colors.black,
                  size: 30,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
            Text(
              'New Product',
              softWrap: true,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Cairo_Bold',
                fontSize: 27,
                color: HexColor("#155293"),
                overflow: TextOverflow.fade,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20, left: 2),
              child: Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  'ProductName',
                  style: TextStyle(fontSize: 10),
                ),
              ),
            ),
            Container(
              width: 320,
              child: Padding(
                padding: EdgeInsets.only(bottom: 15),
                child: TextField(
                  controller: productName,
                  decoration: InputDecoration(
                    hintText: 'ProductName',
                    filled: true,
                    fillColor: Colors.blueGrey[50],
                    labelStyle: TextStyle(fontSize: 10),
                    contentPadding: EdgeInsets.only(left: 10),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blueGrey.shade50),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blueGrey.shade50),
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 2),
              child: Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Price',
                  style: TextStyle(fontSize: 10),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 15),
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
                    borderSide: BorderSide(color: Colors.blueGrey.shade50),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blueGrey.shade50),
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 2),
              child: Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Size',
                  style: TextStyle(fontSize: 10),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 15),
              child: TextField(
                controller: size,
                decoration: InputDecoration(
                  hintText: 'Size',
                  filled: true,
                  fillColor: Colors.blueGrey[50],
                  labelStyle: TextStyle(fontSize: 10),
                  contentPadding: EdgeInsets.only(left: 10),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blueGrey.shade50),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blueGrey.shade50),
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 2),
              child: Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Quantity',
                  style: TextStyle(fontSize: 10),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 15),
              child: TextField(
                controller: qty,
                decoration: InputDecoration(
                  hintText: 'Quantity',
                  filled: true,
                  fillColor: Colors.blueGrey[50],
                  labelStyle: TextStyle(fontSize: 10),
                  contentPadding: EdgeInsets.only(left: 10),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blueGrey.shade50),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blueGrey.shade50),
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 2),
              child: Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Date Today',
                  style: TextStyle(fontSize: 10),
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
                    borderSide: BorderSide(color: Colors.blueGrey.shade50),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blueGrey.shade50),
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
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: HexColor("#002147"),
                      spreadRadius: 1,
                      blurRadius: 20,
                    )
                  ]),
              child: ElevatedButton(
                child: Container(
                  width: double.infinity,
                  height: 50,
                  child: Center(child: Text('Create')),
                ),
                onPressed: () {
                  setState(() {
                    a.fetchInventory();
                  });
                  Navigator.of(context).pop();
                  inventory
                      .sendInventory(productName.text, double.parse(price.text),
                          size.text, int.parse(qty.text), dateinput.text)
                      .then((value) => {
                            setState(() {
                              a.fetchInventory();
                            }),
                          });
                },
                style: ElevatedButton.styleFrom(
                    primary: HexColor("#002147"),
                    onPrimary: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15))),
              ),
            ),
          ],
        )
      ],
    );
  }
}
