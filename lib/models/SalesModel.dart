class SalesModel {
  int? orderID;
  String? dateOfPurchased;
  String? staff;

  get getStaff => staff;

  set setStaff(String? staff) => this.staff = staff;

  get getOrderID => orderID;

  set setOrderID(int orderID) => this.orderID = orderID;

  get getDateOfPurchased => dateOfPurchased;

  set setDateOfPurchased(dateOfPurchased) =>
      this.dateOfPurchased = dateOfPurchased;

  SalesModel.empty();

  SalesModel.tableFull(int orderID, String dateOfPurcahased, String stuff) {
    this.orderID = orderID;
    this.dateOfPurchased = dateOfPurcahased;
    this.staff = staff;
  }

  SalesModel.fullJson({this.orderID, this.dateOfPurchased, this.staff});

  factory SalesModel.salesFromJson(Map<String, dynamic> json) {
    return SalesModel.fullJson(
      orderID: json['OrderNumber'] as int,
      dateOfPurchased: json['date'] as String,
      staff: json['staff'] as String,
    );
  }
}
