class OrderModel {
  String? productName;
  double? productPrice;
  String? productSize;
  int? productQuantity;
  String? dateToday;

  get getProductName => productName;

  set setProductName(String productName) => this.productName = productName;

  get getProductPrice => productPrice;

  set setProductPrice(productPrice) => this.productPrice = productPrice;

  get getProductSize => productSize;

  set setProductSize(productSize) => this.productSize = productSize;

  get getProductQuantity => productQuantity;

  set setProductQuantity(productQuantity) =>
      this.productQuantity = productQuantity;

  get getDateToday => dateToday;

  set setDateToday(dateToday) => this.dateToday = dateToday;

  OrderModel.empty();

  OrderModel.newPurchase(String productName, double productPrice,
      String productSize, int productQuantity, String dateToday) {
    this.productName = productName;
    this.productPrice = productPrice;
    this.productSize = productSize;
    this.productQuantity = productQuantity;
    this.dateToday = dateToday;
  }
}
