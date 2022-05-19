import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:retail_store_management_system/models/OrderHistoryModel.dart';
import '../models/InventoryModel.dart';
import 'Collector.dart';

class InventoryOperation {
  Future<bool> sendInventory(String productName, double price, String size,
      int qty, String dateOfPurchase) async {
    try {
      final response = await http.post(
        Uri.parse("http://localhost:8090/api/inventory"),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json'
        },
        body: json.encode({
          "productInvName": productName,
          "productInvPrice": price,
          "productInvSize": size,
          'productInvQuantity': qty,
          'productInvDate': dateOfPurchase
        }),
      );

      if (response.statusCode == 404) return false;
    } catch (e) {
      print(e.toString());
      return false;
    }

    return true;
  }

  Future<List<InventoryModel>> fetchInventory() async {
    final response = await http
        .get(Uri.parse("http://localhost:8090/api/getInformationInventory"));
    final parsed = jsonDecode(response.body).cast<Map<String, dynamic>>();
    Collector.getInventory = parsed
        .map<InventoryModel>((json) => InventoryModel.inventoryFromJson(json))
        .toList();

    // Use the compute function to run parseAdmin in a separate isolate.
    return Collector.getInventory;
  }

  Future<List<OrderHistoryModel>> fetchDetails(int id) async {
    final response = await http.get(Uri.parse(
        "http://localhost:8090/api/getCustomerDetailsForOrderNumber/$id"));
    final parsed = jsonDecode(response.body).cast<Map<String, dynamic>>();
    Collector.getCustomerDetails = parsed
        .map<OrderHistoryModel>(
            (json) => OrderHistoryModel.inventoryFromJson(json))
        .toList();

    return Collector.getCustomerDetails;
  }
}
