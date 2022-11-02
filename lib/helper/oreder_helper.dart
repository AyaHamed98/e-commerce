import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_e_commerce/models/order_model.dart';
import 'package:flutter_e_commerce/view/checkOut/delivery_view.dart';

class OrderHelper {
  CollectionReference _reference = FirebaseFirestore.instance.collection("order");

  Future<void>setOrder(OrderModel model) async {
    return await _reference.doc().set(model.toJson());
  }

 Future<List<DocumentSnapshot>>getOrder()async{
    var value=await _reference.get();
    return value.docs;
  }
}