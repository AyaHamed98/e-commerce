import 'dart:convert';

import 'package:flutter_e_commerce/models/cart_product_model.dart';

class OrderModel {
  String deliveryType;
  String adrees;
  bool isDeleverd;
  List<CartProductModel> products;
  String userId;

  OrderModel(
      {
        required this.deliveryType,
      required this.adrees,
      required this.isDeleverd,
      required this.products,
      required this.userId
      });

  factory OrderModel.fromJson(json) {
    return OrderModel(
      deliveryType: json["deliveryType"],
      adrees: json["adrees"],
      isDeleverd: json["isDeleverd"],
      products: List<CartProductModel>.of(json["products"])
          .map((i) => i /* can't generate it properly yet */)
          .toList(),
      userId: json["userId"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "deliveryType": this.deliveryType,
      "adrees": this.adrees,
      "isDeleverd": this.isDeleverd,
      "products": jsonEncode(this.products),
      "userId": this.userId,
    };
  }

//

}
