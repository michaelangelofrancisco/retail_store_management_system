import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:retail_store_management_system/interfaces/IOrder.dart';
import 'package:retail_store_management_system/models/OrderModel.dart';
import 'package:retail_store_management_system/models/takeOrderModel.dart';
import 'package:retail_store_management_system/operations/Collection.dart';

class OrderOperation implements IOrder {
  @override
  Future<List<OrderModel>> getPurchaseList(OrderModel newPurchase) async {
    //if the list is empty return empty list
    if (newPurchase.productName == null) {
      return [];
    }

    Collection.purchases.add(
      OrderModel.newPurchase(
          newPurchase.getProductName,
          newPurchase.getProductPrice,
          newPurchase.getProductSize,
          newPurchase.getProductQuantity,
          newPurchase.getDateToday,
          newPurchase.getStatus,
          newPurchase.getstaff),
    );

    //static list of purchases for one copy no overwriting
    //and easy to access
    return Collection.purchases;
  }

  @override
  Future<bool> sendOrders(String dateOfPurchase, int orderNumber,
      String payment, String randomNumber, String state, String status) async {
    print('lalala' + Collection.purchases.length.toString());
    print('random: ' + randomNumber);
    for (var item in Collection.purchases) {
      try {
        final response = await http.post(
          Uri.parse("http://localhost:8090/api/createProduct"),
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json'
          },
          body: json.encode({
            "productName": item.getProductName,
            "price": item.getProductPrice,
            "size": item.getProductSize,
            'quantity': item.getProductQuantity,
            'date': dateOfPurchase,
            'staff': 'ALIJANDRO BALANA',
            'orderNumber': orderNumber,
            'payment': payment,
            'state': state,
            'productDetailsNumber': orderNumber,
            'status': status,
          }),
        );

        if (response.statusCode == 404) return false;
      } catch (e) {
        print(e.toString());
        return false;
      }
    }
    return true;
  }

  @override
  Future<List<takeOrderModel>> takeOrder(takeOrderModel newTakeOrder) async {
    //if the list is empty return empty list
    if (newTakeOrder.productName == null) {
      return [];
    }

    Collection.takeOrder.add(
      takeOrderModel.takeOrder(
          newTakeOrder.getProductName,
          newTakeOrder.getProductPrice,
          newTakeOrder.getProductSize,
          newTakeOrder.getProductQuantity,
          newTakeOrder.getDateToday,
          newTakeOrder.getStatus,
          newTakeOrder.getStaff,
          newTakeOrder.getOrderNumber),
    );

    //static list of purchases for one copy no overwriting
    //and easy to access
    return Collection.takeOrder;
  }

  Future<int> getOrderNumber() async {
    Map<String, dynamic> orderNumber;
    final response = await http
        .get(Uri.parse("http://localhost:8090/api/orderNumberBiggest"));

    orderNumber = jsonDecode(response.body);

    // Use the compute function to run parseAdmin in a separate isolate.
    return orderNumber["max_order_number"];
  }
}
