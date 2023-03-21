// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:prescription_helper/screens/checkuser.dart';
import 'package:prescription_helper/screens/signin.dart';

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromRGBO(217, 225, 232, 1),
        body: Column(
          children: [
            Container(
              alignment: Alignment.topCenter,
              child: Image.asset(
                "assets/image.png",
              ),
            ),
            SizedBox(height: 20.h),
            Center(
              child: Text(
                "Manage your health and\n happy future",
                style: TextStyle(
                    color: Color.fromRGBO(28, 31, 30, 1),
                    fontSize: 28.sp,
                    fontWeight: FontWeight.w400),
              ),
            ),
            SizedBox(
              height: 70.h,
            ),
            ElevatedButton(
              onPressed: () {
                Get.to(() => SignInPage());
              },
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blue,
                ),
                width: 240.w,
                height: 45.h,
                // color: Colors.blue,
                alignment: Alignment.center,
                child: Text("Get started"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
