import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:prescription_helper/api_request/admin_login_controller.dart';

class AddMedicines extends StatefulWidget {
  //PatientDetails patientDetails;
  AddMedicines({
    Key? key,
    //required this.patientDetails,
  }) : super(key: key);

  @override
  State<AddMedicines> createState() => _AddMedicinesState();
}

enum Dosage { one, two, three }

class _AddMedicinesState extends State<AddMedicines> {
  var dosage;
  Dosage? _dosage = Dosage.one;
  bool mor7 = false;
  bool mor9 = false;
  bool aft1 = false;
  bool eve5 = false;
  bool ni8 = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromRGBO(217, 225, 232, 1),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(height: 20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  InkWell(
                    child: Container(
                      height: 41.h,
                      width: 41.w,
                      // padding: EdgeInsets.all(),
                      child: Center(
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                        ),
                      ),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.all(
                          Radius.circular(8.r),
                        ),
                      ),
                    ),
                    onTap: () {
                      Get.back();
                    },
                  ),
                  SizedBox(width: 30),
                  Text(
                    "Hey Veera",
                    style: TextStyle(
                      fontSize: 25.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  // Text(
                  //   "${widget.patientDetails.username}",
                  //   style: TextStyle(
                  //     fontSize: 25.sp,
                  //     fontWeight: FontWeight.w700,
                  //   ),
                  // ),
                ],
              ),
              SizedBox(height: 70.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {},
                    child: Container(
                      height: 70.h,
                      width: 150.w,
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(40, 44, 55, 1),
                          borderRadius:
                              BorderRadius.all(Radius.circular(18.r))),
                      child: Row(
                        children: [
                          SizedBox(width: 5),
                          Icon(Icons.upload, color: Colors.white),
                          SizedBox(width: 15.w),
                          Text(
                            "Upload Images",
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 40.h),
              Row(
                children: [
                  Text(
                    "Dosage",
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // InkWell(
                  //   onTap: () {},
                  //   child: Container(
                  //     height: 70.h,
                  //     width: 150.w,
                  //     decoration: BoxDecoration(
                  //         color: Color.fromRGBO(40, 44, 55, 1),
                  //         borderRadius: BorderRadius.all(Radius.circular(18.r))),
                  //     child: Column(
                  //       children: [
                  //         SizedBox(width: 15.w),
                  //         Text(
                  //           "Dosage",
                  //           style: TextStyle(
                  //             fontSize: 12.sp,
                  //             fontWeight: FontWeight.w500,
                  //             color: Color.fromRGBO(255, 255, 255, 0.9),
                  //           ),
                  //         ),
                  //         Text(
                  //           "Dosage",
                  //           style: TextStyle(
                  //             fontSize: 12.sp,
                  //             fontWeight: FontWeight.w500,
                  //             color: Color.fromRGBO(255, 255, 255, 0.9),
                  //           ),
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // ),

                  Radio(
                    activeColor: MaterialStateColor.resolveWith(
                        (states) => Colors.green),
                    value: Dosage.one,
                    groupValue: _dosage,
                    onChanged: (value) {
                      setState(() {
                        dosage = 1;
                        _dosage = value;
                      });
                      print(value); //selected value
                    },
                  ),
                  Text(
                    "1 pill",
                    style:
                        TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 13.w),
                  Radio(
                    activeColor: MaterialStateColor.resolveWith(
                        (states) => Colors.green),
                    value: Dosage.two,
                    groupValue: _dosage,
                    onChanged: (value) {
                      setState(() {
                        dosage = 2;
                        _dosage = value;
                      });
                      print(value); //selected value
                    },
                  ),
                  Text(
                    "2 pills",
                    style:
                        TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 13.w),

                  Radio(
                    activeColor: MaterialStateColor.resolveWith(
                        (states) => Colors.green),
                    value: Dosage.three,
                    groupValue: _dosage,
                    onChanged: (value) {
                      setState(() {
                        dosage = 3;
                        _dosage = value;
                      });
                      print(value); //selected value
                    },
                  ),
                  Text(
                    "3 pills",
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 40.h),
              Row(

                children: [
                  Text(
                    "Timings",
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  
                  Container(
                    child: Row(
                      children: [
                        Container(
                          color: Color.fromRGBO(84, 158, 211, 1),
                          height: 100.h,
                          width: 3.w,
                          child: Stack(
                            clipBehavior: Clip.none,
                            children: [
                              SizedBox(height: 10.h),
                              Positioned(
                                top: 5.h,
                                child: Row(
                                  children: [
                                    Container(
                                      width: 10.w,
                                      height: 5.h,
                                      color: Colors.yellow,
                                    ),
                                    SizedBox(width: 8.w),
                                    Text(
                                      "7:00 AM",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15.sp,
                                        fontStyle: FontStyle.normal,
                                      ),
                                    ),
                                    SizedBox(width: 20.w),
                                    Checkbox(
                                      value: mor7,
                                      onChanged: (value) {
                                        print(value);
                                        setState(
                                          () {
                                            mor7 = !mor7;
                                          },
                                        );
                                        print(mor7);
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              Positioned(
                                top: 50.h,
                                child: Row(
                                  children: [
                                    Container(
                                      width: 10.w,
                                      height: 5.h,
                                      color: Colors.yellow,
                                    ),
                                    SizedBox(width: 8.w),
                                    Text(
                                      "9:00 AM",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 15.sp,
                                          fontStyle: FontStyle.normal),
                                    ),
                                    SizedBox(width: 20.w),
                                    Checkbox(
                                        value: mor9,
                                        onChanged: (value) {
                                          setState(() {
                                            mor9 = !mor9;
                                          });
                                        }),
                                  ],
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  // SizedBox(width: 30.w),
                  ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
