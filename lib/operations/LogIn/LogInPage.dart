import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:retail_store_management_system/operations/InventoryOperation.dart';
import 'package:retail_store_management_system/routes/CreateAccount.dart';
import 'package:retail_store_management_system/routes/Home.dart';

class LogInPage extends StatefulWidget {
  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  var a = InventoryOperation();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(size.height > 770
              ? 64
              : size.height > 670
                  ? 32
                  : 16),
          child: Center(
            child: Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(25),
                ),
              ),
              child: AnimatedContainer(
                duration: Duration(milliseconds: 200),
                height: size.height *
                    (size.height > 770
                        ? 0.7
                        : size.height > 670
                            ? 0.8
                            : 0.9),
                width: 500,
                color: Colors.white,
                child: Center(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.all(40),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "LOG IN",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.grey[700],
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
                          SizedBox(
                            height: 32,
                          ),
                          TextField(
                            decoration: InputDecoration(
                              hintText: 'Username:',
                              labelText: 'Username',
                              suffixIcon: Icon(
                                Icons.account_circle,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 32,
                          ),
                          TextField(
                            decoration: InputDecoration(
                              hintText: 'Password:',
                              labelText: 'Password',
                              suffixIcon: Icon(
                                Icons.lock_outline,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 64,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: [
                                BoxShadow(
                                  color: HexColor("#C23B23").withOpacity(0.2),
                                  spreadRadius: 4,
                                  blurRadius: 7,
                                  offset: Offset(0, 3),
                                ),
                              ],
                            ),
                            child: TextButton(
                              onPressed: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            Home()));

                                a.fetchInventory();
                              },
                              child: Container(
                                width: double.infinity,
                                height: 50,
                                color: HexColor("#C23B23"),
                                child: Center(
                                  child: Text(
                                    "Log In",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 32,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Dont have and account?",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14,
                                ),
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(),
                                child: TextButton(
                                  child: Text(
                                    'Register Here!',
                                    style: TextStyle(
                                        color: HexColor("#C23B23"),
                                        fontSize: 14,
                                        fontFamily: 'Cairo_SemiBold',
                                        fontWeight: FontWeight.bold),
                                  ),
                                  onPressed: () {
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                CreateAccount()));
                                  },
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
