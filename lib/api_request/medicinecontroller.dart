import 'dart:convert';

import 'package:http/http.dart' as http;

Future<String> addMedicine(String imageUrl, String time, String qty) async {
  print(imageUrl);
  print(time);
  print(qty);

  var body = jsonEncode(
      <String, String>{"imageUrl": imageUrl, "time": time, "qty": qty});
  print(body);
  final response = await http.post(
      Uri.parse(
          'http://192.168.43.60:8800/api/medicines/addMedicine/640091c42167faae006d4877'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: body);
  if (response.statusCode == 201) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    print(response.body);
    return "";
  } else if (response.statusCode == 200) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    print("$response");
    return "";
    ;
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    print("Error occurred $response");
    throw Exception('Failed to create album.');
  }
}
