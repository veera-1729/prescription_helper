import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Patient_list_widget extends StatefulWidget {
  Patient_list_widget({Key? key, required this.name, required this.phoneno})
      : super(key: key);
  String name;
  String phoneno;
  @override
  State<Patient_list_widget> createState() => _Patient_list_widgetState();
}

class _Patient_list_widgetState extends State<Patient_list_widget> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Material(
          borderRadius: BorderRadius.circular(30.r),
          color: Color.fromRGBO(217, 225, 232, 1),
          elevation: 5,
          child: Container(
            width: 700.w,
            height: 110.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.r),
              color: Colors.white,
              //  boxShadow: [BoxShadow(
              //   color: Colors.grey,
              //   spreadRadius: 0.5.r
              //  )]
              // gradient: LinearGradient(
              //   begin: Alignment.topCenter,
              //   end: Alignment.bottomCenter,
              //   stops: [0.1,0.1,0.9,0.9],
              //   colors: [

              //   Colors.blue.withOpacity(0.3),
              //   Colors.white,
              //   Colors.white,
              //   Colors.black.withOpacity(0.1),

              // ])
            ),
            child: Row(
              children: [
                SizedBox(
                  width: 120.w,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20.h),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                            text: TextSpan(children: [
                          TextSpan(
                              text: "Name - ",
                              style: TextStyle(
                                  fontFamily: "Roboto",
                                  fontWeight: FontWeight.w400,
                                  fontSize: 13.sp,
                                  color: Colors.black)),
                          TextSpan(
                              text: "${widget.name}",
                              style: TextStyle(
                                  fontFamily: "Roboto",
                                  fontWeight: FontWeight.w400,
                                  fontSize: 15,
                                  color: Colors.blue))
                        ])),
                        SizedBox(
                          height: 10.h,
                        ),
                        RichText(
                            text: TextSpan(children: [
                          TextSpan(
                              text: "Age - ",
                              style: TextStyle(
                                  fontFamily: "Roboto",
                                  fontWeight: FontWeight.w400,
                                  fontSize: 13.sp,
                                  color: Colors.black)),
                          TextSpan(
                              text: "20",
                              style: TextStyle(
                                  fontFamily: "Roboto",
                                  fontWeight: FontWeight.w400,
                                  fontSize: 15,
                                  color: Colors.blue))
                        ])),
                        SizedBox(
                          height: 10,
                        ),
                        RichText(
                            text: TextSpan(children: [
                          TextSpan(
                              text: "Contact",
                              style: TextStyle(
                                  fontFamily: "Roboto",
                                  fontWeight: FontWeight.w400,
                                  fontSize: 13.sp,
                                  color: Colors.black)),
                          TextSpan(
                              text: "${widget.phoneno}",
                              style: TextStyle(
                                  fontFamily: "Roboto",
                                  fontWeight: FontWeight.w400,
                                  fontSize: 15,
                                  color: Colors.blue))
                        ]))
                      ]),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: 2.h,
          //left: -10.w,
          child: CircleAvatar(
            radius: 53.r,
            backgroundColor: Colors.blue,
            child: CircleAvatar(
              radius: 51.r,
              backgroundImage: AssetImage("assets/Avatar.png"),
            ),
          ),
        )
      ],
    );
  }
}
