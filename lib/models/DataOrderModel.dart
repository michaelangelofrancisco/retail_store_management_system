class DataOrderModel {
  String? productName;
  double? price;
  String? size;
  int? quantity;
  double? payment;
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

  get getPayment => this.payment;

  set setPayment(payment) => this.payment = payment;

  get getDateOfPurchased => this.dateOfPurchased;

  set setDateOfPurchased(dateOfPurchased) =>
      this.dateOfPurchased = dateOfPurchased;

  get getStaff => this.staff;

  set setStaff(staff) => this.staff = staff;

  DataOrderModel.empty();

  DataOrderModel.tableFull(String productNumber, double price, String size,
      int quantity, double payment, String dateOfPurcahased, String stuff) {
    this.productName = productName;
    this.price = price;
    this.size = size;
    this.quantity = quantity;
    this.payment = payment;
    this.dateOfPurchased = dateOfPurcahased;
    this.staff = staff;
  }

  DataOrderModel.fullJson(
      {this.productName,
      this.price,
      this.size,
      this.quantity,
      this.payment,
      this.dateOfPurchased,
      this.staff});

  factory DataOrderModel.salesFromJson(Map<String, dynamic> json) {
    return DataOrderModel.fullJson(
      productName: json['productName'] as String,
      price: json['price'] as double,
      size: json['size'] as String,
      quantity: json['quantity'] as int,
      payment: json['payment'] as double,
      dateOfPurchased: json['date'] as String,
      staff: json['staff'] as String,
    );
  }
}
