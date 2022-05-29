import 'package:intl/intl.dart';
import 'package:retail_store_management_system/models/DataOrderModel.dart';
import 'package:retail_store_management_system/models/OrderModel.dart';
import 'package:retail_store_management_system/models/SalesModel.dart';
import 'package:retail_store_management_system/models/takeOrderModel.dart';

class Collection {
  static String dateToday() {
    var _formatter = new DateFormat('yyyy-MM-dd');
    var _now = new DateTime.now();
    String formattedDate = _formatter.format(_now);
    return formattedDate;
  }

  static List<OrderModel> purchases = [];
  static List<takeOrderModel> takeOrder = [];
  static List<SalesModel> sales = [];
  static List<DataOrderModel> orderHistory = [];
}
