class SalesModel {
  int? orderID;
  String? staff;
  get getOrderID => this.orderID;

  set setOrderID(orderID) => this.orderID = orderID;

  get getStaff => this.staff;

  set setStaff(staff) => this.staff = staff;

  SalesModel.empty();

  SalesModel.tableFull(int orderID, String stuff) {
    this.orderID = orderID;
    this.staff = staff;
  }

  SalesModel.fullJson({this.orderID, this.staff});

  factory SalesModel.salesFromJson(Map<String, dynamic> json) {
    return SalesModel.fullJson(
      orderID: json['orderNumber'] as int,
      staff: json['staff'] as String,
    );
  }
}
