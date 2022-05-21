import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:retail_store_management_system/routes/login.dart';

class HeadBar extends StatefulWidget with PreferredSizeWidget {
  const HeadBar({Key? key}) : super(key: key);

  @override
  _HeadBar createState() => _HeadBar();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _HeadBar extends State<HeadBar> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: true,
      centerTitle: true,
      backgroundColor: HexColor("#ffffff"),
      //leading: Image.asset('../assets/images/store-logo.png'),
      leadingWidth: 100,
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.only(right: 30),
          child: IconButton(
            icon: const Icon(Icons.logout),
            color: Colors.black,
            tooltip: 'Logout',
            onPressed: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => Login()));
            },
          ),
        ),
      ],

      title: const Text(
        'Retail Store Management System',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.black,
          fontFamily: 'Cairo_Bold',
          fontSize: 30,
          overflow: TextOverflow.fade,
        ),
      ),

      automaticallyImplyLeading: true,
      centerTitle: true,
      backgroundColor: HexColor("#ffffff"),
      //leading: Image.asset('../assets/images/store-logo.png'),
      leadingWidth: 100,
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.only(right: 30),
          child: IconButton(
            icon: const Icon(Icons.logout),
            color: Colors.black,
            tooltip: 'Logout',
            onPressed: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => Login()));
            },
          ),
        ),
      ],
    );
  }
}
