// To parse this JSON data, do
//
//     final adminModel = adminModelFromJson(jsonString);

import 'dart:convert';

AdminModel adminModelFromJson(String str) => AdminModel.fromJson(json.decode(str));

String adminModelToJson(AdminModel data) => json.encode(data.toJson());

class AdminModel {
    AdminModel({
        required this.id,
        required this.username,
        required this.phoneNo,
        required this.patients,
        required this.hospitalName,
        required this.location
    });

    String id;
    String username;
    String phoneNo;
    List<String> patients;
    String? hospitalName;
    String? location;

    factory AdminModel.fromJson(Map<String, dynamic> json) => AdminModel(
        id: json["_id"],
        username: json["username"],
        phoneNo: json["phone_no"],
        patients: List<String>.from(json["patients"].map((x) => x)),
        hospitalName: json["hospital_name"],
        location: json["location"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "username": username,
        "phone_no": phoneNo,
        "patients": List<dynamic>.from(patients.map((x) => x)),
        "hospital_name": hospitalName,
        "location": location,
    };
}
