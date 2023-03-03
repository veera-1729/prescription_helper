// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

UserModel userFromJson(String str) => UserModel.fromJson(json.decode(str));

String userToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
    UserModel({
        required this.id,
        required this.username,
        required this.phoneNo,
        required this.isAdmin,
    });

    String id;
    String username;
    String phoneNo;
    String isAdmin;

    factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["_id"],
        username: json["username"],
        phoneNo: json["phone_no"],
        isAdmin: json["isAdmin"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "username": username,
        "phone_no": phoneNo,
        "isAdmin": isAdmin,
    };
}
