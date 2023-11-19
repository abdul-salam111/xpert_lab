import 'dart:convert';

Usermodel categoryModelFromJson(String str) =>
    Usermodel.fromJson(json.decode(str));

class Usermodel {
  Usermodel({
    required this.userId,
    required this.userName,
    required this.userDob,
    required this.userEmail,
    required this.userPhone,
    required this.userGender,
    required this.userPassword,
  });
  String? userId;
  String? userName;
  String? userEmail;
  String? userPhone;
  String? userDob;
  String? userGender;
  String? userPassword;

  factory Usermodel.fromJson(Map<String, dynamic> json) => Usermodel(
        userId: json["userId"],
        userName: json["userName"],
        userEmail: json["userEmail"],
        userDob: json["userDob"],
        userPassword: json["userPassword"],
        userGender: json["userGender"],
        userPhone: json["userPhone"],
      );

  Map<String, dynamic> toJson() => {
        'userId': userId,
        'userName': userName,
        'userEmail': userEmail,
        'userDob': userDob,
        'userPassword': userPassword,
        'userGender': userGender,
        'userPhone': userPhone,
      };
}
