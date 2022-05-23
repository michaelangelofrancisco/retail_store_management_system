import 'package:flutter/material.dart';
import 'package:retail_store_management_system/models/OrderModel.dart';
import 'package:retail_store_management_system/operations/OrderOperation.dart';
import 'package:retail_store_management_system/operations/item.dart';

class ProductDetails extends StatefulWidget {
  final Item item;
  ProductDetails({required this.item});

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  var order = OrderOperation();
  late Future<List<OrderModel>> newPurchase;

  //The one that is being display in a POS Dashboard
  int temp = 0;
  int orderNumber = 1;

  @override
  void initState() {
    //step 1
    order.getOrderNumber().then((value) {
      setState(() {
        value++;
      });
      orderNumber = value;
    });
    //step 2
    newPurchase = order.getPurchaseList(OrderModel.empty());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(25),
      color: Colors.white,
      child: Column(
        children: [
          Text(
            widget.item.productName.toString(),
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _BuildIconText(
                  Icons.exposure, Colors.blue, widget.item.qty.toString()),
              _BuildIconText(
                  Icons.scale, Colors.red, widget.item.size.toString()),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            color: Colors.white,
            width: 300,
            height: 40,
            child: Stack(
              children: [
                Align(
                  alignment: Alignment(-0.9, 0),
                  child: Container(
                    width: 150,
                    height: double.maxFinite,
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Row(children: [
                      SizedBox(width: 20),
                      Text(
                        '\P',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        widget.item.price.toString(),
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      )
                    ]),
                  ),
                ),
                Align(
                  alignment: Alignment(0.3, 0),
                  child: Container(
                    height: double.maxFinite,
                    width: 170,
                    decoration: BoxDecoration(
                      color: Colors.yellow,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextButton(
                          child: const Text(
                            '-',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontFamily: 'Cairo_Bold',
                            ),
                          ),
                          onPressed: () {
                            setState(() {
                              temp--;
                              print(temp.toString());
                            });
                          },
                        ),
                        Container(
                          padding: EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                          child: Text(
                            temp.toString(),
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        TextButton(
                          child: const Text(
                            '+',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontFamily: 'Cairo_Bold',
                            ),
                          ),
                          onPressed: () {
                            setState(() {
                              temp++;
                              print(temp.toString());
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            children: [
              Text(
                'Description',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              )
            ],
          ),
          SizedBox(
            height: 30,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            widget.item.description.toString(),
            style: TextStyle(
              wordSpacing: 1.2,
              height: 1.5,
              fontSize: 16,
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Align(
            alignment: Alignment.topRight,
            child: TextButton.icon(
              //Today collection graph
              icon: Icon(
                Icons.shopping_bag_outlined,
                size: 24,
                color: Colors.black,
              ),
              label: Text(
                //vars here to be setState
                'Add to cart',
                softWrap: true,
                style: TextStyle(
                  fontSize: 10,
                  color: Colors.black,
                  fontFamily: 'Cairo_Bold',
                ),
              ),
              onPressed: () {
                newPurchase = order.getPurchaseList(
                  OrderModel.newPurchase(
                    widget.item.productName,
                    widget.item.price,
                    widget.item.size,
                    temp,
                    'May 2',
                    'WALKIN',
                    'Michael Angelo',
                  ),
                );

                setState(() {
                  newPurchase = newPurchase;
                });
                Navigator.pop(context);
              }, //pwdeng refresh button
            ),
          ),
        ],
      ),
    );
  }

  Widget _BuildIconText(IconData icon, Color color, String text) {
    return Row(
      children: [
        Icon(
          icon,
          color: color,
          size: 20,
        ),
        Text(
          text,
          style: TextStyle(
            fontSize: 16,
          ),
        )
      ],
    );
  }
}
