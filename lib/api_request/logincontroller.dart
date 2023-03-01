import 'dart:convert';

import 'package:http/http.dart' as http;

Future<String> createUser(String username,String phoneno,String firebase_token) async {
  final response = await http.post(
    Uri.parse('http://localhost:8800/api/users/register'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      "username": username,
      "phone_no":phoneno,
      "firebase_token":firebase_token,
    }),
  );
  if (response.statusCode == 201) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    return "login successfull";
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Failed to create album.');
  }
}
