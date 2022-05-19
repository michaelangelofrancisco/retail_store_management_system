class OrderHistoryModel {
  //Getting the Data details of costumer from database to Sale History every order number

  int? orderNumber;
  String? firstname;
  String? lastname;
  String? address;
  int? number;
  double? payment;
  double? price;
  int? get getOrderNumber => this.orderNumber;

  set setOrderNumber(int? orderNumber) => this.orderNumber = orderNumber;

  get getFirstname => this.firstname;

  set setFirstname(firstname) => this.firstname = firstname;

  get getLastname => this.lastname;

  set setLastname(lastname) => this.lastname = lastname;

  get getAddress => this.address;

  set setAddress(address) => this.address = address;

  get getNumber => this.number;

  set setNumber(number) => this.number = number;

  get getPayment => this.payment;

  set setPayment(payment) => this.payment = payment;

  get getPrice => this.price;

  set setPrice(price) => this.price = price;

  OrderHistoryModel.empty();

  OrderHistoryModel.inventory(int id, String firstname, String lastname,
      String address, int number, double payment, double price) {
    this.orderNumber = id;
    this.firstname = firstname;
    this.lastname = lastname;
    this.address = address;
    this.number = number;
    this.payment = payment;
    this.price = price;
  }

  OrderHistoryModel.fullJson({
    this.orderNumber,
    this.firstname,
    this.lastname,
    this.address,
    this.number,
    this.payment,
    this.price,
  });

  factory OrderHistoryModel.inventoryFromJson(Map<String, dynamic> json) {
    return OrderHistoryModel.fullJson(
      orderNumber: json["OrderNumber"] as int,
      firstname: json['firstname'] as String,
      lastname: json['lastname'] as String,
      address: json['address'] as String,
      number: json['number'] as int,
      payment: json['payment'] as double,
      price: json['price'] as double,
    );
  }
}
