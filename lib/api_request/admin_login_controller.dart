import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:prescription_helper/models/admin_model.dart';
import 'package:prescription_helper/screens/addMedicines.dart';
import "../models/register_model.dart";
import '../screens/imageUploader.dart';

Future<AdminModel> createAdmin(
    String username, String phoneno, String firebase_token) async {
  print(username);
  print(phoneno);
  print(firebase_token);
  var body = jsonEncode({
    "username": username,
    "phone_no": phoneno,
    "firebase_token": firebase_token
  });
  print(body);
  final response = await http.post(
    Uri.parse('http://192.168.10.38:8800/api/admin/register'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: body,
  );

  if (response.statusCode == 201) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    print("server reponse");
    print(response.body);
    return adminModelFromJson(response.body);
  } else if (response.statusCode == 200) {
    print("$response");
    return adminModelFromJson(response.body);
    ;
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    print("Error occurred");
    print(response.body);
    throw Exception('Failed to create album.');
  }
}

Future<PatientDetails> addPatient(
    String patientphoneno, String adminuserId) async {
  print(adminuserId);
  print(patientphoneno);
  final response = await http.get(
    Uri.parse(
        'http://192.168.10.38:8800/api/admin/add_patient/${patientphoneno}/${adminuserId}'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );

  if (response.statusCode == 200) {
    print(response.body);

   // Get.to(ImageUploader(patientDetails: patientFromJson(response.body)));
   // Get.to(AddMedicines(patientDetails: patientFromJson(response.body)));

    return patientFromJson(response.body);
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    print("Error occurred");
    Get.snackbar("Error", "${response.body}",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.black,
        colorText: Colors.white);
    throw Exception('Failed to add patient.');
  }
}

// To parse this JSON data, do
//
//     final patient = patientFromJson(jsonString);

// To parse this JSON data, do
//
//     final patient = patientFromJson(jsonString);

PatientDetails patientFromJson(String str) =>
    PatientDetails.fromJson(json.decode(str));

String patientToJson(PatientDetails data) => json.encode(data.toJson());

class PatientDetails {
  PatientDetails({
    required this.id,
    required this.username,
    required this.phoneNo,
    required this.medicineTimings,
    required this.isAdmin,
  });

  String id;
  String username;
  String phoneNo;
  List<List<String>> medicineTimings;
  String isAdmin;

  factory PatientDetails.fromJson(Map<String, dynamic> json) => PatientDetails(
        id: json["_id"],
        username: json["username"],
        phoneNo: json["phone_no"],
        medicineTimings: List<List<String>>.from(json["medicine_timings"]
            .map((x) => List<String>.from(x.map((x) => x)))),
        isAdmin: json["isAdmin"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "username": username,
        "phone_no": phoneNo,
        "medicine_timings": List<dynamic>.from(
            medicineTimings.map((x) => List<dynamic>.from(x.map((x) => x)))),
        "isAdmin": isAdmin,
      };
}
