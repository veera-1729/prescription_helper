import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:prescription_helper/api_request/admin_login_controller.dart';
import 'package:prescription_helper/screens/addMedicines.dart';

class AddPatient extends StatefulWidget {
  const AddPatient({super.key});

  @override
  State<AddPatient> createState() => _AddPatientState();
}

class _AddPatientState extends State<AddPatient> {
  TextEditingController phoneController = TextEditingController();
  PatientDetails? patientDetails;
  final getStorage = GetStorage();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromRGBO(138, 190, 237, 1),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
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
                    onTap: () {},
                  ),
                  SizedBox(width: 30),
                  Text(
                    "Add Patient",
                    style:
                        TextStyle(fontSize: 25.sp, fontWeight: FontWeight.w700),
                  )
                ],
              ),
              SizedBox(height: 50.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "enter patients phone number *",
                    style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        color: Color.fromRGBO(167, 166, 165, 1)),
                  ),
                ],
              ),
              SizedBox(height: 10.h),
              TextFormField(
                controller: phoneController,
                keyboardType: TextInputType.phone,
                maxLength: 10,
                decoration: InputDecoration(
                  label: Text("enter patient phone no"),
                  labelStyle: TextStyle(color: Colors.black),
                  border: OutlineInputBorder(),
                  // hintText: 'Enter Phone No',
                ),
              ),
              Expanded(child: SizedBox(height: 300.h)),

              InkWell(
                child: Container(
                  height: 50.h,
                  width: 204.w,
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(43, 144, 217, 1),
                      borderRadius: BorderRadius.circular(8.r)),
                  child: Center(
                    child: Text(
                      "Find Patient",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 18.sp,
                          color: Colors.white),
                    ),
                  ),
                ),
                onTap: () async {
                  patientDetails = await addPatient(
                      phoneController.text, getStorage.read("userId"));
                  Get.to(() => AddMedicines(patientDetails: patientDetails!));
                },
              )

              // Row(
              //   mainAxisAlignment: MainAxisAlignment.start,
              //   children: [
              //     InkWell(
              //       onTap: () {},
              //       child: Container(
              //         height: 70.h,
              //         width: 150.w,
              //         decoration: BoxDecoration(
              //             color: Color.fromRGBO(40, 44, 55, 1),
              //             borderRadius: BorderRadius.all(Radius.circular(8.r))),
              //         child: Row(
              //           children: [
              //             SizedBox(width: 5),
              //             Icon(Icons.upload, color: Colors.white),
              //             SizedBox(width: 15.w),
              //             Text(
              //               "Upload Images",
              //               style: TextStyle(
              //                 fontSize: 14.sp,
              //                 fontWeight: FontWeight.w500,
              //                 color: Colors.white,
              //               ),
              //             ),
              //           ],
              //         ),
              //       ),
              //     ),
              //   ],
              // ),
              // SizedBox(height: 40.h),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.start,
              //   children: [
              //     InkWell(
              //       onTap: () {},
              //       child: Container(
              //         height: 70.h,
              //         width: 150.w,
              //         decoration: BoxDecoration(
              //             color: Color.fromRGBO(40, 44, 55, 1),
              //             borderRadius: BorderRadius.all(Radius.circular(8.r))),
              //         child: Column(
              //           children: [
              //             SizedBox(width: 15.w),
              //             Text(
              //               "Dosage",
              //               style: TextStyle(
              //                 fontSize: 12.sp,
              //                 fontWeight: FontWeight.w500,
              //                 color: Color.fromRGBO(255, 255, 255, 0.9),
              //               ),
              //             ),
              //           ],
              //         ),
              //       ),
              //     ),
              //   ],
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
