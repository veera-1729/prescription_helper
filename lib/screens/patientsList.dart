import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:prescription_helper/widgets/Patient_list_widget.dart';

class PatientsList extends StatefulWidget {
  const PatientsList({super.key});

  @override
  State<PatientsList> createState() => _PatientsListState();
}

class _PatientsListState extends State<PatientsList> {
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
          "Patient List",
          style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 25.sp,
              color: Colors.black),
        ),
      ),
      backgroundColor: Color.fromRGBO(217, 225, 232, 1),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 22.w, top: 10.h, right: 20.w),
          child: Stack(
            children:[ Column(
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
                          color: Colors.white),
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
                SizedBox(height: 10.h,),
                 SizedBox(
                  height: 900,
                   child: Padding(
                     padding:  EdgeInsets.only(left: 15.w),
                     child: ListView.builder(
                         scrollDirection: Axis.vertical,
                        // physics: NeverScrollableScrollPhysics(),
                         shrinkWrap: true,
                         itemCount: 8,
                         itemBuilder: ((context, index) {
                           return Padding(
                             padding: const EdgeInsets.all(8.0),
                             child: Patient_list_widget(),
                           );
                         })),
                   ),
                 ),
                 Divider()
                //Patient_list_widget(),
              ],
            ),
            ]
          ),
        ),
      ),
    );
  }
}
