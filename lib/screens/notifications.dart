// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

int qty = 2;
bool isselected = false;

class Notificationpage extends StatefulWidget {
  const Notificationpage({super.key});

  @override
  State<Notificationpage> createState() => _NotificationpageState();
}

class _NotificationpageState extends State<Notificationpage> {
  String message = "";
  @override
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final arguments = ModalRoute.of(context)!.settings.arguments;
    if (arguments != null) {
      Map? pushArguments = arguments as Map;
      setState(() {
        message = pushArguments["message"];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Color.fromRGBO(217, 225, 232, 1),
          body: Column(
            children: [
              SizedBox(
                height: 20.h,
              ),
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: 30.w,
                  ),
                  Container(
                    height: 48.h,
                    width: 48.w,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: Image.asset("assets/Avatar.png"),
                  ),
                  SizedBox(
                    width: 60.w,
                  ),
                  Text(
                    "Monday  18th",
                    style:
                        TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              SizedBox(
                height: 50.h,
              ),
              tablettickwidget(),
              SizedBox(
                height: 20.h,
              ),
              tabletwidget(),
            ],
          )),
    );
  }
}

class tablettickwidget extends StatelessWidget {
  const tablettickwidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 30.w,
        ),
        Container(
          decoration: BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.all(Radius.circular(20.r))),
          height: 100.h,
          width: 35.w,
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 10.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Color.fromRGBO(143, 204, 181, 1),
                  borderRadius: BorderRadius.all(Radius.circular(20.r)),
                ),
                width: 180.w,
                height: 30.h,
                child: Row(
                  children: [
                    SizedBox(
                      width: 10.w,
                    ),
                    Icon(
                      Icons.sunny,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 15.w,
                    ),
                    Text(
                      "8:00",
                      style: TextStyle(color: Colors.white, fontSize: 18.sp),
                    ),
                    SizedBox(width: 60.w),
                    Text(
                      "AM",
                      style: TextStyle(color: Colors.white, fontSize: 16.sp),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 10.w,
              ),
              Container(
                width: 30.w,
                height: 30.h,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color.fromRGBO(143, 204, 181, 1)),
                child: Center(
                    child: Text(
                  "${qty}",
                  style: TextStyle(fontSize: 18.sp, color: Colors.white),
                )),
              ),
              SizedBox(
                width: 20.w,
              ),
              Container(
                width: 30.w,
                height: 30.h,
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: Colors.amber),
                child: Center(
                    child: Icon(
                  Icons.check,
                  color: Colors.white,
                )),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class tabletwidget extends StatelessWidget {
  const tabletwidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 30.w,
        ),
        Container(
          decoration: BoxDecoration(
              color: Color.fromRGBO(8, 54, 77, 1),
              borderRadius: BorderRadius.all(Radius.circular(20.r))),
          height: 300.h,
          width: 35.w,
        ),
        Padding(
          padding: EdgeInsets.only(top: 10.h),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                     color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(20.r)),
                    ),
                
                height: 80.h,
                width: 220.w,
                child: Padding(
                  padding: EdgeInsets.only(left: 12.w, right: 12.w),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 10.h,
                        ),
                        Text(
                          "Tablet Name",
                          style: TextStyle(
                              fontSize: 16.sp, fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Time :",
                              style: TextStyle(fontSize: 14.sp),
                            ),
                            Text(
                              "Doasge : 2",
                              style: TextStyle(fontSize: 14.sp),
                            ),
                          ],
                        ),
                        Text("   Morning : 8:00 AM")
                      ]),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(153, 71, 153, 1),
                      borderRadius: BorderRadius.all(Radius.circular(20.r)),
                    ),
                    width: 180.w,
                    height: 30.h,
                    child: Row(
                      children: [
                        SizedBox(
                          width: 10.w,
                        ),
                        Icon(
                          Icons.sunny,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 15.w,
                        ),
                        Text(
                          "8:00",
                          style:
                              TextStyle(color: Colors.white, fontSize: 18.sp),
                        ),
                        SizedBox(width: 60.w),
                        Text(
                          "AM",
                          style:
                              TextStyle(color: Colors.white, fontSize: 16.sp),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Container(
                    width: 30.w,
                    height: 30.h,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color.fromRGBO(153, 71, 153, 1)),
                    child: Center(
                        child: Text(
                      "${qty}",
                      style: TextStyle(fontSize: 18.sp, color: Colors.white),
                    )),
                  ),
                  SizedBox(
                    width: 20.w,
                  ),
                  InkWell(
                    onTap: () => {},
                    child: Container(
                      width: 30.w,
                      height: 30.h,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.grey),
                      child: Center(
                        child: Icon(
                          Icons.check,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20.r),
                    ),
                    color: Colors.white),
                height: 160.h,
                width: 180.w,
                child: Image.network("https://firebasestorage.googleapis.com/v0/b/phone-auth-2d7a4.appspot.com/o/images%2F1679147523293.jpg?alt=media&token=4a945ba2-906d-4dd9-8360-13627c71922c ",scale: 0.7,
                fit: BoxFit.cover,
                width: 180.w,
                height: 160.h,),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
