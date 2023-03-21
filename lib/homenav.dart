// ignore_for_file: prefer_const_constructors

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:prescription_helper/api_request/admin_login_controller.dart';
import 'package:prescription_helper/screens/addPatient.dart';

import 'package:prescription_helper/screens/imageUploader.dart';
import 'package:prescription_helper/screens/loginWithPhone.dart';
import 'package:prescription_helper/screens/myprofile.dart';
import 'package:prescription_helper/screens/patientsList.dart';

import 'screens/adminHome.dart';

class HomeNavigation extends StatefulWidget {
  const HomeNavigation({Key? key, required this.index}) : super(key: key);
  final int index;

  @override
  State<HomeNavigation> createState() => _HomeNavigationState();
}

class _HomeNavigationState extends State<HomeNavigation>
    with TickerProviderStateMixin {
  final getStorage = GetStorage();

  @override
  void initState() {
    if (getStorage.read("isLoggedIn") == "false") {
      Get.to(() => LoginWithPhone());
    }
    routing();
  }
  var adminDetails = Get.arguments;

  int currentTab = 0;
  bool isChecked = false;
  final List<Widget> screens = [
    AdminHome(),
    PatientsList(),
    AddPatient(),
    // ImageUploader(),
    Myprofile(),
  ];
  void routing() {
    if (widget.index == 0) {
      currentTab = 0;
      currentScreen = AdminHome();
    } else if (widget.index == 1) {
      currentTab = 1;
      currentScreen = PatientsList();
    } else if (widget.index == 2) {
      currentTab = 2;
      currentScreen = AddPatient();
    } else {
      currentTab = 3;
      currentScreen = Myprofile();
    }
  }

  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = AdminHome();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: PageStorage(
          bucket: bucket,
          child: currentScreen,
        ),
        bottomNavigationBar: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          notchMargin: 3,
          color: Colors.white,
          child: SizedBox(
            height: 63.h,
            child: Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MaterialButton(
                    onPressed: () {
                      setState(() {
                        currentScreen = AdminHome();
                        currentTab = 0;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: 24.h, child: Icon(Icons.home)),
                        SizedBox(
                          height: 7,
                        ),
                        Text(
                          "Home",
                          style: TextStyle(
                            color: currentTab == 0
                                ? Color.fromRGBO(250, 151, 70, 1)
                                : Colors.black,
                            fontFamily: "Roboto",
                            fontSize: 8,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                  MaterialButton(
                    onPressed: () {
                      setState(() {
                        currentScreen = PatientsList();
                        currentTab = 1;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: 24.h, child: Icon(Icons.list)),
                        SizedBox(
                          height: 7,
                        ),
                        Text(
                          "Patients List",
                          style: TextStyle(
                            color: currentTab == 1
                                ? Color.fromRGBO(250, 151, 70, 1)
                                : Colors.black,
                            fontFamily: "Roboto",
                            fontSize: 8,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                  MaterialButton(
                    onPressed: () {
                      setState(() {
                        currentScreen = AddPatient();
                        currentTab = 2;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: 24, child: Icon(Icons.add)),
                        SizedBox(
                          height: 7,
                        ),
                        Text(
                          "Add Patient",
                          style: TextStyle(
                            color: currentTab == 2
                                ? Color.fromRGBO(250, 151, 70, 1)
                                : Colors.black,
                            fontFamily: "Roboto",
                            fontSize: 8,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                  MaterialButton(
                    onPressed: () {
                      setState(() {
                        currentScreen = Myprofile();
                        currentTab = 3;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: 24, child: Icon(Icons.person)),
                        SizedBox(
                          height: 7,
                        ),
                        Text(
                          "Profile",
                          style: TextStyle(
                            color: currentTab == 3
                                ? Color.fromRGBO(250, 151, 70, 1)
                                : Colors.black,
                            fontFamily: "Roboto",
                            fontSize: 8,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
