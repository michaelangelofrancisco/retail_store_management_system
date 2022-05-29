class takeOrderModel {
  String? productName;
  double? productPrice;
  String? productSize;
  int? productQuantity;
  String? dateToday;
  String? status;
  String? staff;
  int? orderNumber;
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

  get getStaff => this.staff;

  set setStaff(staff) => this.staff = staff;

  get getOrderNumber => this.orderNumber = orderNumber;

  set setOrderNumber(orderNumber) => this.orderNumber = orderNumber;

  takeOrderModel.empty();

  takeOrderModel.takeOrder(
      String productName,
      double productPrice,
      String productSize,
      int productQuantity,
      String dateToday,
      String status,
      String staff,
      int orderNumber) {
    this.productName = productName;
    this.productPrice = productPrice;
    this.productSize = productSize;
    this.productQuantity = productQuantity;
    this.dateToday = dateToday;
    this.status = status;
    this.staff = staff;
    this.orderNumber = orderNumber;
  }
}
