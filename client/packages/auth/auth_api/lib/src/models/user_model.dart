class UserModel {
  UserModel({
    this.id,
    this.name,
    this.email,
    this.avatar,
    this.isShop,
  });

  String? id;
  String? name;
  String? email;
  String? avatar;

  String? isShop;
  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
      id: json["_id"],
      name: json["name"],
      email: json["email"],
      avatar: json["avatar"],
      isShop: json["isShop"].toString());

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "email": email,
        "avatar": avatar,
        "isShop": isShop
      };
}
