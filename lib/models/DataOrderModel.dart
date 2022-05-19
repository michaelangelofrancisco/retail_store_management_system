class DataOrderModel {
  String? productName;
  double? price;
  String? size;
  int? quantity;
  String? status;
  String? dateOfPurchased;
  String? staff;

  get getProductName => this.productName;

  set setProductName(String? productName) => this.productName = productName;

  get getPrice => this.price;

  set setPrice(price) => this.price = price;

  get getSize => this.size;

  set setSize(size) => this.size = size;

  get getQuantity => this.quantity;

  set setQuantity(quantity) => this.quantity = quantity;

  get getStatus => this.status;

  set getStatus(status) => this.status = status;

  get getDateOfPurchased => this.dateOfPurchased;

  set setDateOfPurchased(dateOfPurchased) =>
      this.dateOfPurchased = dateOfPurchased;

  get getStaff => this.staff;

  set setStaff(staff) => this.staff = staff;

  DataOrderModel.empty();

  DataOrderModel.tableFull(String productNumber, double price, String size,
      int quantity, String status, String dateOfPurcahased, String stuff) {
    this.productName = productName;
    this.price = price;
    this.size = size;
    this.quantity = quantity;
    this.status = status;
    this.dateOfPurchased = dateOfPurcahased;
    this.staff = staff;
  }

  DataOrderModel.fullJson(
      {this.productName,
      this.price,
      this.size,
      this.quantity,
      this.status,
      this.dateOfPurchased,
      this.staff});

  factory DataOrderModel.salesFromJson(Map<String, dynamic> json) {
    return DataOrderModel.fullJson(
      productName: json['productName'] as String,
      price: json['price'] as double,
      size: json['size'] as String,
      quantity: json['quantity'] as int,
      status: json['status'] as String,
      dateOfPurchased: json['date'] as String,
      staff: json['staff'] as String,
    );
  }
}
