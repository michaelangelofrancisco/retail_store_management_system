import 'package:retail_store_management_system/models/DataOrderModel.dart';
import 'package:retail_store_management_system/models/OrderModel.dart';
import 'package:retail_store_management_system/models/SalesModel.dart';

class Collection {
  static List<OrderModel> purchases = [];
  static List<SalesModel> sales = [];
  static List<DataOrderModel> orderHistory = [];
}
