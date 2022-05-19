class CheckingProductModel {
  String? productInvName;
  String? productInvSize;
  int? productInvQty;

  get getProductInvName => this.productInvName;

  set setProductInvName(productInvName) => this.productInvName = productInvName;

  get getProductInvSize => this.productInvSize;

  set setProductInvSize(productInvSize) => this.productInvSize = productInvSize;

  get getProductInvQty => this.productInvQty;

  set setProductInvQty(productInvQty) => this.productInvQty = productInvQty;

  CheckingProductModel.empty();

  CheckingProductModel.inventory(
    String productInvName,
    String productInvSize,
    int productInvQty,
  ) {
    this.productInvName = productInvName;
    this.productInvSize = productInvSize;
    this.productInvQty = productInvQty;
  }

  CheckingProductModel.fullJson({
    this.productInvName,
    this.productInvSize,
    this.productInvQty,
  });

  factory CheckingProductModel.inventoryFromJson(Map<String, dynamic> json) {
    return CheckingProductModel.fullJson(
      productInvName: json['productInvName'] as String,
      productInvSize: json['productInvSize'] as String,
      productInvQty: json['productInvQty'] as int,
    );
  }
}
