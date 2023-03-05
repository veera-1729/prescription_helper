import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:prescription_helper/screens/Home.dart';
import 'package:prescription_helper/screens/adminHome.dart';

Future<String> addMedicine(
    String imageUrl, String time, String qty, String userId) async {
  print(imageUrl);
  print(time);
  print(qty);
  print(userId);
  var body = jsonEncode(<String, String>{
    "imageUrl": imageUrl,
    "time": time,
    "qty": qty,
    "userId": userId
  });

  print('http://192.168.1.93:8800/api/medicines/addMedicine');
  final response = await http.post(
    Uri.parse('http://192.168.1.93:8800/api/medicines/addMedicine'),
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
    return "medicine data uploaded";
  } else if (response.statusCode == 200) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    print("$response");
    print("200");
    return "medicine data uploaded";
    ;
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    print("Error occurred");
    print(response.body);
    throw Exception('Failed to create album.');
  }
}
