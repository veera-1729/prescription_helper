import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'package:prescription_helper/screens/Home.dart';
import 'package:prescription_helper/screens/adminHome.dart';

class Medicine {
//Medicine({this.name, this.personalId});

  String qty;
  String userId;
  List<dynamic> imageUrls;
  List<dynamic> timings;
  Medicine({
    required this.qty,
    required this.userId,
    required this.imageUrls,
    required this.timings,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{
        'imageurls': imageUrls,
        'timings': timings,
        'qty': qty,
        'userId': userId
      };
}

Future<bool> addMedicine(List<dynamic> imageUrls, List<dynamic> timings,
    String qty, String userId) async {
  print(imageUrls);
  print(timings);
  print(qty);
  print(userId);
  // var body = jsonEncode(<String, dynamic>{
  //   "imageUrl": imageUrl,
  //   "time": time,
  //   "qty": qty,
  //   "userId": userId
  // });
  var body = jsonEncode(
      Medicine(qty: qty, userId: userId, imageUrls: imageUrls, timings: timings)
          .toJson());

  final response = await http.post(
    Uri.parse('http://192.168.43.60:8800/api/medicines/addMedicine'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: body,
  );
  if (response.statusCode == 201) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    print(response.body);
    print("201");

    //Get.to(AdminHome());
    return true;
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    print("Error occurred");
    print(response.body);
    throw Exception('Failed to add Medicne.');
    Get.snackbar("Error", "${response.body}",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.black,
        colorText: Colors.white);
  }
}
