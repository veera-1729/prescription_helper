import 'dart:convert';

import 'package:http/http.dart' as http;
import "../models/register_model.dart";

Future<UserModel> createUser(String username, String phoneno, String firebase_token,
    bool isAdmin) async {
  print(username);
  print(phoneno);
  print(isAdmin);
  print(firebase_token);
  var body = jsonEncode(<String, String>{
    "username": username,
    "phone_no": phoneno,
    "firebase_token": firebase_token,
    "isAdmin": isAdmin.toString()
  });
  print(body);
  final response =
      await http.post(Uri.parse('http://192.168.43.60:8800/api/users/register'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: body);
  if (response.statusCode == 201) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    print(response.body);
    return userFromJson(response.body);
  } else if (response.statusCode == 200) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    print("$response");
    return userFromJson(response.body);
    ;
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    print("Error occurred");
    throw Exception('Failed to create album.');
  }
}
