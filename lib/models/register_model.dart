import 'dart:convert';

RegisterModal registerModalFromJson(String str) =>
    RegisterModal.fromJson(json.decode(str));

String registerModalToJson(RegisterModal data) => json.encode(data.toJson());

class RegisterModal {
  RegisterModal(
      {required this.firstName, required this.phone, required this.countryCode
      });

  String firstName;
  String phone;
  String countryCode;

  factory RegisterModal.fromJson(Map<String, dynamic> json) => RegisterModal(
      firstName: json["firstName"], phone: json["phone"], countryCode: json["countryCode"]
      );

  Map<String, dynamic> toJson() => {
        "firstName": firstName,
        "phone": phone,
        "countryCode": countryCode,
      };
}
