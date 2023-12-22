import 'dart:convert';

/// * 
/// * JSON Source: {"status":{"error":0,"login":true,"user_id":"1","role":"Admin","api-ver":"0.1","dev-debug-param":"1"},"data":{"Server-Time":"2023-12-22 02:15:59","Sender":{"nama":"namanya","email":"emailnya@mail.com","nohp":"083333"}},"debug-live":""}
/// * Code generated: https://2lineofcode.github.io/json_to_dart2023
/// * 
class BackgroundHit {
  BackgroundHitStatus? status;
  BackgroundHitData? data;
  String? xDebugLive;

  BackgroundHit({this.status, this.data, this.xDebugLive});

  BackgroundHit.fromJson(Map<String, dynamic> json) {
    status = (json['status'] != null) ? BackgroundHitStatus.fromJson(json['status']) : null;
    data = (json['data'] != null) ? BackgroundHitData.fromJson(json['data']) : null;
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

class BackgroundHitStatus {
  num? error;
  bool? login;
  String? userId;
  String? role;
  String? xApiVer;
  String? xDevDebugParam;

  BackgroundHitStatus({this.error, this.login, this.userId, this.role, this.xApiVer, this.xDevDebugParam});

  BackgroundHitStatus.fromJson(Map<String, dynamic> json) {
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

class BackgroundHitData {
  String? xServerTime;
  BackgroundHitDataSender? sender;

  BackgroundHitData({this.xServerTime, this.sender});

  BackgroundHitData.fromJson(Map<String, dynamic> json) {
    xServerTime = json['Server-Time'] ?? '';
    sender = (json['Sender'] != null) ? BackgroundHitDataSender.fromJson(json['Sender']) : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['Server-Time'] = xServerTime;
    if (sender != null) {
      data['Sender'] = sender!.toJson();
    }
    return data;
  }

  @override
  String toString() {
    return jsonEncode(this);
  }
}

class BackgroundHitDataSender {
  String? nama;
  String? email;
  String? nohp;

  BackgroundHitDataSender({this.nama, this.email, this.nohp});

  BackgroundHitDataSender.fromJson(Map<String, dynamic> json) {
    nama = json['nama'] ?? '';
    email = json['email'] ?? '';
    nohp = json['nohp'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['nama'] = nama;
    data['email'] = email;
    data['nohp'] = nohp;
    return data;
  }

  @override
  String toString() {
    return jsonEncode(this);
  }
}
