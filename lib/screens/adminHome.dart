import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';
import 'package:prescription_helper/screens/Navigation.dart';
import 'package:prescription_helper/screens/imageUploader.dart';

class AdminHome extends StatefulWidget {
  const AdminHome({super.key});

  @override
  State<AdminHome> createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  final userdata = GetStorage();
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
                Get.to(ImageUploader());
              },
              child: Text("Add Patient"),
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
