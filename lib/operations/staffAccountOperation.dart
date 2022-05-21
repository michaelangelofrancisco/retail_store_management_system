import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:retail_store_management_system/models/CheckingProductModel.dart';
import 'package:retail_store_management_system/models/OrderHistoryModel.dart';
import '../models/InventoryModel.dart';
import 'Collector.dart';

class staffAccountOperation {
  Future<bool> sendAccountDetails(
      String firstname,
      String lastname,
      int mobileNumber,
      String address,
      String username,
      String password) async {
    try {
      final response = await http.post(
        Uri.parse("http://localhost:8090/api/staffAccount"),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json'
        },
        body: json.encode({
          "firstname": firstname,
          "lastname": lastname,
          "mobileNumber": mobileNumber,
          'address': address,
          'username': username,
          'password': password
        }),
      );

      if (response.statusCode == 404) return false;
    } catch (e) {
      print(e.toString());
      return false;
    }

    return true;
  }
}
