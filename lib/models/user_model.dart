class UserModel{
  String? id,email,name,pic;

  UserModel({ this.id,  this.email,  this.name, this.pic});

  factory UserModel.fromJson(json) {
    return UserModel(
      id: json["id"],
      email: json["email"],
      name: json["name"],
      pic: json["pic"],
    );
  }

  toJson() {
    return {
      "id": this.id,
      "email": this.email,
      "name": this.name,
      "pic": this.pic,
    };
  }

//

//

}