import 'package:cloud_firestore/cloud_firestore.dart';

class HomeHelper{
  CollectionReference _categoryRef=FirebaseFirestore.instance.collection("category");
  CollectionReference _productRef=FirebaseFirestore.instance.collection("products");
  Future<List<DocumentSnapshot>>getCategory()async{
    var value=await _categoryRef.get();
    return value.docs;
  }


  Future<List<DocumentSnapshot>>getProducts()async{
    var value=await _productRef.get();
    return value.docs;
  }
  Future<List<DocumentSnapshot>>filteringProducts(String name)async{
    var value=await _productRef.where("categoryName",isEqualTo: name).get();
    return value.docs;
  }

}