import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:retail_store_management_system/models/CheckingProductModel.dart';
import 'package:retail_store_management_system/models/OrderHistoryModel.dart';
import 'package:retail_store_management_system/operations/Collection.dart';
import '../models/InventoryModel.dart';
import 'Collector.dart';

class InventoryOperation {
  Future<bool> sendInventory(String productName, double price, String size,
      int qty, String dateOfPurchase, String description, var img) async {
    try {
      final response = await http.post(
        Uri.parse("http://localhost:8090/api/inventory"),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json'
        },
        body: json.encode({
          "productName": productName,
          "price": price,
          "size": size,
          'quantity': qty,
          'date': dateOfPurchase,
          'description': description,
          'productImage': img
        }),
      );

      if (response.statusCode == 404) return false;
    } catch (e) {
      print(e.toString());
      return false;
    }

    return true;
  }

  Future<bool> sendToIncomingProducts(
      String orderSlipId, String supplierName) async {
    final status = "NOT RECEIVED";
    var response;
    for (var item in Collection.purchases) {
      try {
        var payload = json.encode({
          "purchaseOrdeSlip": orderSlipId,
          "supplierName": supplierName,
          "productCode": item.productCode,
          "qty": item.qty,
          "purchasedDate": item.datePurchase,
          "status": status,
        });
        await Environment.methodPost(
                "http://localhost:8090/api/addpurchase", payload)
            .then((value) {
          response = value;
        });
      } catch (e) {
        e.toString();
        BannerNotif.notif(
          'Error',
          'Something went wrong while adding the loan',
          Colors.red.shade600,
        );
        return false;
      }
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

  Future<List<InventoryModel>> getProductDetails() async {
    final response = await http
        .get(Uri.parse("http://localhost:8090/api/getProductDetails"));
    final parsed = jsonDecode(response.body).cast<Map<String, dynamic>>();
    Collector.getProduct = parsed
        .map<InventoryModel>((json) => InventoryModel.inventoryFromJson(json))
        .toList();

    print('POTANG INA ' + Collector.getInventory.length.toString());

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

    print("LIST ${Collector.getAddedProduct.toList()}");

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
}
