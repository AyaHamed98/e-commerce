class CartProductModel{
  int? id;
  String name,image;
  double price;
    int  count;

   String uid;
  CartProductModel({this.id, required this.name, required this.image, required this.price, required this.count,required this.uid});

  factory CartProductModel.fromJson(json) {
    return CartProductModel(
      id: json["id"],
      name: json["name"],
      image: json["image"],
      price: json["price"],
      count:json["count"],
      uid: json["uid"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": this.id,
      "name": this.name,
      "image": this.image,
      "price": this.price,
      "count": this.count,
      "uid": this.uid,
    };
  }
//

//

//

//

}