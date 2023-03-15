// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:prescription_helper/screens/admindetails.dart';
import 'package:prescription_helper/screens/loginWithPhone.dart';

class CheckAdminPage extends StatefulWidget {
  const CheckAdminPage({super.key});

  @override
  State<CheckAdminPage> createState() => _CheckAdminPageState();
}

bool ispatient = false;

class _CheckAdminPageState extends State<CheckAdminPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromRGBO(217, 225, 232, 1),
        body: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 70.h),
              child: Image.asset(
                "assets/logo.png",
                width: 33.w,
                height: 32.h,
              ),
            ),
            SizedBox(
              height: 37.h,
            ),
            Text(
              "Let's get acquainted",
              style: TextStyle(
                fontSize: 30.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: 110.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal:10.w),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(360.w, 120.w),
                    side: BorderSide(
                        width: 2.w, color: ispatient ? Colors.amber : Colors.white),
                    backgroundColor: Colors.white,
                    elevation: ispatient ? 10 : 4,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.r)))),
                onPressed: () {
                  setState(() {
                    ispatient = true;
                  });
                },
                child: Row(
                  children: <Widget>[
                    SizedBox(
                      width: 63.w,
                      height: 63.h,
                      child: Image.asset("assets/Icon patient.png"),
                    ),
                    SizedBox(width: 10.w),
                    Text(
                      'I am a patient',
                      style: TextStyle(
                        fontSize: 20.sp,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Padding(
              padding:EdgeInsets.symmetric(horizontal: 10.h),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(360.w, 120.h),
                    side: BorderSide(
                        width: 2.w,
                        color:
                            ispatient == false ? Colors.amber : Colors.white),
                    backgroundColor: Colors.white,
                    elevation: ispatient == false ? 10 : 4,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.r)))),
                onPressed: () {
                  setState(() {
                    ispatient = false;
                  });
                },
                child: Row(
                  children: <Widget>[
                    SizedBox(
                      width: 63.w,
                      height: 63.h,
                      child: Image.asset("assets/icon doctor.png"),
                    ),
                    SizedBox(width: 10.w),
                    Text(
                      'I am a Doctor',
                      style: TextStyle(
                        fontSize: 20.sp,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 145.h,
            ),
            Elevatedbutton(),
          ],
        ),
      ),
    );
  }
}

class Elevatedbutton extends StatelessWidget {
  const Elevatedbutton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          ispatient ? Get.to(() => LoginWithPhone()) : Get.to(()=>Admindetails());
        },
        style: ElevatedButton.styleFrom(
          maximumSize: Size(200.w, 50.h),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.r)))),
        child: Center(
            child: Text(
          "continue",
          style: TextStyle(
              color: Colors.white,
              fontSize: 24.sp,
              fontWeight: FontWeight.w400),
        )));
  }
}
