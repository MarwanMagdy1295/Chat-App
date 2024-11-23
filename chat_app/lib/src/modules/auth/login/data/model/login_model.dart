// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) =>
    LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  String? refresh;
  String? access;
  int? id;
  String? username;
  String? firstName;
  String? lastName;
  String? email;
  String? role;

  LoginModel({
    this.refresh,
    this.access,
    this.id,
    this.username,
    this.firstName,
    this.lastName,
    this.email,
    this.role,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        refresh: json["refresh"],
        access: json["access"],
        id: json["id"],
        username: json["username"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        email: json["email"],
        role: json["role"],
      );

  Map<String, dynamic> toJson() => {
        "refresh": refresh,
        "access": access,
        "id": id,
        "username": username,
        "first_name": firstName,
        "last_name": lastName,
        "email": email,
        "role": role,
      };
}
