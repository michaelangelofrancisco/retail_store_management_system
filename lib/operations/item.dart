import 'package:retail_store_management_system/operations/Collector.dart';

class Item {
  String productName = '';
  double price = 0.0;
  String size = '';
  int qty = 0;
  String description = '';

  Item.empty();

  Item(this.productName, this.price, this.size, this.qty, this.description);

  Item.full(String productName, double price, String size, int qty,
      String description) {
    this.productName = productName;
    this.price = price;
    this.size = size;
    this.qty = qty;
    this.description = description;
  }

  static List<Item> generateRecommendFoods() {
    List<Item> items = [];
    print(Collector.getInventory.length);
    for (var a in Collector.getInventory) {
      items.add(Item.full(a.getProductInvName, a.getProductInvPrice,
          a.getProductInvSize, a.getProductInvQty, "Description"));
    }

    print(items.length);
    return items;
  }

  static List<Item> generatePopularFoods() {
    return [
      Item('Relx Infinity', 150.0, '1 Pod', 18,
          'Relx Pod product is a +18 age of use'),
      Item('Relx Infinity', 150.0, '1 Pod', 18,
          'Relx Pod product is a +18 age of use'),
    ];
  }
}
