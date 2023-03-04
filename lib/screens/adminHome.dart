import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';
import 'package:prescription_helper/models/admin_model.dart';
import 'package:prescription_helper/screens/Navigation.dart';
import 'package:prescription_helper/screens/imageUploader.dart';
import "../api_request/admin_login_controller.dart";

class AdminHome extends StatefulWidget {
  const AdminHome({super.key});

  @override
  State<AdminHome> createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  TextEditingController phone_no_controller = TextEditingController();
  final userdata = GetStorage();
  PatientDetails? patientDetails;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Admin Home"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 200,
              child: TextField(
                keyboardType: TextInputType.phone,
                controller: phone_no_controller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter Phone No',
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  userdata.erase();
                });
                Get.to(Navigation());
              },
              child: Text("Sign Out"),
            ),
            ElevatedButton(
              onPressed: () {
                Get.to(ImageUploader(patientDetails: patientDetails));
              },
              child: Text("Add Patient"),
            ),
            ElevatedButton(
              onPressed: () async {
                patientDetails = await addPatient(
                  phone_no_controller.text,
                  userdata.read("userId"),
                );
              },
              child: Text("Validate"),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'add patient',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_accessibility_outlined),
            label: 'profile',
          ),
        ],
      ),
    );
  }
}
