import 'package:retail_store_management_system/models/OrderHistoryModel.dart';

import '../models/InventoryModel.dart';
import '../models/OrderModel.dart';

class Collector {
  static List<InventoryModel> getInventory = [];
  static List<OrderHistoryModel> getCustomerDetails = [];
}
