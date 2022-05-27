import 'package:retail_store_management_system/operations/Collector.dart';

class Item {
  String productName = '';
  double price = 0.0;
  String size = '';
  int qty = 0;
  String description = '';
  String date = '';
  List<dynamic>? productImage;

  Item.empty();

  Item(this.productName, this.price, this.size, this.qty, this.date,
      this.description, this.productImage);

  Item.full(String productName, double price, String size, int qty, String date,
      String description, List<dynamic>? productImage) {
    this.productName = productName;
    this.price = price;
    this.size = size;
    this.qty = qty;
    this.date = date;
    this.description = description;
    this.productImage = productImage;
  }

  static List<Item> generateRecommendFoods() {
    List<Item> items = [];
    print(Collector.getInventory.length);
    for (var a in Collector.getInventory) {
      items.add(
        Item.full(
          a.getProductName,
          a.getPrice,
          a.getSize,
          a.getQuantity,
          a.getProductInvDate,
          a.getDescription,
          a.getProductImage,
        ),
      );
    }
    print('POTANGI NA MO' + Collector.getInventory.length.toString());
    print(items.length);
    return items;
  }
  /*
  static List<Item> generatePopularFoods() {
    return [
      Item('Relx Infinity', 150.0, '1 Pod', 18,
          'Relx Pod product is a +18 age of use'),
      Item('Relx Infinity', 150.0, '1 Pod', 18,
          'Relx Pod product is a +18 age of use'),
    ];
  }*/
}
