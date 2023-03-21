// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:prescription_helper/screens/otpscreen.dart';
import 'package:prescription_helper/screens/verificationScreen.dart';

class SignInPage extends StatefulWidget {
  SignInPage({
    Key? key,
    // required this.gender,
    // required this.hospitalAddress,
    // required this.hospitalName,
  }) : super(key: key);
  // bool gender;
  // String hospitalName;
  // String hospitalAddress;
  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool isAdmin = false;
  TextEditingController usernameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(217, 225, 232, 1),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 100.h, left: 20.w, right: 20.w),
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
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
                    height: 20.h,
                  ),
                  Center(
                    child: Text(
                      'Sign In',
                      style: TextStyle(
                        fontSize: 30.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 50.h),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Name',
                        style: TextStyle(
                          color: Colors.grey[700],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Container(
                        height: 44.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.r),
                          color: Color.fromRGBO(239, 242, 241, 1),
                        ),
                        child: TextField(
                          controller: usernameController,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.person),
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 20.w, vertical: 5.h),
                            hintText: "Username",
                            hintStyle: TextStyle(color: Colors.grey),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.r),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Phone No',
                        style: TextStyle(
                          color: Colors.grey[700],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Container(
                        height: 44.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.r),
                          color: Color.fromRGBO(239, 242, 241, 1),
                        ),
                        child: TextField(
                          controller: phoneNumberController,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.phone),
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 20.w, vertical: 5.h),
                            hintText: "Mobile No",
                            hintStyle: TextStyle(color: Colors.grey),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.r),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 50.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Checkbox(
                        value: isAdmin,
                        onChanged: (value) {
                          setState(() {
                            isAdmin = value!;
                            //userData.write("isAdmin", isAdmin);
                            print(isAdmin);
                          });
                        },
                      ),
                      Text(
                        "Login as Admin",
                        style: TextStyle(fontWeight: FontWeight.w900),
                      )
                    ],
                  ),
                  SizedBox(height: 20.h),
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  print(phoneNumberController.text);
                  print(usernameController.text);
                  print(isAdmin);
                  Get.to(
                    () => VerificationScreen(
                      countrycode: "+91",
                      mobile: phoneNumberController.text,
                      username: usernameController.text,
                      isAdmin: isAdmin,
                    ),
                  );
                },
                child: Text(
                  'Send OTP',
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
