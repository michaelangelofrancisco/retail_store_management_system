import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:retail_store_management_system/models/DataOrderModel.dart';
import 'package:retail_store_management_system/models/SalesModel.dart';
import 'package:retail_store_management_system/operations/Collection.dart';

class SalesOperation {
  Future<List<SalesModel>> getSalesInformation() async {
    try {
      final response = await http.get(
        Uri.parse("http://localhost:8090/api/getInformationSales"),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json'
        },
      );

      final parsed = jsonDecode(response.body).cast<Map<String, dynamic>>();
      Collection.sales = parsed
          .map<SalesModel>((json) => SalesModel.salesFromJson(json))
          .toList();

      // Use the compute function to run parseAdmin in a separate isolate.
      return Collection.sales;
    } catch (e) {
      return [];
    }
  }

  Future<List<DataOrderModel>> getOrderInformation(int ordernumber) async {
    try {
      final response = await http.get(
        Uri.parse(
            "http://localhost:8090/api/getInformationForOrderNumber/$ordernumber"),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json'
        },
      );

      final parsed = jsonDecode(response.body).cast<Map<String, dynamic>>();
      Collection.orderHistory = parsed
          .map<DataOrderModel>((json) => DataOrderModel.salesFromJson(json))
          .toList();

      // Use the compute function to run parseAdmin in a separate isolate.
      return Collection.orderHistory;
    } catch (e) {
      return [];
    }
  }
}
