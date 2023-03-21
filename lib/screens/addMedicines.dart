import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:prescription_helper/api_request/admin_login_controller.dart';
import 'package:prescription_helper/api_request/medicinecontroller.dart';

class AddMedicines extends StatefulWidget {
  PatientDetails? patientDetails;
  AddMedicines({
    Key? key,
    required this.patientDetails,
  }) : super(key: key);

  @override
  State<AddMedicines> createState() => _AddMedicinesState();
}

enum Dosage { one, two, three }

class _AddMedicinesState extends State<AddMedicines> {
  var dosage = "1";
  Dosage? _dosage = Dosage.one;
  bool mor7 = false;
  bool mor9 = false;
  bool aft12 = false;
  bool aft1 = false;
  bool eve5 = false;
  bool ni8 = false;
  File? _imageFile;
  bool _uploading = false;
  var imageUrls = [];
  var timings = [];

  final picker = ImagePicker();
  var urli;
  bool isUploading  = false;
  void initState() {
    super.initState();
  }

  Future<void> _getImage() async {
    final pickedFile =
        await picker.getImage(source: ImageSource.camera, imageQuality: 20);

    setState(() {
      _imageFile = File(pickedFile!.path);
    });
  }

  Future<String> _uploadImage() async {
    // Show a progress indicator while uploading
    setState(() {
      _uploading = true;
    });

    // Create a unique file name for the image
    String fileName = DateTime.now().millisecondsSinceEpoch.toString();

    // Create a reference to the Firebase storage location
    Reference firebaseStorageRef =
        FirebaseStorage.instance.ref().child('images/$fileName.jpg');

    // Upload the image file to Firebase storage
    UploadTask uploadTask = firebaseStorageRef.putFile(_imageFile!);

    // Wait for the upload to complete
    TaskSnapshot taskSnapshot = await uploadTask;

    // Get the download URL for the uploaded image
    String downloadUrl = await taskSnapshot.ref.getDownloadURL();

    // Reset the state
    setState(() {
      _uploading = false;
      _imageFile = null;
      imageUrls.add(downloadUrl);
    });
    print(imageUrls);
    return downloadUrl;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromRGBO(217, 225, 232, 1),
        body: isUploading ?  Center(child: CircularProgressIndicator()) : Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: [
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
                // Text(
                //   "Hey Veera",
                //   style: TextStyle(
                //     fontSize: 25.sp,
                //     fontWeight: FontWeight.w700,
                //   ),
                // ),
                Text(
                  "Hey ${widget.patientDetails?.username}",
                  style: TextStyle(
                    fontSize: 25.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.h),
            if (_imageFile != null) ...[
              Image.file(_imageFile!),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: _uploading ? null : urli = _uploadImage,
                child: _uploading
                    ? CircularProgressIndicator()
                    : Text('Upload Image'),
              ),
            ] else ...[
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  if (imageUrls.length > 0) ...[
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: SizedBox(
                        width: 400,
                        height: 100,
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: imageUrls.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: ((context, index) {
                            return Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: 10.w, vertical: 5.h),
                              child: SizedBox(
                                height: 70.h,
                                width: 70.h,
                                child: Image.network(imageUrls[index]),
                              ),
                            );
                          }),
                        ),
                      ),
                    ),
                  ] else ...[
                    Text("No Images Uploaded")
                  ],
                  InkWell(
                    onTap: () async {
                      _getImage();
                    },
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
                  Radio(
                    activeColor: MaterialStateColor.resolveWith(
                        (states) => Colors.green),
                    value: Dosage.one,
                    groupValue: _dosage,
                    onChanged: (value) {
                      setState(() {
                        dosage = 1.toString();
                        _dosage = value as Dosage?;
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
                        dosage = 2.toString();
                        _dosage = value as Dosage?;
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
                        dosage = 3.toString();
                        _dosage = value as Dosage?;
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
              SizedBox(height: 20.h),
              Row(
                children: [
                  Text(
                    "Timings",
                    style: TextStyle(
                      fontSize: 25.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Text(
                        "Morning",
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Row(
                        children: [
                          Checkbox(
                            value: mor7,
                            onChanged: (val) {
                              print(val);
                              setState(() {
                                mor7 = val!;
                                if (timings.contains("7:00 AM")) {
                                  timings.remove("7:00 AM");
                                } else
                                  timings.add("7:00 AM");
                              });
                            },
                          ),
                          Text("07:00 AM")
                        ],
                      ),
                      Row(
                        children: [
                          Checkbox(
                            value: mor9,
                            onChanged: (val) {
                              print(val);
                              setState(() {
                                mor9 = val!;
                                if (timings.contains("9:00 AM")) {
                                  timings.remove("9:00 AM");
                                } else
                                  timings.add("9:00 AM");
                              });
                            },
                          ),
                          Text("09:00 AM")
                        ],
                      ),
                    ],
                  ),
                  SizedBox(width: 40.w),
                  Column(
                    children: [
                      Text(
                        "Afternoon",
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Row(
                        children: [
                          Checkbox(
                            value: aft12,
                            onChanged: (val) {
                              print(val);
                              setState(() {
                                aft12 = val!;
                                if (timings.contains("12:00 PM")) {
                                  timings.remove("12:00 PM");
                                } else
                                  timings.add("12:00 PM");
                              });
                            },
                          ),
                          Text("12:00 PM")
                        ],
                      ),
                      Row(
                        children: [
                          Checkbox(
                            value: aft1,
                            onChanged: (val) {
                              print(val);
                              setState(() {
                                aft1 = val!;
                                if (timings.contains("01:00 PM")) {
                                  timings.remove("01:00 PM");
                                } else
                                  timings.add("01:00 PM");
                              });
                            },
                          ),
                          Text("01:00 PM")
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Text(
                        "Evening",
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Row(
                        children: [
                          Checkbox(
                            value: eve5,
                            onChanged: (val) {
                              print(val);
                              setState(() {
                                eve5 = val!;
                                if (timings.contains("05:00 PM")) {
                                  timings.remove("05:00 PM");
                                } else
                                  timings.add("05:00 PM");
                              });
                            },
                          ),
                          Text("05:00 PM")
                        ],
                      ),
                    ],
                  ),
                  SizedBox(width: 40.w),
                  Column(
                    children: [
                      Text(
                        "Night",
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Row(
                        children: [
                          Checkbox(
                            value: ni8,
                            onChanged: (val) {
                              print(val);
                              setState(() {
                                ni8 = val!;
                                if (timings.contains("08:00 PM")) {
                                  timings.remove("08:00 PM");
                                } else
                                  timings.add("08:00 PM");
                              });
                            },
                          ),
                          Text("08:00 PM")
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 15.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () async {
                      var res;
                      if (timings.length == 0) {
                        Get.snackbar(
                            "Message", "Please select a time for the medicine",
                            snackPosition: SnackPosition.BOTTOM,
                            backgroundColor: Colors.redAccent,
                            colorText: Colors.white);
                      } else if (imageUrls.length == 0) {
                        Get.snackbar(
                            "Message", "Please upload atleast one image",
                            snackPosition: SnackPosition.BOTTOM,
                            backgroundColor: Colors.redAccent,
                            colorText: Colors.white);
                      } else {
                        setState(() {
                          isUploading = true;
                        });
                        res = await addMedicine(imageUrls, timings,
                            dosage.toString(), widget.patientDetails!.id);
                        setState(() {
                          isUploading = false;
                        });
                      }
                      if (res) {
                        setState(() {
                          imageUrls.clear();
                          timings.clear();
                          mor7 = false;
                          mor9 = false;
                          aft12 = false;
                          aft1 = false;
                          eve5 = false;
                          ni8 = false;
                          _dosage = Dosage.one;
                        });
                      }
                      Get.snackbar("Success", "Medicine Added Successfully",
                          snackPosition: SnackPosition.BOTTOM,
                          backgroundColor: Colors.green,
                          colorText: Colors.white);
                    },
                    child: Text("Add Medicine"),
                  )
                ],
              )
            ],
          ]),
        ),
      ),
    );
  }
}
