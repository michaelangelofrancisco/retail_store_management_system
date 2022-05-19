import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:retail_store_management_system/routes/Dashboard.dart';
import 'package:retail_store_management_system/routes/Inventory.dart';
import 'package:retail_store_management_system/routes/Order.dart';
import 'package:retail_store_management_system/routes/Sales.dart';
import 'package:retail_store_management_system/routes/login.dart';

class NavBar extends StatefulWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  _NavBar createState() => _NavBar();
}

class _NavBar extends State<NavBar> {
  @override
  void initState() {
    super.initState();
  }

  int _selectedIndex = 0;

  List<Widget> pages = [
    const Dashboard(),
    const Inventory(),
    const Sales(),
    Order(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: <Widget>[
          //list[_selectedIndex],
          NavigationRail(
            elevation: 5,
            minWidth: 25.0,
            minExtendedWidth: 30.0,
            backgroundColor: HexColor("#002147"),
            selectedIndex: _selectedIndex,
            onDestinationSelected: (int index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            labelType: NavigationRailLabelType.all,
            destinations: <NavigationRailDestination>[
              const NavigationRailDestination(
                icon: Icon(
                  Icons.space_dashboard,
                  color: Colors.white,
                ),
                label: Text(
                  'Dashboard',
                  style: TextStyle(
                    fontSize: 8,
                    color: Colors.white,
                  ),
                ),
              ),
              NavigationRailDestination(
                icon: Icon(
                  Icons.inventory,
                  color: Colors.white,
                ),
                label: Text(
                  'Inventory',
                  style: TextStyle(
                    fontSize: 8,
                    color: Colors.white,
                  ),
                ),
              ),
              NavigationRailDestination(
                icon: Icon(
                  Icons.paid,
                  color: Colors.white,
                ),
                label: Text(
                  'Sales',
                  softWrap: true,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 8,
                    color: Colors.white,
                  ),
                ),
              ),
              NavigationRailDestination(
                icon: Icon(
                  Icons.receipt_long,
                  color: Colors.white,
                ),
                label: Text(
                  'Order',
                  softWrap: true,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 8,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          const VerticalDivider(width: 5),
          // This is the main content.
          //this is how we navigate
          //this is where the menus content will be displayed
          Expanded(
            child: Stack(
              clipBehavior: Clip.antiAlias,
              children: <Widget>[
                Center(
                  child: pages[_selectedIndex],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
