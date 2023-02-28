import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class PhoneAuthPage extends StatefulWidget {
  @override
  _PhoneAuthPageState createState() => _PhoneAuthPageState();
}

class _PhoneAuthPageState extends State<PhoneAuthPage> {
  String? _phoneNumber;
  String? _smsCode;
  String? _verificationCode;

  final _smsCodeController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> _verifyPhoneNumber() async {
    await _auth.verifyPhoneNumber(
      phoneNumber: "+91$_phoneNumber",
      verificationCompleted: (credential) async {
        await _auth.signInWithCredential(credential);
        print('Verification completed, signed in.');
      },
      verificationFailed: (FirebaseAuthException e) {
        print('Verification failed: ${e.message}');
      },
      codeSent: (String verificationId, int? resendToken) {
        setState(() {
          _verificationCode = verificationId;
          print("$_verificationCode get");
          print("Token is $resendToken");
        });
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        print('Auto retrieval timeout: $verificationId');
      },
    );
  }

  Future<void> _signInWithPhoneNumber() async {
    print("hi");
    final PhoneAuthCredential credential = PhoneAuthProvider.credential(
      verificationId: _verificationCode!,
      smsCode: _smsCodeController.text,
    );
    print("hi");
    await _auth.signInWithCredential(credential);
    print('Signed in with phone number successfully.');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Phone Authentication'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Enter Phone Number',
                ),
                keyboardType: TextInputType.phone,
                onChanged: (value) {
                  setState(() {
                    _phoneNumber = value;
                  });
                },
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              child: Text('Send Verification Code'),
              onPressed: _verifyPhoneNumber,
            ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Enter OTP',
                ),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  setState(() {
                    _smsCode = value;
                  });
                },
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              child: Text('Sign In'),
              onPressed: _signInWithPhoneNumber,
            ),
          ],
        ),
      ),
    );
  }
}
