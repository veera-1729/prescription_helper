// To parse this JSON data, do
//
//     final adminModel = adminModelFromJson(jsonString);

import 'dart:convert';

RegisterAdminModel registerAdminModelFromJson(String str) =>
    RegisterAdminModel.fromJson(json.decode(str));

String registerAdminModelToJson(RegisterAdminModel data) => json.encode(data.toJson());

class RegisterAdminModel {
  RegisterAdminModel({
    required this.id,
    required this.username,
    required this.phoneNo,
    required this.patients,
  });

  String id;
  String username;
  String phoneNo;
  List<String> patients;

  factory RegisterAdminModel.fromJson(Map<String, dynamic> json) => RegisterAdminModel(
        id: json["_id"],
        username: json["username"],
        phoneNo: json["phone_no"],
        patients: List<String>.from(json["patients"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "username": username,
        "phone_no": phoneNo,
        "patients": List<dynamic>.from(patients.map((x) => x)),
      };
}
