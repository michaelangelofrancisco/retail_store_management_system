class InventoryModel {
  int? productID;
  String? productInvName;
  double? productInvPrice;
  String? productInvSize;
  int? productInvQty;
  String? productInvDate;
  int? get getProductID => this.productID;

  set setProductID(int? productID) => this.productID = productID;

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
    this.productID = productID;
    this.productInvName = productInvName;
    this.productInvPrice = productInvPrice;
    this.productInvSize = productInvSize;
    this.productInvQty = productInvQty;
    this.productInvDate = productInvDate;
  }

  InventoryModel.fullJson({
    this.productID,
    this.productInvName,
    this.productInvPrice,
    this.productInvSize,
    this.productInvQty,
    this.productInvDate,
  });

  factory InventoryModel.inventoryFromJson(Map<String, dynamic> json) {
    return InventoryModel.fullJson(
      productID: json['productID'] as int,
      productInvName: json['productInvName'] as String,
      productInvPrice: json['productInvPric Ste'] as double,
      productInvSize: json['productInvSize'] as String,
      productInvQty: json['productInvQty'] as int,
      productInvDate: json['productInvDate'] as String,
    );
  }
}
