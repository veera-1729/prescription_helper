// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, non_constant_identifier_names, unnecessary_import, implementation_imports, unused_import

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';
import 'package:prescription_helper/models/admin_model.dart';
import 'package:prescription_helper/screens/Navigation.dart';
import 'package:prescription_helper/screens/admindetails.dart';
import 'package:prescription_helper/screens/imageUploader.dart';
import "../api_request/admin_login_controller.dart";

class AdminHome extends StatefulWidget {
  const AdminHome({super.key});

  @override
  State<AdminHome> createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  TextEditingController phone_no_controller = TextEditingController();
  final userdata = GetStorage();
  PatientDetails? patientDetails;
  bool isLoading = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //isAdminDetailsExists();
  }

  void isAdminDetailsExists() async {
    var res = await isAdminExists(userdata.read("adminId"));
    print(res);
    if (res == false) {
      Get.to(() => Admindetails());
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Admin Home"),
        centerTitle: true,
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : Column(
              children: [
                SizedBox(height: 20.h),
                Text(
                  "Hey ${userdata.read("username")},",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 100.h),
                      child: Container(
                        width: 350.w,
                        child: TextField(
                          keyboardType: TextInputType.phone,
                          controller: phone_no_controller,
                          decoration: InputDecoration(
                            label: Text("enter patient phone no"),
                            labelStyle: TextStyle(color: Colors.black),
                            border: OutlineInputBorder(),
                            // hintText: 'Enter Phone No',
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 30.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                // minimumSize: Size.infinite,
                                textStyle: TextStyle(
                                    // backgroundColor: Colors.amber,
                                    )),
                            onPressed: () async {
                              patientDetails = await addPatient(
                                phone_no_controller.text,
                                userdata.read("userId"),
                              );
                            },
                            child: SizedBox(
                                width: 135.w,
                                height: 40.h,
                                child: Center(child: Text("Validate patient"))),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Get.to(ImageUploader(
                                  patientDetails: patientDetails));
                            },
                            child: SizedBox(
                                width: 135.w,
                                height: 40.h,
                                child: Center(child: Text("Add Patient"))),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
    );
  }
}
