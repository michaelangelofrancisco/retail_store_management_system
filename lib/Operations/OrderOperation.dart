import 'package:retail_store_management_system/Operations/Collections.dart';
import 'package:retail_store_management_system/interfaces/IOrder.dart';
import 'package:retail_store_management_system/models/OrderModel.dart';

class OrderOperation implements IOrder {
  @override
  Future<List<OrderModel>> getPurchaseList(OrderModel newPurchase) async {
    //if the list is empty return empty list
    if (newPurchase.productName == null) {
      return [];
    }

    Collections.purchases.add(
      OrderModel.newPurchase(
        newPurchase.getProductName,
        newPurchase.getProductPrice,
        newPurchase.getProductSize,
        newPurchase.getProductQuantity,
        newPurchase.getDateToday,
      ),
    );

    //static list of purchases for one copy no overwriting
    //and easy to access
    return Collections.purchases;
  }
}
