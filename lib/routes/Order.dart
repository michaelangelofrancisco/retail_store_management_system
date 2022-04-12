import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:retail_store_management_system/Tables/OrderList.dart';

class Order extends StatefulWidget {
  const Order({Key? key}) : super(key: key);

  @override
  _Order createState() => _Order();
}

class _Order extends State<Order> {
  final productName = TextEditingController();
  final price = TextEditingController();
  TextEditingController dateinput = TextEditingController();

  @override
  void initState() {
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
        Expanded(
          child: Container(
            width: (MediaQuery.of(context).size.width),
            height: (MediaQuery.of(context).size.height) / 0.5,
            child: OrderList(),
          ),
        ),
      ],
    );
  }
}
