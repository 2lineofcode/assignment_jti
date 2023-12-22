import 'dart:convert';

/// * 
/// * JSON Source: {"status":{"error":0,"login":true,"user_id":"1","role":"Admin","api-ver":"0.1","dev-debug-param":"1"},"data":{"trx_id":"348","trx_date_created":"2023-12-22 15:21:16","trx_tgl":"2022-02-04","trx_ptipe":"1","trx_nominal":"123","trx_cur_tipe":"1","trx_ket":"ini isi keterangan","trx_photo":null,"trx_asal_outlet_id":"1","trx_darike_outlet_id":"0","trx_bayar_via":"1","trx_user_id":"1","trx_outlet_id":"1","trx_status":"1","trx_is_stok":"0","trx_date_modif":"2023-12-22 15:21:16","trx_deleted":"0","trx_deleted_by":"0","trx_deleted_ket":null},"debug-live":""}
/// * Code generated: https://2lineofcode.github.io/json_to_dart2023
/// * 
class TransactionsAdd {
  TransactionsAddStatus? status;
  TransactionsAddData? data;
  String? xDebugLive;

  TransactionsAdd({this.status, this.data, this.xDebugLive});

  TransactionsAdd.fromJson(Map<String, dynamic> json) {
    status = (json['status'] != null) ? TransactionsAddStatus.fromJson(json['status']) : null;
    data = (json['data'] != null) ? TransactionsAddData.fromJson(json['data']) : null;
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

class TransactionsAddStatus {
  num? error;
  bool? login;
  String? userId;
  String? role;
  String? xApiVer;
  String? xDevDebugParam;

  TransactionsAddStatus({this.error, this.login, this.userId, this.role, this.xApiVer, this.xDevDebugParam});

  TransactionsAddStatus.fromJson(Map<String, dynamic> json) {
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

class TransactionsAddData {
  String? trxId;
  String? trxDateCreated;
  String? trxTgl;
  String? trxPtipe;
  String? trxNominal;
  String? trxCurTipe;
  String? trxKet;
  dynamic trxPhoto;
  String? trxAsalOutletId;
  String? trxDarikeOutletId;
  String? trxBayarVia;
  String? trxUserId;
  String? trxOutletId;
  String? trxStatus;
  String? trxIsStok;
  String? trxDateModif;
  String? trxDeleted;
  String? trxDeletedBy;
  dynamic trxDeletedKet;

  TransactionsAddData({this.trxId, this.trxDateCreated, this.trxTgl, this.trxPtipe, this.trxNominal, this.trxCurTipe, this.trxKet, this.trxPhoto, this.trxAsalOutletId, this.trxDarikeOutletId, this.trxBayarVia, this.trxUserId, this.trxOutletId, this.trxStatus, this.trxIsStok, this.trxDateModif, this.trxDeleted, this.trxDeletedBy, this.trxDeletedKet, });

  TransactionsAddData.fromJson(Map<String, dynamic> json) {
    trxId = json['trx_id'] ?? '';
    trxDateCreated = json['trx_date_created'] ?? '';
    trxTgl = json['trx_tgl'] ?? '';
    trxPtipe = json['trx_ptipe'] ?? '';
    trxNominal = json['trx_nominal'] ?? '';
    trxCurTipe = json['trx_cur_tipe'] ?? '';
    trxKet = json['trx_ket'] ?? '';
    trxPhoto = json['trx_photo'] ?? '';
    trxAsalOutletId = json['trx_asal_outlet_id'] ?? '';
    trxDarikeOutletId = json['trx_darike_outlet_id'] ?? '';
    trxBayarVia = json['trx_bayar_via'] ?? '';
    trxUserId = json['trx_user_id'] ?? '';
    trxOutletId = json['trx_outlet_id'] ?? '';
    trxStatus = json['trx_status'] ?? '';
    trxIsStok = json['trx_is_stok'] ?? '';
    trxDateModif = json['trx_date_modif'] ?? '';
    trxDeleted = json['trx_deleted'] ?? '';
    trxDeletedBy = json['trx_deleted_by'] ?? '';
    trxDeletedKet = json['trx_deleted_ket'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['trx_id'] = trxId;
    data['trx_date_created'] = trxDateCreated;
    data['trx_tgl'] = trxTgl;
    data['trx_ptipe'] = trxPtipe;
    data['trx_nominal'] = trxNominal;
    data['trx_cur_tipe'] = trxCurTipe;
    data['trx_ket'] = trxKet;
    data['trx_photo'] = trxPhoto;
    data['trx_asal_outlet_id'] = trxAsalOutletId;
    data['trx_darike_outlet_id'] = trxDarikeOutletId;
    data['trx_bayar_via'] = trxBayarVia;
    data['trx_user_id'] = trxUserId;
    data['trx_outlet_id'] = trxOutletId;
    data['trx_status'] = trxStatus;
    data['trx_is_stok'] = trxIsStok;
    data['trx_date_modif'] = trxDateModif;
    data['trx_deleted'] = trxDeleted;
    data['trx_deleted_by'] = trxDeletedBy;
    data['trx_deleted_ket'] = trxDeletedKet;
    return data;
  }

  @override
  String toString() {
    return jsonEncode(this);
  }
}
