import 'package:flutter/material.dart';
import 'package:retail_store_management_system/interfaces/CustomAppBar.dart';
import 'package:retail_store_management_system/interfaces/widget/ProductDetails.dart';
import 'package:retail_store_management_system/interfaces/widget/ProductImg.dart';
import 'package:retail_store_management_system/operations/item.dart';

import 'package:flutter/material.dart';
import 'package:retail_store_management_system/interfaces/CustomAppBar.dart';
import 'package:retail_store_management_system/interfaces/widget/ProductDetails.dart';
import 'package:retail_store_management_system/interfaces/widget/ProductImg.dart';
import 'package:retail_store_management_system/operations/item.dart';

class DetailPage extends StatelessWidget {
  final Item item;
  DetailPage(this.item);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow,
      actionsPadding: EdgeInsets.only(bottom: 5, left: 5, right: 5),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      actions: <Widget>[
        Column(
          children: [
            CustomAppBar(
              Icons.arrow_back_ios_outlined,
              Icons.favorite_outline,
              leftCallback: () => Navigator.of(context).pop(),
            ),
            ProductImg(item),
            ProductDetails(item: item),
          ],
        ),
      ],
    );
  }
}
