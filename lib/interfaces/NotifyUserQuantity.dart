import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:retail_store_management_system/routes/CreateAccount.dart';
import 'package:retail_store_management_system/routes/Dashboard.dart';

//This File Notifies the user if the quantity of the product is not enough
class NotifyUserQuantity extends StatefulWidget {
  @override
  _NotifyUserQuantity createState() => _NotifyUserQuantity();
}

class _NotifyUserQuantity extends State<NotifyUserQuantity> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
                Navigator.pop(context);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Text(
              'Quantity of the Product is not Enough',
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
        ],
      ),
    );
  }
}
