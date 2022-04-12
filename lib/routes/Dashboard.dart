import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:retail_store_management_system/Operations/OrderOperation.dart';
import 'package:retail_store_management_system/Tables/RecentOrders.dart';
import 'package:retail_store_management_system/models/OrderModel.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _Dashboard createState() => _Dashboard();
}

class _Dashboard extends State<Dashboard> {
  late Future<List<OrderModel>> newPurchase;
  var purchase = OrderOperation();
  final productName = TextEditingController();
  final price = TextEditingController();
  final size = TextEditingController();
  final qty = TextEditingController();
  final dateinput = TextEditingController();

  final totalprice = TextEditingController();

  @override
  void initState() {
    // newPurchase = purchase.getPurchaseList(
    //   OrderModel.newPurchase(
    //     'WOw',
    //     800.00,
    //     '80ML',
    //     5,
    //     '2022-04-12',
    //   ),
    // );
    newPurchase = purchase.getPurchaseList(OrderModel.empty());
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
                          setState(() {
                            dateinput.text = pickedDate.toString();
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
                            onPressed: () async {
                              //add the purchase to the list and pass it
                              //to the Future or promise data for the table
                              newPurchase = purchase.getPurchaseList(
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
                                  print(
                                    "Name: ${productName.text} and price ${price.text}",
                                  );
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
