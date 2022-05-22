import 'package:flutter/material.dart';
import 'package:retail_store_management_system/operations/Product.dart';

class ProductList extends StatelessWidget {
  final int selected;
  final Function callback;
  final Product product;

  ProductList(this.selected, this.callback, this.product);

  @override
  Widget build(BuildContext context) {
    final category =
        product.menu.keys.toList(); //Getting the product generate Store

    return Container(
        height: 100,
        padding: EdgeInsets.symmetric(vertical: 30),
        child: ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: 25),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => GestureDetector(
                  onTap: () => callback(index),
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: selected == index ? Colors.yellow : Colors.white,
                    ),
                    child: Text(
                      category[index],
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
            separatorBuilder: (_, index) => SizedBox(
                  width: 20,
                ),
            itemCount: category.length));
  }
}
