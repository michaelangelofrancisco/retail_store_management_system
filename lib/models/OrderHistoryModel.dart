class OrderHistoryModel {
  //Getting the Data details of costumer from database to Sale History every order number

  int? productDetailsNumber;
  String? productName;
  double? price;
  String? size;
  int? quantity;
  String? status;
  int? get getProductDetailsNumber => this.productDetailsNumber;

  set setProductDetailsNumber(int? productDetailsNumber) =>
      this.productDetailsNumber = productDetailsNumber;

  get getProductName => this.productName;

  set setProductName(productName) => this.productName = productName;

  get getPrice => this.price;

  set setPrice(price) => this.price = price;

  get getSize => this.size;

  set setSize(size) => this.size = size;

  get getQuantity => this.quantity;

  set setQuantity(quantity) => this.quantity = quantity;

  get getStatus => this.status;

  set setStatus(status) => this.status = status;

  OrderHistoryModel.empty();

  OrderHistoryModel.inventory(int productDetailsNumber, String productName,
      double price, String size, int quantity, String status) {
    this.productDetailsNumber = productDetailsNumber;
    this.productName = productName;
    this.price = price;
    this.size = size;
    this.quantity = quantity;
    this.status = status;
  }

  OrderHistoryModel.fullJson(
      {this.productDetailsNumber,
      this.productName,
      this.price,
      this.size,
      this.quantity,
      this.status});

  factory OrderHistoryModel.inventoryFromJson(Map<String, dynamic> json) {
    return OrderHistoryModel.fullJson(
      productDetailsNumber: json["productDetailsNumber"] as int,
      productName: json['productName'] as String,
      price: json['price'] as double,
      size: json['size'] as String,
      quantity: json['quantity'] as int,
      status: json['status'] as String,
    );
  }
}
