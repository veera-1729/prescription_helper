import 'dart:convert';

import 'package:http/http.dart' as http;

Future<String> createUser(String username,String phoneno,String firebase_token,bool isAdmin) async {
  print(username);
  print(phoneno);
  print(isAdmin);
  print(firebase_token);
  var body=jsonEncode(<String, String>{
      "username": username,
      "phone_no":phoneno,
      "firebase_token":firebase_token,
      "isAdmin":isAdmin.toString()
    });
    print(body);
  final response = await http.post(
    Uri.parse('http://192.168.0.109:8800/api/users/register'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: body
  );
  if (response.statusCode == 201) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    print("$response");
    return "login successfull";
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    print("Error occurred");
    throw Exception('Failed to create album.');
  }
}
