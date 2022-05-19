import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:retail_store_management_system/routes/CreateAccount.dart';

class Login extends StatefulWidget {
  @override
  _Login createState() => _Login();
}

class _Login extends State<Login> {
  final username = TextEditingController();
  final password = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.height / 40,
              horizontal: MediaQuery.of(context).size.height / 40,
            ),
            child: Container(
              width: 300,
              child: _loginForm(context),
            ),
          )
        ],
      ),
    );
  }

  Widget _loginForm(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: username,
          decoration: InputDecoration(
            hintText: 'Username',
            filled: true,
            fillColor: Colors.blueGrey[50],
            labelStyle: TextStyle(fontSize: 12),
            contentPadding: EdgeInsets.only(left: 30),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blueGrey.shade50),
              borderRadius: BorderRadius.circular(15),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blueGrey.shade50),
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ),
        SizedBox(height: 10),
        TextField(
          controller: password,
          obscureText: true,
          decoration: InputDecoration(
            hintText: 'Password',
            filled: true,
            fillColor: Colors.blueGrey[50],
            labelStyle: TextStyle(fontSize: 12),
            contentPadding: EdgeInsets.only(left: 30),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blueGrey.shade50),
              borderRadius: BorderRadius.circular(15),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blueGrey.shade50),
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 0),
          child: TextButton(
            child: Text(
              'Forgot Password?',
              style: TextStyle(
                fontSize: 12,
                fontFamily: 'Cairo_SemiBold',
              ),
            ),
            onPressed: () {},
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 0),
          child: TextButton(
            child: Text(
              'Create New Account',
              style: TextStyle(
                fontSize: 12,
                fontFamily: 'Cairo_SemiBold',
              ),
            ),
            onPressed: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => CreateAccount()));
            },
          ),
        ),
        SizedBox(height: 10),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                color: Colors.deepPurple.shade100,
                spreadRadius: 10,
                blurRadius: 20,
              ),
            ],
          ),
          child: ElevatedButton(
            child: Container(
              width: double.infinity,
              height: 50,
              child: Center(
                child: Text(
                  "Log In",
                  style: TextStyle(fontFamily: 'Cairo_Bold', fontSize: 18),
                ),
              ),
            ),
            style: ElevatedButton.styleFrom(
              onPrimary: Colors.white,
            ),
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/home');
            },
          ),
        ),
      ],
    );
  }
}
