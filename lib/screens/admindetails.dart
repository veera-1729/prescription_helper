// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Admindetails extends StatefulWidget {
  const Admindetails({super.key});

  @override
  State<Admindetails> createState() => _AdmindetailsState();
}

class _AdmindetailsState extends State<Admindetails> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromRGBO(217, 225, 232, 1),
        body: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 70.h),
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
              height: 98.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 18.w),
              child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
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
                    minimumSize: Size(170.w, 100.h),
                      backgroundColor: Colors.white,
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(20.r)))),
                  onPressed: () {
                    setState(() {});
                  },
                  child: Row(
                    children: <Widget>[
                      SizedBox(
                        width: 63.w,
                        height: 63.h,
                        child: Image.asset("assets/Icon patient.png"),
                      ),
                      SizedBox(width: 10.w),
                      Text(
                        'Male',
                        style: TextStyle(
                          fontSize: 20.sp,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                // SizedBox(width: 30.w,),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(170.w, 100.h),
                      backgroundColor: Colors.white,
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(20.r)))),
                  onPressed: () {
                    setState(() {});
                  },
                  child: Row(
                    children: <Widget>[
                      SizedBox(
                        width: 63.w,
                        height: 63.h,
                        child: Image.asset("assets/Icon patient.png"),
                      ),
                      SizedBox(width: 10.w),
                      Text(
                        'Male',
                        style: TextStyle(
                          fontSize: 20.sp,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
