import 'package:flutter_e_commerce/models/cart_product_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper{
  static final DatabaseHelper _instance=DatabaseHelper.internal();
  DatabaseHelper.internal();
  factory DatabaseHelper()=>_instance;
  Database? _db;

  createDatabase()async{
    if(_db!=null){
      return _db;
    }
    String path=join(await getDatabasesPath(),"cart.db");
    _db=await openDatabase(
        path,
        version: 1,
        onCreate: (db,version){
          db.execute("""
          CREATE TABLE products (id INTEGER PRIMARY KEY, name TEXT, image TEXT, price integer, count integer,uid TXET)
          """);
        });
    return _db;
  }


  Future<int>createProduct(CartProductModel model)async{
    Database db=await createDatabase();
    return db.insert("products", model.toJson());
  }


  Future<List<Map<String,dynamic>>>getAllProduct()async{
    Database db=await createDatabase();
    return db.query("products");
  }


  Future<void>cleanTable()async{
    Database db=await createDatabase();
    db.delete("products");

  }


  Future<int>delete(int id)async{
    Database db=await createDatabase();
    return db.delete("products",where: "id=?",whereArgs: [id]);

  }



  Future<int>update(CartProductModel model)async{
    Database db=await createDatabase();
    return _db!.update("products", model.toJson(),where: "id=?",whereArgs: [model.id]);
  }
}