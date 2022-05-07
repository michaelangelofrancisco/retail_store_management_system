import 'package:retail_store_management_system/models/OrderModel.dart';

class IOrder {
  Future<List<OrderModel>> getPurchaseList(OrderModel newPurchase) {
    return Future.value([]);
  }

  Future<bool> sendOrders(String dateOfPurchase, int orderNumber) {
    return Future.value(true);
  }
}
