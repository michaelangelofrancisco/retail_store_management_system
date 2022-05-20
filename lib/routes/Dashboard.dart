import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:retail_store_management_system/Operations/OrderOperation.dart';
import 'package:retail_store_management_system/Tables/RecentOrders.dart';
import 'package:retail_store_management_system/interfaces/NotifyUserName.dart';
import 'package:retail_store_management_system/interfaces/NotifyUserQuantity.dart';
import 'package:retail_store_management_system/interfaces/NotifyUserSize.dart';
import 'package:retail_store_management_system/models/OrderModel.dart';
import 'package:retail_store_management_system/operations/Collection.dart';
import 'package:retail_store_management_system/operations/InventoryOperation.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _Dashboard createState() => _Dashboard();
}

class _Dashboard extends State<Dashboard> {
  var order = OrderOperation();
  var check = InventoryOperation();
  late Future<List<OrderModel>> newPurchase;
  final productName = TextEditingController();
  final price = TextEditingController();
  final size = TextEditingController();
  final qty = TextEditingController();
  final dateinput = TextEditingController();

  int orderNumber = 1;
  final totalprice = TextEditingController();

  @override
  void initState() {
    //step 1
    order.getOrderNumber().then((value) {
      setState(() {
        value++;
      });
      orderNumber = value;
    });
    //step 2
    newPurchase = order.getPurchaseList(OrderModel.empty());
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
                          color: HexColor("#1e90ff"),
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
                          color: HexColor("#1e90ff"),
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
                          color: HexColor("#1e90ff"),
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
                          color: HexColor("#1e90ff"),
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
                      'New Purchase',
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
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Order Number: $orderNumber',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: HexColor("#155293"),
                        fontFamily: 'Cairo_Bold',
                        fontSize: 15,
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
                                color: HexColor("#002147"),
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
                            onPressed: () async {
                              //check product before adding to the table
                              check
                                  .fetchProducts(productName.text, size.text)
                                  .then((value) {
                                if (value) {
                                  List<bool> prod = check.checkProd(
                                      productName.text,
                                      size.text,
                                      int.parse(qty.text.toString()));

                                  //check name
                                  if (!prod[0]) {
                                    print("Product name Not Exist");
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return SimpleDialog(
                                            children: [
                                              Container(
                                                width: 410,
                                                height: 130,
                                                child: NotifyUserName(),
                                              ),
                                            ],
                                          );
                                        });
                                    return;
                                  }

                                  //check size
                                  if (!prod[1]) {
                                    print(
                                        "Size does not match any Product Size");
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return SimpleDialog(
                                            children: [
                                              Container(
                                                width: 410,
                                                height: 130,
                                                child: NotifyUserSize(),
                                              ),
                                            ],
                                          );
                                        });
                                    return;
                                  }

                                  //check qty
                                  if (!prod[2]) {
                                    print("QTY is not enough");
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return SimpleDialog(
                                            children: [
                                              Container(
                                                width: 400,
                                                height: 130,
                                                child: NotifyUserQuantity(),
                                              ),
                                            ],
                                          );
                                        });
                                    return;
                                  }

                                  newPurchase = order.getPurchaseList(
                                    OrderModel.newPurchase(
                                      productName.text,
                                      double.parse(price.text),
                                      size.text,
                                      int.parse(qty.text),
                                      dateinput.text,
                                    ),
                                  );

                                  setState(() {
                                    newPurchase = newPurchase;
                                  });
                                } else {
                                  print("ERRORRR");
                                }
                              });

                              // productName.clear();
                              // price.clear();
                              // size.clear();
                              // qty.clear();
                              // dateinput.clear();
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  FutureBuilder<List<OrderModel>>(
                    future: newPurchase,
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return const CircularProgressIndicator();
                      }
                      if (snapshot.hasData) {
                        if (snapshot.data!.isEmpty) {
                          return SizedBox(
                            width: (MediaQuery.of(context).size.width) / 1.5,
                            height: (MediaQuery.of(context).size.height) / 2,
                            child: const Center(
                              child: Text("No Data"),
                            ),
                          );
                        } else {
                          return SizedBox(
                            width: (MediaQuery.of(context).size.width) / 1.5,
                            height: (MediaQuery.of(context).size.height) / 2,
                            child: RecentOrders(
                              newPurchaes: snapshot.data,
                            ),
                          );
                        }
                      } else {
                        return const Text("No Data");
                      }
                    },
                  ),
                  Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10, right: 600),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: Stack(
                            children: <Widget>[
                              Positioned.fill(
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: HexColor("#002147"),
                                  ),
                                ),
                              ),
                              TextButton(
                                style: TextButton.styleFrom(
                                  padding: const EdgeInsets.only(
                                    top: 18,
                                    bottom: 18,
                                    left: 50,
                                    right: 50,
                                  ),
                                  primary: Colors.white,
                                  textStyle: TextStyle(
                                    fontFamily: 'Cairo_SemiBold',
                                    fontSize: 20,
                                  ),
                                ),
                                child: const Text('CHECKOUT'),
                                onPressed: () {
                                  //will add the orders to the database
                                  order
                                      .sendOrders(dateinput.text, orderNumber)
                                      .then((value) =>
                                          Collection.purchases.clear());
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: (MediaQuery.of(context).size.width) / 2,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10, left: 300),
                          child: TextField(
                            controller: totalprice,
                            decoration: InputDecoration(
                              hintText: 'Total price',
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
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
