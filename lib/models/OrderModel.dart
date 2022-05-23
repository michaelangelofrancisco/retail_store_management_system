class OrderModel {
  String? productName;
  double? productPrice;
  String? productSize;
  int? productQuantity;
  String? dateToday;
  String? status;
  String? staff;

  get getProductName => this.productName;

  set setProductName(productName) => this.productName = productName;

  get getProductPrice => this.productPrice;

  set setProductPrice(productPrice) => this.productPrice = productPrice;

  get getProductSize => this.productSize;

  set setProductSize(productSize) => this.productSize = productSize;

  get getProductQuantity => this.productQuantity;

  set setProductQuantity(productQuantity) =>
      this.productQuantity = productQuantity;

  get getDateToday => this.dateToday;

  set setDateToday(dateToday) => this.dateToday = dateToday;

  get getStatus => this.status;

  set setStatus(status) => this.status = status;

  get getstaff => this.staff;

  set setstaff(staff) => this.staff = staff;

  OrderModel.empty();

  OrderModel.newPurchase(
      String productName,
      double productPrice,
      String productSize,
      int productQuantity,
      String dateToday,
      String status,
      String staff) {
    this.productName = productName;
    this.productPrice = productPrice;
    this.productSize = productSize;
    this.productQuantity = productQuantity;
    this.dateToday = dateToday;
    this.status = status;
    this.staff = staff;
  }
}
