import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:retail_store_management_system/models/CheckingProductModel.dart';
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

  Future<bool> fetchProducts(String var1, String var2) async {
    final response = await http.get(Uri.parse(
        "http://localhost:8090/api/getDetailsForProduct/$var1/$var2"));
    final parsed = jsonDecode(response.body).cast<Map<String, dynamic>>();
    Collector.getAddedProduct = parsed
        .map<CheckingProductModel>(
            (json) => CheckingProductModel.inventoryFromJson(json))
        .toList();

    return true;
  }

  List<bool> checkProd(String name, String size, int prevQty) {
    List<bool> checkName = [false, false, false];

    print(Collector.getAddedProduct.toList());

    Collector.getAddedProduct
        .where((element) => element.getProductInvName == name)
        .forEach((element) {
      // check name
      checkName[0] = true;

      //check size
      if (element.getProductInvSize == size) {
        checkName[1] = true;
        //check qty
        if (element.productInvQty! > 0) {
          if (prevQty <= element.productInvQty! && prevQty != 0) {
            checkName[2] = true;
          }
        }
      }
    });

    return checkName;
  }

  bool checkProductName(String prevName) {
    bool checkName = false;

    Collector.getAddedProduct
        .where((element) => element.getProductInvName == prevName)
        .forEach((element) {
      if (prevName == element.getProductInvName) {
        checkName = true;
      }
    });

    return checkName;
  }

  bool checkProductSize(String prevSize) {
    bool checkSize = false;

    Collector.getAddedProduct
        .where((element) => element.getProductInvSize)
        .forEach((element) {
      if (element.getProductInvSize == prevSize) {
        checkSize = true;
      }
    });

    return checkSize;
  }

  bool checkProduct(int prevQty, String name) {
    bool check = false;

    Collector.getAddedProduct
        .where((element) => element.getProductInvName == name)
        .forEach((element) {
      // check qty
      if (element.productInvQty! > 0) {
        if (prevQty <= element.productInvQty! && prevQty != 0) {
          check = true;
        }
      }
    });

    return check;
  }
}
