import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_storage/get_storage.dart';
import 'package:prescription_helper/widgets/Patient_list_widget.dart';
import '../models/patientsList_model.dart';

import '../api_request/admin_login_controller.dart';
import '../models/patientsList_model.dart';

class PatientsList extends StatefulWidget {
  const PatientsList({super.key});

  @override
  State<PatientsList> createState() => _PatientsListState();
}

class _PatientsListState extends State<PatientsList> {
  List<patientsList>? PatientsList = [];
  final getStorage = GetStorage();
  bool isLoading = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getList();
  }

  void getList() async {
    setState(() {
      isLoading = true;
    });
    var response = await getPatientsList(getStorage.read("userId"));
    setState(() {
      PatientsList = response;
    });
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(217, 225, 232, 1),
        elevation: 0,
        leading: Icon(
          Icons.arrow_back,
          color: Colors.black,
        ),
        title: Text(
          "Patients List",
          style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 25.sp,
              color: Colors.black),
        ),
      ),
      backgroundColor: Color.fromRGBO(217, 225, 232, 1),
      body: SafeArea(
        child: isLoading
            ? Center(child: CircularProgressIndicator())
            : Padding(
                padding: EdgeInsets.only(left: 22.w, top: 10.h, right: 20.w),
                child: Stack(children: [
                  Column(
                    //mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 38.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 272.w,
                            height: 56.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.r),
                              color: Colors.white,
                            ),
                            child: TextField(
                              decoration: InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.search,
                                    color: Colors.blue,
                                  ),
                                  hintText: "Search Your patient",
                                  // disabledBorder: OutlineInputBorder(),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.transparent))
                                  // Container(
                                  //   width: 20.w,
                                  //   height: 20.h,
                                  //   child: Image.asset("assets/search.png",
                                  //   fit: BoxFit.cover,
                                  //   ),
                                  // )
                                  ),
                            ),
                          ),
                          Image.asset(
                            "assets/filter.png",
                            width: 30.w,
                            height: 30.h,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(left: 5.w),
                          child: ListView.builder(
                              scrollDirection: Axis.vertical,
                              // physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: PatientsList!.length,
                              itemBuilder: ((context, index) {
                                return Container(
                                  width: double.infinity,
                                  padding: const EdgeInsets.all(8.0),
                                  child: Patient_list_widget(
                                    name: PatientsList![index].username,
                                    phoneno: PatientsList![index].phoneNo,
                                  ),
                                );
                              })),
                        ),
                      ),
                      Divider()
                      //Patient_list_widget(),
                    ],
                  ),
                ]),
              ),
      ),
    );
  }
}
