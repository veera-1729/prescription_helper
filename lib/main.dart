import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:prescription_helper/screens/Navigation.dart';
import 'package:prescription_helper/screens/imageUploader.dart';
import 'package:prescription_helper/screens/loginWithPhone.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';


void main() async {
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();
  //most important thing is to initialise firebase in project
  await Firebase.initializeApp();
  FirebaseMessaging.instance.getToken().then((value){
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
        FocusScope.of(context).requestFocus(new FocusNode());
      },
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home: LoginWithPhone()
        //home: Navigation(),
      ),
    );
  }
}
