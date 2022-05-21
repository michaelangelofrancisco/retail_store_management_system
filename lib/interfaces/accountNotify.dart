import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

//This File Notifies the user if the quantity of the product is not enough
class accountNotify extends StatefulWidget {
  @override
  _accountNotify createState() => _accountNotify();
}

class _accountNotify extends State<accountNotify> {
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
              'Account Created Successfully',
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
