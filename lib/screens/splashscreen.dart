// ignore_for_file: prefer_const_constructors, unnecessary_import, unused_import, implementation_imports

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:prescription_helper/homenav.dart';
import 'package:prescription_helper/screens/loginWithPhone.dart';
import 'package:prescription_helper/screens/startingscreen.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    final getStorage = GetStorage();
    super.initState();
    Timer(Duration(seconds: 2), () {
      if (getStorage.read("userId") != null) {
        Get.to(() => HomeNavigation(index: 0));
      } else {
        Get.to(GetStartedScreen());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Color.fromRGBO(217, 225, 232, 1),
          body: Column(children: [
            Padding(
              padding: EdgeInsets.only(top: 350.h),
              child: Text(
                "Self Care",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 28.sp,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Image.asset(
                      "assets/leftlogo.png",
                      width: 60.w,
                      height: 60.h,
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: 80.h),
                  child: Row(
                    children: [
                      Image.asset(
                        "assets/rightlogo.png",
                        width: 60.w,
                        height: 60.h,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ])),
    );
  }
}
