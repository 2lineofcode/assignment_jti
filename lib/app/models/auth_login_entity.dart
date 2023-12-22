import 'dart:convert';

/// *
/// * JSON Source: {"status":{"error":0,"login":true,"user_id":"1","role":"Admin","api-ver":"0.1","dev-debug-param":"1"},"data":{"user":{"user_id":"1","language":"indonesia","full_name":"Master","phone":"0816","email_address":"admin@admin.com","role":"Admin","designation":"","outlet_id":"1"}},"debug-live":""}
/// * Code generated: https://2lineofcode.github.io/json_to_dart2023
/// *
class AuthLogin {
  AuthLoginStatus? status;
  AuthLoginData? data;
  String? xDebugLive;

  AuthLogin({this.status, this.data, this.xDebugLive});

  AuthLogin.fromJson(Map<String, dynamic> json) {
    status = (json['status'] != null) ? AuthLoginStatus.fromJson(json['status']) : null;
    data = (json['data'] != null) ? AuthLoginData.fromJson(json['data']) : null;
    xDebugLive = json['debug-live'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (status != null) {
      data['status'] = status!.toJson();
    }
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['debug-live'] = xDebugLive;
    return data;
  }

  @override
  String toString() {
    return jsonEncode(this);
  }
}

class AuthLoginStatus {
  num? error;
  bool? login;
  String? userId;
  String? role;
  String? xApiVer;
  String? xDevDebugParam;

  AuthLoginStatus({this.error, this.login, this.userId, this.role, this.xApiVer, this.xDevDebugParam});

  AuthLoginStatus.fromJson(Map<String, dynamic> json) {
    error = json['error'] ?? 0;
    login = json['login'] ?? false;
    userId = json['user_id'] ?? '';
    role = json['role'] ?? '';
    xApiVer = json['api-ver'] ?? '';
    xDevDebugParam = json['dev-debug-param'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['error'] = error;
    data['login'] = login;
    data['user_id'] = userId;
    data['role'] = role;
    data['api-ver'] = xApiVer;
    data['dev-debug-param'] = xDevDebugParam;
    return data;
  }

  @override
  String toString() {
    return jsonEncode(this);
  }
}

class AuthLoginData {
  AuthLoginDataUser? user;

  AuthLoginData({this.user});

  AuthLoginData.fromJson(Map<String, dynamic> json) {
    user = (json['user'] != null) ? AuthLoginDataUser.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (user != null) {
      data['user'] = user!.toJson();
    }
    return data;
  }

  @override
  String toString() {
    return jsonEncode(this);
  }
}

class AuthLoginDataUser {
  String? userId;
  String? language;
  String? fullName;
  String? phone;
  String? emailAddress;
  String? role;
  String? designation;
  String? outletId;

  AuthLoginDataUser({this.userId, this.language, this.fullName, this.phone, this.emailAddress, this.role, this.designation, this.outletId});

  AuthLoginDataUser.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'] ?? '';
    language = json['language'] ?? '';
    fullName = json['full_name'] ?? '';
    phone = json['phone'] ?? '';
    emailAddress = json['email_address'] ?? '';
    role = json['role'] ?? '';
    designation = json['designation'] ?? '';
    outletId = json['outlet_id'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['user_id'] = userId;
    data['language'] = language;
    data['full_name'] = fullName;
    data['phone'] = phone;
    data['email_address'] = emailAddress;
    data['role'] = role;
    data['designation'] = designation;
    data['outlet_id'] = outletId;
    return data;
  }

  @override
  String toString() {
    return jsonEncode(this);
  }
}
