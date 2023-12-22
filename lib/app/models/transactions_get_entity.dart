import 'dart:convert';

/// *
/// * JSON Source: {"status":{"error":0,"login":true,"user_id":"1","role":"Admin","api-ver":"0.1","dev-debug-param":"1"},"data":[{"trx_ptipe_nama":"Masuk","trx_curtipe_var":"Rp","trx_asal_outlet_nama":"Induk","trx_darike_outlet_id":"0","trx_darike_outlet_nama":"","trx_id":"346","trx_tgl":"2023-02-04","trx_ptipe":"1","trx_date_created":"2023-02-16 11:48:22","trx_nominal":"123","trx_ket":"ini isi keterangan","trx_status":"1","trx_is_stok":"0","trx_asal_outlet_id":"1","trx_outlet_id":"1"}],"debug-live":""}
/// * Code generated: https://2lineofcode.github.io/json_to_dart2023
/// *
class TransactionsGet {
  TransactionsGetStatus? status;
  List<TransactionsGetData>? data;
  String? xDebugLive;

  TransactionsGet({this.status, this.data, this.xDebugLive});

  TransactionsGet.fromJson(Map<String, dynamic> json) {
    status = (json['status'] != null) ? TransactionsGetStatus.fromJson(json['status']) : null;
    data = json['data'] == null ? null : (json['data'] as List).map((e) => TransactionsGetData.fromJson(e)).toList();
    xDebugLive = json['debug-live'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (status != null) {
      data['status'] = status!.toJson();
    }
    if (this.data != null) {
      data['data'] = this.data?.map((e) => e.toJson()).toList();
    }
    data['debug-live'] = xDebugLive;
    return data;
  }

  @override
  String toString() {
    return jsonEncode(this);
  }
}

class TransactionsGetStatus {
  num? error;
  bool? login;
  String? userId;
  String? role;
  String? xApiVer;
  String? xDevDebugParam;

  TransactionsGetStatus({this.error, this.login, this.userId, this.role, this.xApiVer, this.xDevDebugParam});

  TransactionsGetStatus.fromJson(Map<String, dynamic> json) {
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

class TransactionsGetData {
  String? trxPtipeNama;
  String? trxCurtipeVar;
  String? trxAsalOutletNama;
  String? trxDarikeOutletId;
  String? trxDarikeOutletNama;
  String? trxId;
  String? trxTgl;
  String? trxPtipe;
  String? trxDateCreated;
  String? trxNominal;
  String? trxKet;
  String? trxStatus;
  String? trxIsStok;
  String? trxAsalOutletId;
  String? trxOutletId;

  TransactionsGetData(
      {this.trxPtipeNama,
      this.trxCurtipeVar,
      this.trxAsalOutletNama,
      this.trxDarikeOutletId,
      this.trxDarikeOutletNama,
      this.trxId,
      this.trxTgl,
      this.trxPtipe,
      this.trxDateCreated,
      this.trxNominal,
      this.trxKet,
      this.trxStatus,
      this.trxIsStok,
      this.trxAsalOutletId,
      this.trxOutletId});

  TransactionsGetData.fromJson(Map<String, dynamic> json) {
    trxPtipeNama = json['trx_ptipe_nama'] ?? '';
    trxCurtipeVar = json['trx_curtipe_var'] ?? '';
    trxAsalOutletNama = json['trx_asal_outlet_nama'] ?? '';
    trxDarikeOutletId = json['trx_darike_outlet_id'] ?? '';
    trxDarikeOutletNama = json['trx_darike_outlet_nama'] ?? '';
    trxId = json['trx_id'] ?? '';
    trxTgl = json['trx_tgl'] ?? '';
    trxPtipe = json['trx_ptipe'] ?? '';
    trxDateCreated = json['trx_date_created'] ?? '';
    trxNominal = json['trx_nominal'] ?? '';
    trxKet = json['trx_ket'] ?? '';
    trxStatus = json['trx_status'] ?? '';
    trxIsStok = json['trx_is_stok'] ?? '';
    trxAsalOutletId = json['trx_asal_outlet_id'] ?? '';
    trxOutletId = json['trx_outlet_id'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['trx_ptipe_nama'] = trxPtipeNama;
    data['trx_curtipe_var'] = trxCurtipeVar;
    data['trx_asal_outlet_nama'] = trxAsalOutletNama;
    data['trx_darike_outlet_id'] = trxDarikeOutletId;
    data['trx_darike_outlet_nama'] = trxDarikeOutletNama;
    data['trx_id'] = trxId;
    data['trx_tgl'] = trxTgl;
    data['trx_ptipe'] = trxPtipe;
    data['trx_date_created'] = trxDateCreated;
    data['trx_nominal'] = trxNominal;
    data['trx_ket'] = trxKet;
    data['trx_status'] = trxStatus;
    data['trx_is_stok'] = trxIsStok;
    data['trx_asal_outlet_id'] = trxAsalOutletId;
    data['trx_outlet_id'] = trxOutletId;
    return data;
  }

  @override
  String toString() {
    return jsonEncode(this);
  }
}
