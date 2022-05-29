import 'package:retail_store_management_system/models/OrderModel.dart';

class IOrder {
  Future<List<OrderModel>> getPurchaseList(OrderModel newPurchase) {
    return Future.value([]);
  }

  Future<bool> sendOrders(String dateOfPurchase, int orderNumber,
      String payment, String randomNumber, String state, String status) {
    return Future.value(true);
  }
}
