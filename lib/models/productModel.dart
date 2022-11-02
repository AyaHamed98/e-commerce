import 'dart:ui';

import 'package:flutter_e_commerce/helper/extantion/extantionclass.dart';

class ProductModel{
  Color color;
  String name,
      image,
      description,
      sized,
      brand,
      categoryName,
        uid;

    double price;
    int count;
  ProductModel({required this.uid,required this.name, required this.image, required this.description, required this.sized, required this.color,
    required this.brand, required this.categoryName, required this.price, required this.count});

  factory ProductModel.fromJson(json) {
    return ProductModel(
      color: HexColor.fromHex(json["color"]),
      name: json["name"],
      image: json["image"],
      description: json["description"],
      sized: json["sized"],
      brand: json["brand"],
      categoryName: json["categoryName"],
      uid: json["uid"],
      price: json["price"],
      count: json["count"],
    );
  }
//

//

//

}
//

//

