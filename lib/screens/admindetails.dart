// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:prescription_helper/screens/checkuser.dart';
import 'package:prescription_helper/screens/signin.dart';

class Admindetails extends StatefulWidget {
  const Admindetails({super.key});

  @override
  State<Admindetails> createState() => _AdmindetailsState();
}

TextEditingController hospitalcontroller = TextEditingController();
TextEditingController locationcontroller = TextEditingController();
void dispose() {
  hospitalcontroller.dispose();
  locationcontroller.dispose();
}

bool ismale = true;

class _AdmindetailsState extends State<Admindetails> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromRGBO(217, 225, 232, 1),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 65.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/logo.png",
                      width: 33.w,
                      height: 32.h,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 37.h,
              ),
              Text(
                "A little about Yourself",
                style: TextStyle(
                  fontSize: 30.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: 90.h,
              ),
              Padding(
                padding: EdgeInsets.only(left: 18.w),
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                  Text(
                    "Your gender",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w500),
                  ),
                ]),
              ),
              SizedBox(
                height: 10.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        minimumSize: Size(160.w, 100.h),
                        backgroundColor: Colors.white,
                        elevation: ismale ? 10 : 4,
                        shape: RoundedRectangleBorder(
                            side: BorderSide(
                                width: 2.w,
                                color: ismale ? Colors.amber : Colors.white),
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.r)))),
                    onPressed: () {
                      setState(() {
                        ismale = true;
                      });
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            color: ismale ? Colors.blue : Colors.grey[100],
                          ),
                          width: 63.w,
                          height: 63.h,
                          child: Center(
                            child: Image.asset(
                              "assets/male.png",
                              height: 27.h,
                              width: 18.w,
                              color: ismale ? Colors.white : Colors.black,
                            ),
                          ),
                        ),
                        SizedBox(width: 12.w),
                        Text(
                          'Male',
                          style: TextStyle(
                            fontSize: 20.sp,
                            color: ismale ? Colors.blue : Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        minimumSize: Size(160.w, 100.h),
                        backgroundColor: Colors.white,
                        elevation: ismale == false ? 10 : 4,
                        shape: RoundedRectangleBorder(
                            side: BorderSide(
                                width: 2.w,
                                color: ismale == false
                                    ? Colors.amber
                                    : Colors.white),
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.r)))),
                    onPressed: () {
                      setState(() {
                        ismale = false;
                      });
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            color: ismale == false
                                ? Colors.blue
                                : Colors.grey[100],
                          ),
                          width: 63.w,
                          height: 63.h,
                          child: Center(
                            child: Image.asset(
                              "assets/female.png",
                              width: 16.w,
                              height: 27.h,
                              color:
                                  ismale == false ? Colors.white : Colors.black,
                            ),
                          ),
                        ),
                        SizedBox(width: 12.w),
                        Text(
                          'Female',
                          style: TextStyle(
                            fontSize: 20.sp,
                            color: ismale == false ? Colors.blue : Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 35.h,
              ),
              Padding(
                padding: EdgeInsets.only(left: 20.w),
                child: Row(
                  children: [
                    Text(
                      "Hospital Name",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Container(
                  height: 48.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.r),
                    color: Color.fromRGBO(239, 242, 241, 1),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              Padding(
                padding: EdgeInsets.only(left: 20.w),
                child: Row(
                  children: [
                    Text(
                      "Your Location",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Container(
                  height: 48.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.r),
                    color: Color.fromRGBO(239, 242, 241, 1),
                  ),
                  child: TextField(
                    // style: TextStyle(fontSize: 20.sp),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                ),
              ),
              SizedBox(
                height: 66.h,
              ),
              ElevatedButton(
                  onPressed: () {
                    Get.to(() => SignInPage());
                  },
                  style: ElevatedButton.styleFrom(
                      maximumSize: Size(200.w, 50.h),
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(20.r)))),
                  child: Center(
                      child: Text(
                    "continue",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w400),
                  ))),
            ],
          ),
        ),
      ),
    );
  }
}
