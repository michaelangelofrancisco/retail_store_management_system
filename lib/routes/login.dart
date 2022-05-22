import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:retail_store_management_system/operations/InventoryOperation.dart';
import 'package:retail_store_management_system/routes/CreateAccount.dart';
import 'package:retail_store_management_system/routes/Home.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      body: ListView(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width / 12),
        children: [
          Menu(),
          Body(),
        ],
      ),
    );
  }
}

class Menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              _menuItem(title: 'Home'),
              _menuItem(title: 'About us'),
              _menuItem(title: 'Contact us'),
              _menuItem(title: 'Help'),
            ],
          ),
          Row(
            children: [
              _menuItem(title: 'Sign in', isActive: true),
              _registerButton(),
            ],
          )
        ],
      ),
    );
  }

  Widget _menuItem({String title = '', bool isActive = false}) {
    return Padding(
      padding: EdgeInsets.only(right: 75),
      child: Column(
        children: [
          Text('$title',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: isActive ? HexColor("#002147") : Colors.grey)),
          SizedBox(
            height: 6,
          ),
          isActive
              ? Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 2),
                  decoration: BoxDecoration(
                      color: HexColor("#002147"),
                      borderRadius: BorderRadius.circular(30)),
                )
              : SizedBox()
        ],
      ),
    );
  }

  Widget _registerButton() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 8),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
                color: Color.fromARGB(255, 238, 235, 235),
                spreadRadius: 10,
                blurRadius: 12)
          ]),
      child: Text(
        'Register',
        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black54),
      ),
    );
  }
}

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 220,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Tindahan',
                  style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold)),
              SizedBox(
                height: 30,
              ),
              Text('Dont have an account?',
                  style: TextStyle(
                      color: Colors.black45, fontWeight: FontWeight.bold)),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text('You can',
                      style: TextStyle(
                          color: Colors.black54, fontWeight: FontWeight.bold)),
                  SizedBox(
                    width: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(),
                    child: TextButton(
                      child: Text(
                        'Register Here!',
                        style: TextStyle(
                            color: HexColor("#002147"),
                            fontSize: 12,
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
              ),
              Image.asset(
                'images/together.png',
                width: 200,
              )
            ],
          ),
        ),
        Image.asset('images/avatarphone.png', width: 250),
        Padding(
          padding: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.height / 6),
          child: Container(
            width: 300,
            child: _formLogin(context),
          ),
        ),
      ],
    );
  }

  @override
  Widget _formLogin(BuildContext context) {
    return Column(
      children: [
        TextField(
            decoration: InputDecoration(
                hintText: 'Username',
                fillColor: Colors.blueGrey[50],
                filled: true,
                labelStyle: TextStyle(fontSize: 12),
                contentPadding: EdgeInsets.only(left: 30),
                enabledBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Color.fromARGB(255, 241, 242, 243)),
                  borderRadius: BorderRadius.circular(15),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Color.fromARGB(255, 241, 242, 243)),
                  borderRadius: BorderRadius.circular(15),
                ))),
        SizedBox(
          height: 30,
        ),
        TextField(
            decoration: InputDecoration(
                hintText: 'Password',
                counterText: 'Forgot Password?',
                suffixIcon:
                    Icon(Icons.visibility_off_outlined, color: Colors.grey),
                fillColor: Colors.blueGrey[50],
                filled: true,
                labelStyle: TextStyle(fontSize: 12),
                contentPadding: EdgeInsets.only(left: 30),
                enabledBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Color.fromARGB(255, 241, 242, 243)),
                  borderRadius: BorderRadius.circular(15),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Color.fromARGB(255, 241, 242, 243)),
                  borderRadius: BorderRadius.circular(15),
                ))),
        SizedBox(
          height: 40,
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
              child: Center(child: Text('Sign In')),
            ),
            onPressed: () {
              var a = InventoryOperation();
              a.fetchInventory();
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (BuildContext context) => Home()));
            },
            style: ElevatedButton.styleFrom(
                primary: HexColor("#002147"),
                onPrimary: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15))),
          ),
        )
      ],
    );
  }
}
