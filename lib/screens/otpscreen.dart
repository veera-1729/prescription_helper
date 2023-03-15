// ignore_for_file: prefer_const_constructors, implementation_imports, unused_import, unnecessary_import

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:prescription_helper/screens/adminHome.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromRGBO(217, 225, 232, 1),
        body: Padding(
          padding: EdgeInsets.only(top: 100.h, left: 20.w),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/logo.png",
                    width: 33.w,
                    height: 32.h,
                  ),
                ],
              ),
              SizedBox(
                height: 50.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Your Code",
                    style:
                        TextStyle(fontSize: 30.sp, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              SizedBox(
                height: 5.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Code sent to your phone number",
                    style: TextStyle(color: Colors.grey[600], fontSize: 16.sp),
                  ),
                ],
              ),
              SizedBox(
                height: 50.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: Container(
                  // padding: EdgeInsets.symmetric(horizontal: 20.w),
                  height: 55.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.r),
                    color: Color.fromRGBO(239, 242, 241, 1),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      label: Text("Otp code"),
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: 30.w, vertical: 20.h),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                    ),
                    keyboardType: TextInputType.phone,
                  ),
                ),
              ),
              SizedBox(height: 10.h,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("didn't receive code? ",
                  style: TextStyle(
                    fontSize:14.sp,
                    color: Colors.grey[500]),),
                  Text("Resend",
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: Colors.blue),),
                ],
              ),
              SizedBox(height:100.h),
              ElevatedButton(
              onPressed: () {
                Get.to(
                  ()=>AdminHome(),
                );
              },
              child: Text(
                'Verify',
                style: TextStyle(fontSize: 18.sp),
              ),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.r),
                ),
                minimumSize: Size(180.w, 45.h),
              ),
            ),
            ],
          ),
        ),
      ),
    );
  }
}
