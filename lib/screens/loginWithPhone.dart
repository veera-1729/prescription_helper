import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:prescription_helper/screens/verificationScreen.dart';
import 'package:prescription_helper/utility/appColors.dart';
import 'package:prescription_helper/utility/appDimens.dart';
import 'package:prescription_helper/utility/utility.dart';

class LoginWithPhone extends StatefulWidget {
  LoginWithPhone();
  @override
  _LoginWithPhoneState createState() => _LoginWithPhoneState();
}

class _LoginWithPhoneState extends State<LoginWithPhone> {
  bool isAdmin = false;
  late AppDimens appDimens;
  late TextEditingController textEditingController;
  late Size size;
  late MediaQueryData mediaQuerydata;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    textEditingController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    mediaQuerydata = MediaQuery.of(context);
    size = MediaQuery.of(context).size;
    appDimens = new AppDimens(size);

    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            SingleChildScrollView(
              child: Container(
                constraints: BoxConstraints(
                    maxHeight: size.height - mediaQuerydata.padding.top),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Spacer(),
                    FlutterLogo(
                      size: 150,
                    ),
                    Spacer(),
                    Container(
                      margin: EdgeInsets.only(top: appDimens.paddingw2),
                      alignment: Alignment.center,
                      child: Text(
                        "Login or Register to continue",
                        style: TextStyle(
                          fontSize: appDimens.text20,
                          color: AppColors.greyText,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: appDimens.paddingw20,
                    ),
                    emailMobileView(),
                    SizedBox(
                      height: appDimens.paddingw20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Checkbox(
                          value: isAdmin,
                          onChanged: (value) {
                            setState(() {
                              isAdmin = value!;
                              print(isAdmin);
                            });
                          },
                        ),
                        Text("Login as Admin",style: TextStyle(fontWeight: FontWeight.w900),)
                      ],
                    ),
                    SizedBox(height: 20,),
                    Utility.loginButtonsWidget(
                      "",
                      "Continue",
                      () {
                        continueClick();
                      },
                      AppColors.blackColor,
                      AppColors.blackColor,
                      appDimens,
                      AppColors.whiteColor,
                    ),
                    Spacer(),
                    Spacer(),
                    Container(
                      width: size.width,
                      margin: EdgeInsets.only(bottom: appDimens.paddingw16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(
                            height: appDimens.paddingw18,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            isLoading ? Utility.progress(context) : Container(),
          ],
        ),
      ),
    );
  }

  Widget emailMobileView() {
    return Container(
      margin: EdgeInsets.only(
        left: appDimens.paddingw16 * 2,
        right: appDimens.paddingw16 * 2,
        bottom: appDimens.paddingw16,
      ),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        // boxShadow: [
        //   BoxShadow(
        //     offset: Offset(0, 1),
        //     blurRadius: 2,
        //     color: Colors.black54,
        //   ),
        // ],
        border: Border.all(color: AppColors.blackColor, width: 0.5),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(
              left: appDimens.paddingw6,
              right: appDimens.paddingw6,
            ),
            child: Text(
              "+91",
              style: TextStyle(
                  fontSize: appDimens.text16, color: AppColors.greyText),
            ),
          ),
          Container(
            color: AppColors.blackColor,
            width: 0.5,
            height: 50,
          ),
          Padding(
            padding: EdgeInsets.only(
              right: appDimens.paddingw6,
            ),
          ),
          Expanded(
            child: TextFormField(
              style: TextStyle(
                  fontSize: appDimens.text16, color: AppColors.greyText),
              controller: textEditingController,
              maxLength: 10,
              decoration: InputDecoration(
                hintText: "Mobile Number",
                counterText: "",
                hintStyle: TextStyle(color: AppColors.greyText),
                border: InputBorder.none,
              ),
              textInputAction: TextInputAction.done,
              keyboardType: TextInputType.phone,
            ),
          )
        ],
      ),
    );
  }

  continueClick() {
    FocusScope.of(context).requestFocus(new FocusNode());
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(
    //     builder: (context) => VerificationScreen(
    //       mobile: textEditingController.text,
    //       countrycode: "+91",
    //     ),
    //   ),
    // );
    Get.to(VerificationScreen(
        mobile: textEditingController.text, countrycode: "+91"));
  }
}
