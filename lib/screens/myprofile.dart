// ignore_for_file: unnecessary_import, implementation_imports, unused_import, prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:prescription_helper/homenav.dart';
import 'package:prescription_helper/screens/loginWithPhone.dart';

class Myprofile extends StatelessWidget {
  Myprofile({super.key});
  final getStorage = GetStorage();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text("My profile")),
        body: ListView(
          children: [
            SizedBox(
              height: 5,
            ),
            Center(
              child: ElevatedButton(
                  onPressed: () {
                    getStorage.erase();
                    Get.to(LoginWithPhone());
                  },
                  child: Text("Sign out")),
            )
          ],
        ),
      ),
    );
  }
}
