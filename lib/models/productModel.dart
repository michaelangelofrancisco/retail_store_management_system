import 'package:retail_store_management_system/interfaces/widget/ProductImg.dart';

class productModel {
  int? productDetailsId;
  String? productName;
  double? price;
  String? size;
  int? quantity;
  String? productInvDate;
  String? description;
  List<dynamic>? productImage;
  int? get getProductDetailsId => this.productDetailsId;

  set setProductDetailsId(int? productDetailsId) =>
      this.productDetailsId = productDetailsId;

  get getProductName => this.productName;

  set setProductName(productName) => this.productName = productName;

  get getPrice => this.price;

  set setPrice(price) => this.price = price;

  get getSize => this.size;

  set setSize(size) => this.size = size;

  get getQuantity => this.quantity;

  set setQuantity(quantity) => this.quantity = quantity;

  get getProductInvDate => this.productInvDate;

  set setProductInvDate(productInvDate) => this.productInvDate = productInvDate;

  get getDescription => this.description;

  set setDescription(description) => this.description = description;

  get getProductImage => this.productImage;

  set setProductImage(productImage) => this.productImage = productImage;

  productModel.empty();

  productModel.inventory(
      int productDetailsId,
      String productName,
      double price,
      String size,
      int productInvQty,
      String productInvDate,
      String description,
      List<dynamic> productImage) {
    this.productDetailsId = productDetailsId;
    this.productName = productName;
    this.price = price;
    this.size = size;
    this.quantity = quantity;
    this.productInvDate = productInvDate;
    this.description = description;
    this.productImage = productImage;
  }

  productModel.fullJson(
      {this.productDetailsId,
      this.productName,
      this.price,
      this.size,
      this.quantity,
      this.productInvDate,
      this.description,
      this.productImage});

  factory productModel.inventoryFromJson(Map<String, dynamic> json) {
    return productModel.fullJson(
      productDetailsId: json['productDetailsId'] as int,
      productName: json['productName'] as String,
      price: json['productInvPrice'] as double,
      size: json['size'] as String,
      quantity: json['quantity'] as int,
      productInvDate: json['productInvDate'] as String,
      description: json['description'] as String,
      productImage: json['productImage'] as List<dynamic>,
    );
  }
}
