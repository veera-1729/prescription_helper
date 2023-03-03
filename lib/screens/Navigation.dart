import 'dart:async';

import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:prescription_helper/screens/Home.dart';
import 'package:prescription_helper/screens/adminHome.dart';
import 'package:prescription_helper/screens/loginWithPhone.dart';
import 'package:prescription_helper/screens/uploadphots.dart';

class Navigation extends StatefulWidget {
  const Navigation({super.key});

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  @override
  void initState() {
    super.initState();
    final userData = GetStorage();
    print("Logged in ");
    print(userData.read("isLoggedIn"));
    print("Admin");
    print(userData.read("isAdmin"));
    Timer(const Duration(seconds: 2), () {
      if (userData.read("isLoggedIn") == null) {
        Get.to(LoginWithPhone());
      } else {

        if (userData.read("isAdmin") == "true")
          Get.to(AdminHome());
        else if (userData.read("isAdmin") == "false") Get.to(Home());
      }
    });
  }

  Widget build(BuildContext context) {
    return Container();
  }
}
