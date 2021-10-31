// To parse this JSON data, do
//
//     final resLogin = resLoginFromJson(jsonString);

import 'dart:convert';

import 'model/user.dart';

ResLogin resLoginFromJson(String str) => ResLogin.fromJson(json.decode(str));

String resLoginToJson(ResLogin data) => json.encode(data.toJson());

class ResLogin {
  ResLogin({
    this.isSuccess,
    this.message,
    this.data,
    this.erros,
  });

  bool? isSuccess;
  String? message;
  Data? data;
  dynamic erros;

  factory ResLogin.fromJson(Map<String, dynamic> json) => ResLogin(
    isSuccess: json["isSuccess"] == null ? null : json["isSuccess"],
    message: json["message"] == null ? null : json["message"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
    erros: json["erros"],
  );

  Map<String, dynamic> toJson() => {
    "isSuccess": isSuccess == null ? null : isSuccess,
    "message": message == null ? null : message,
    "data": data == null ? null : data!.toJson(),
    "erros": erros,
  };
}

class Data {
  Data({
    this.token,
    this.company,
    this.companyLisenceNumber,
    this.user,
  });

  String? token;
  String? company;
  String? companyLisenceNumber;
  User? user;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    token: json["token"] == null ? null : json["token"],
    company: json["company"] == null ? null : json["company"],
    companyLisenceNumber: json["company_lisence_number"] == null ? null : json["company_lisence_number"],
    user: json["user"] == null ? null : User.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "token": token == null ? null : token,
    "company": company == null ? null : company,
    "company_lisence_number": companyLisenceNumber == null ? null : companyLisenceNumber,
    "user": user == null ? null : user!.toJson(),
  };
}


