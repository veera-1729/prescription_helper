// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api, use_key_in_widget_constructors, avoid_print

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';

import 'package:prescription_helper/screens/splashscreen.dart';

void main() async {
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();
  //most important thing is to initialise firebase in project
  await Firebase.initializeApp(
    name: "phone-auth",
    options: const FirebaseOptions(
      apiKey: 'AIzaSyA2qjWn_iQKKYdTiv1FIaTinIyuAUhJRR8',
      appId: '1:406050922136:android:a089c0a9f010ae78897aed',
      messagingSenderId: '406050922136',
      projectId: 'phone-auth-2d7a4',
      storageBucket: "phone-auth-2d7a4.appspot.com",
    ),
  );
  final userdata = GetStorage();
  FirebaseMessaging.instance.getToken().then((value) {
    userdata.write("firebase_token", value);
    print("Get token $value");
  });
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then(
    (_) {
      runApp(MyApp());
    },
  );
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final userData = GetStorage();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: ScreenUtilInit(
        designSize: Size(360, 800),
        splitScreenMode: true,
        minTextAdapt: true,
        builder: (context, child) => GetMaterialApp(
          debugShowCheckedModeBanner: false, //home: ImageUploader()
          home: SplashPage(),
        ),
      ),
    );
  }
}
