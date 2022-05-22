import 'package:flutter/material.dart';
import 'package:retail_store_management_system/operations/item.dart';

class Product {
  String name;
  String driveTime;
  String address;
  String label;
  String logoUrl;
  String desc;
  num score;
  Map<String, List<Item>> menu;
  Product(
    this.name,
    this.driveTime,
    this.address,
    this.label,
    this.logoUrl,
    this.desc,
    this.score,
    this.menu,
  );

  static Product generateStore() {
    return Product(
      'Wake n Vape',
      '5mns Drive From SM Naga',
      'Fordham st. Naga City 4400',
      'We sell vape and stuffs',
      '',
      'Coke',
      4.7,
      {
        'Recommend': Item.generateRecommendFoods(),
        'Popular': Item.generatePopularFoods(),
        'Vapes': [],
        'Juice': [],
      },
    );
  }
}
