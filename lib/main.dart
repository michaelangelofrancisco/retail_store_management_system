import 'package:flutter/material.dart';
import 'package:retail_store_management_system/routes/login.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Retail Store Management System',
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => Login(),
        // '/home': (context) => const Home(),
      },
    );
  }
}
