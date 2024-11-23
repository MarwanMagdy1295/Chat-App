// ignore_for_file: prefer_if_null_operators
import 'dart:convert';

UserModel doctorDiscountModelFromJson(String str) =>
    UserModel.fromJson(json.decode(str));

String doctorDiscountModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  String? message;
  bool? success;
  User? data;
  int? errorForDev;

  UserModel({
    this.message,
    this.success,
    this.data,
    this.errorForDev,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        message: json['message'],
        success: json['success'],
        data: json['data'] == null ? null : User.fromJson(json['data']),
        errorForDev: json['error_for_dev'],
      );

  Map<String, dynamic> toJson() => {
        'message': message,
        'success': success,
        'data': data!.toJson(),
        'error_for_dev': errorForDev,
      };
}

class User {
  String? id;
  String? name;
  String? email;
  String? phoneNumber;
  String? state;

  User({
    this.id,
    this.name,
    this.email,
    this.phoneNumber,
    this.state,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json['id'],
        name: json['name'],
        phoneNumber: json['phone_number'] != null ? json['phone_number'] : null,
        state: json['status'] != null ? json['status'] : null,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'email': email,
        'phone_number': phoneNumber,
      };
}
