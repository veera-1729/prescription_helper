// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class CheckAdminPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Color.fromRGBO(217, 225, 232, 1),
      body: Container(
        padding: EdgeInsets.all(100.0),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Hi',
              style: TextStyle(
                fontSize: 36.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 100.0),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
              ),
              onPressed: () {},
              child: Row(
                children: <Widget>[
                  Icon(Icons.person, color: Colors.black),
                  SizedBox(width: 10.0),
                  Text(
                    'I am a patient',
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20,),
             ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
              ),
              
              onPressed: () {},
              child: Row(
                children: <Widget>[
                  Icon(Icons.person, color: Colors.black),
                  SizedBox(width: 10.0),
                  Text(
                    'I am a Doctor',
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
