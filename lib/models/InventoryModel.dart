class InventoryModel {
  int? productId;
  String? productInvName;
  double? productInvPrice;
  String? productInvSize;
  int? productInvQty;
  String? productInvDate;

  get getProductId => this.productId;

  set setProductID(productId) => this.productId = productId;

  get getProductInvName => this.productInvName;

  set setProductInvName(productInvName) => this.productInvName = productInvName;

  get getProductInvPrice => this.productInvPrice;

  set setProductInvPrice(productInvPrice) =>
      this.productInvPrice = productInvPrice;

  get getProductInvSize => this.productInvSize;

  set setProductInvSize(productInvSize) => this.productInvSize = productInvSize;

  get getProductInvQty => this.productInvQty;

  set setProductInvQty(productInvQty) => this.productInvQty = productInvQty;

  get getProductInvDate => this.productInvDate;

  set setProductInvDate(productInvDate) => this.productInvDate = productInvDate;

  InventoryModel.empty();

  InventoryModel.inventory(
      int productID,
      String productInvName,
      double productInvPrice,
      String productInvSize,
      int productInvQty,
      String productInvDate) {
    this.productId = productID;
    this.productInvName = productInvName;
    this.productInvPrice = productInvPrice;
    this.productInvSize = productInvSize;
    this.productInvQty = productInvQty;
    this.productInvDate = productInvDate;
  }

  InventoryModel.fullJson({
    this.productId,
    this.productInvName,
    this.productInvPrice,
    this.productInvSize,
    this.productInvQty,
    this.productInvDate,
  });

  factory InventoryModel.inventoryFromJson(Map<String, dynamic> json) {
    return InventoryModel.fullJson(
      productId: json['productId'] as int,
      productInvName: json['productInvName'] as String,
      productInvPrice: json['productInvPrice'] as double,
      productInvSize: json['productInvSize'] as String,
      productInvQty: json['productInvQty'] as int,
      productInvDate: json['productInvDate'] as String,
    );
  }
}
