import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:prescription_helper/models/admin_model.dart';
import 'package:prescription_helper/models/patientsList_model.dart';
import 'package:prescription_helper/screens/addMedicines.dart';
// import 'package:prescription_helper/screens/patientsList.dart';
import '../models/admin_model_register.dart';
import "../models/register_model.dart";
import '../screens/imageUploader.dart';
import "../models/patientsList_model.dart";

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
    Uri.parse('http://192.168.43.60:8800/api/admin/register'),
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
    throw Exception('Failed to register admin.');
  }
}

Future<AdminModel> postAdminDetails(String hospitalName, String location,
    String gender, String age, String adminId) async {
  print(hospitalName);
  print(location);
  print(age);
  print(adminId);
  print(gender);
  var body = jsonEncode({
    "hospital_name": hospitalName,
    "location": location,
    "gender": gender,
    "age": age,
    "admin_id": adminId
  });
  print(body);
  final response = await http.post(
    Uri.parse('http://192.168.43.60:8800/api/admin/addDetails/${adminId}'),
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
    Get.snackbar("Failed", "Failed to add details.");
    throw Exception('Failed to add details.');
  }
}

Future<bool> isAdminExists(String adminId) async {
  print(adminId);
  final response = await http.get(
    Uri.parse('http://192.168.43.60:8800/api/admin/isAdminExists/${adminId}'),
  );
  if (response.statusCode == 200) {
    print(response.body);
    return true;
  } else {
    throw Exception('Failed to get data about admin.');
  }
}

Future<PatientDetails?> addPatient(
    String patientphoneno, String adminuserId) async {
  print(adminuserId);
  print(patientphoneno);
  final response = await http.get(
    Uri.parse(
        'http://192.168.43.60:8800/api/admin/add_patient/${patientphoneno}/${adminuserId}'),
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
    // Get.snackbar("Error", "${response.body}",
    //     snackPosition: SnackPosition.BOTTOM,
    //     backgroundColor: Colors.black,
    //     colorText: Colors.white);
    // throw Exception('Failed to add patient.');
    return null;
  }
}

//write a function named getpatientsList that returns list of patientsList model
Future<List<patientsList>?> getPatientsList(String adminuserId) async {
  print(adminuserId);
  final response = await http.get(
    Uri.parse(
        'http://192.168.43.60:8800/api/admin/patientslist/${adminuserId}'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );
  if (response.statusCode == 200) {
    print(response.body);
    return patientListFromJson(response.body);
  } else {
    throw Exception('Failed to get data about patients list.');
  }
}

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
