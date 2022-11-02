import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_e_commerce/models/user_model.dart';

class FireStoreUser{
  CollectionReference _firebaseUserRef=FirebaseFirestore.instance.collection("UsersData");
   addUserForFireStore(UserModel userModel)async{
    return await _firebaseUserRef.doc(userModel.id).set(userModel.toJson());
  }
  Future<DocumentSnapshot>getUserFromFirebase()async{
   var value=_firebaseUserRef.doc(FirebaseAuth.instance.currentUser!.uid.toString()).get();
   return value;
  }
}