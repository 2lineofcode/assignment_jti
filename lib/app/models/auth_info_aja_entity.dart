import 'dart:convert';

/// *
/// * JSON Source: {"status":{"error":0,"login":true,"user_id":"1","role":"Admin","api-ver":"0.1","dev-debug-param":"1"},"data":{"users":[{"id":"2","full_name":"User","phone":"08111","email_address":"user@user.com","password":"user","designation":"","will_login":"Yes","role":"","outlet_id":"8","company_id":"1","account_creation_date":"2019-02-14 07:29:32","language":"english","last_login":"2021-11-08 14:09:31","active_status":"Active","recover_token":null,"recover_valid":null,"del_status":"Live","outlet_name":"Danone"}]},"debug-param-sent":[null],"debug-live":""}
/// * Code generated: https://2lineofcode.github.io/json_to_dart2023
/// *
class AuthInfoAja {
  AuthInfoAjaStatus? status;
  AuthInfoAjaData? data;
  String? xDebuglive;

  AuthInfoAja({this.status, this.data, this.xDebuglive});

  AuthInfoAja.fromJson(Map<String, dynamic> json) {
    status = (json['status'] != null) ? AuthInfoAjaStatus.fromJson(json['status']) : null;
    data = (json['data'] != null) ? AuthInfoAjaData.fromJson(json['data']) : null;
    xDebuglive = json['debug-live'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (status != null) {
      data['status'] = status!.toJson();
    }
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['debug-live'] = xDebuglive;
    return data;
  }

  @override
  String toString() {
    return jsonEncode(this);
  }
}

class AuthInfoAjaStatus {
  num? error;
  bool? login;
  String? userId;
  String? role;
  String? xApiVer;
  String? xDevDebugParam;

  AuthInfoAjaStatus({this.error, this.login, this.userId, this.role, this.xApiVer, this.xDevDebugParam});

  AuthInfoAjaStatus.fromJson(Map<String, dynamic> json) {
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

class AuthInfoAjaData {
  List<AuthInfoAjaDataUsers>? users;

  AuthInfoAjaData({this.users});

  AuthInfoAjaData.fromJson(Map<String, dynamic> json) {
    users = json['users'] == null ? null : (json['users'] as List).map((e) => AuthInfoAjaDataUsers.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (users != null) {
      data['users'] = users?.map((e) => e.toJson()).toList();
    }
    return data;
  }

  @override
  String toString() {
    return jsonEncode(this);
  }
}

class AuthInfoAjaDataUsers {
  String? id;
  String? fullName;
  String? phone;
  String? emailAddress;
  String? password;
  String? designation;
  String? willLogin;
  String? role;
  String? outletId;
  String? companyId;
  String? accountCreationDate;
  String? language;
  String? lastLogin;
  String? activeStatus;
  dynamic recoverToken;
  dynamic recoverValid;
  String? delStatus;
  String? outletName;

  AuthInfoAjaDataUsers({
    this.id,
    this.fullName,
    this.phone,
    this.emailAddress,
    this.password,
    this.designation,
    this.willLogin,
    this.role,
    this.outletId,
    this.companyId,
    this.accountCreationDate,
    this.language,
    this.lastLogin,
    this.activeStatus,
    this.recoverToken,
    this.recoverValid,
    this.delStatus,
    this.outletName,
  });

  AuthInfoAjaDataUsers.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? '';
    fullName = json['full_name'] ?? '';
    phone = json['phone'] ?? '';
    emailAddress = json['email_address'] ?? '';
    password = json['password'] ?? '';
    designation = json['designation'] ?? '';
    willLogin = json['will_login'] ?? '';
    role = json['role'] ?? '';
    outletId = json['outlet_id'] ?? '';
    companyId = json['company_id'] ?? '';
    accountCreationDate = json['account_creation_date'] ?? '';
    language = json['language'] ?? '';
    lastLogin = json['last_login'] ?? '';
    activeStatus = json['active_status'] ?? '';
    recoverToken = json['recover_token'] ?? '';
    recoverValid = json['recover_valid'] ?? '';
    delStatus = json['del_status'] ?? '';
    outletName = json['outlet_name'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['full_name'] = fullName;
    data['phone'] = phone;
    data['email_address'] = emailAddress;
    data['password'] = password;
    data['designation'] = designation;
    data['will_login'] = willLogin;
    data['role'] = role;
    data['outlet_id'] = outletId;
    data['company_id'] = companyId;
    data['account_creation_date'] = accountCreationDate;
    data['language'] = language;
    data['last_login'] = lastLogin;
    data['active_status'] = activeStatus;
    data['recover_token'] = recoverToken;
    data['recover_valid'] = recoverValid;
    data['del_status'] = delStatus;
    data['outlet_name'] = outletName;
    return data;
  }

  @override
  String toString() {
    return jsonEncode(this);
  }
}
