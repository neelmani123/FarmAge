import 'package:aov_farmage/LoginOtpScreen/LoginOtpData.dart';

class LoginOtpModel {
  bool status;
  String message;
  Data data;

  LoginOtpModel({this.status, this.message, this.data});

  LoginOtpModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}