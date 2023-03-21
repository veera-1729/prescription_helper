// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

List<patientsList> patientListFromJson(String str) => List<patientsList>.from(json.decode(str).map((x) => patientsList.fromJson(x)));

String patientListToJson(List<patientsList> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class patientsList {
    patientsList({
        required this.id,
        required this.username,
        required this.phoneNo,
        // required this.age,
        required this.isAdmin,
    });

    String id;
    String username;
    String phoneNo;
    // String age;
    String isAdmin;

    factory patientsList.fromJson(Map<String, dynamic> json) => patientsList(
        id: json["_id"],
        username: json["username"],
        phoneNo: json["phone_no"],
        // age: json["age"],
        isAdmin: json["isAdmin"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "username": username,
        "phone_no": phoneNo,
        // "age": age,
        "isAdmin": isAdmin,
    };
}
