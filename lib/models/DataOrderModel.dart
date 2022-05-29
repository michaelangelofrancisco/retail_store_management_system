class DataOrderModel {
  String? productName;
  double? price;
  String? size;
  int? quantity;
  String? status;

  String? get getProductName => this.productName;

  set setProductName(String? productName) => this.productName = productName;

  get getPrice => this.price;

  set setPrice(price) => this.price = price;

  get getSize => this.size;

  set setSize(size) => this.size = size;

  get getQuantity => this.quantity;

  set setQuantity(quantity) => this.quantity = quantity;

  get getStatus => this.status;

  set setStatus(status) => this.status = status;
  DataOrderModel.empty();

  DataOrderModel.tableFull(String productNumber, double price, String size,
      int quantity, String status, String dateOfPurcahased, String stuff) {
    this.productName = productName;
    this.price = price;
    this.size = size;
    this.quantity = quantity;
    this.status = status;
  }

  DataOrderModel.fullJson({
    this.productName,
    this.price,
    this.size,
    this.quantity,
    this.status,
  });

  factory DataOrderModel.salesFromJson(Map<String, dynamic> json) {
    return DataOrderModel.fullJson(
      productName: json['productName'] as String,
      price: json['price'] as double,
      size: json['size'] as String,
      quantity: json['quantity'] as int,
      status: json['status'] as String,
    );
  }
}
