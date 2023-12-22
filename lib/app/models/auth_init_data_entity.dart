import 'dart:convert';

/// *
/// * JSON Source: {"status":{"error":0,"login":false,"api-ver":"0.1","dev-debug-param":"1"},"data":{"outlet":{"id":"1","outlet_name":"Induk","outlet_code":"000001","outlet_address":"Jl. Jakarta 1","outlet_phone":"0816262861","invoice_print":"1","starting_date":"2018-02-18","invoice_footer":"Terima Kasih.","date_format":"d/m/Y","time_zone":"Asia/Jakarta","currency":"Rp.","currency_show":"0","decimal_show":"0","decimal_digit":"2","decimal_zero_hide":"1","outlet_mode":"0","show_ing_code":"0","hpp_mode":"2","cek_akses_bydb":"0","collect_tax":"Yes","tax_registration_title":"NPWP","tax_registration_no":"","tax_title":"PPn","tax_use_global":"0","tax_is_gst":"No","state_code":"","pre_or_post_payment":"Post Payment","user_id":"2","parent_id":"0","order_id":"0","max_sub":"100","del_status":"Live"},"outlet_subs":[{"id":"2","outlet_name":"AQUA","parent_id":"1","order_id":"0"}],"trx_tipe":[{"id":"1","nama":"Masuk","trx":"debet","outlet_id":"1","del_status":"0"}],"pay_tipe":[{"byr_id":"1","byr_nama":"TUNAI","byr_desc":"","byr_qris_data":"","byr_qris_image":"","byr_http":"","outlet_id":"1","del_status":"0"}],"cur_tipe":[{"ct_id":"1","ct_nama":"IDR","ct_logo":"Rp","ct_ket":"Rupiah"}]},"debug-live":""}
/// * Code generated: https://2lineofcode.github.io/json_to_dart2023
/// *
class AuthInit {
  AuthInitStatus? status;
  AuthInitData? data;
  String? xEbuglive;

  AuthInit({this.status, this.data, this.xEbuglive});

  AuthInit.fromJson(Map<String, dynamic> json) {
    status = (json['status'] != null) ? AuthInitStatus.fromJson(json['status']) : null;
    data = (json['data'] != null) ? AuthInitData.fromJson(json['data']) : null;
    xEbuglive = json['debug-live'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (status != null) {
      data['status'] = status!.toJson();
    }
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['debug-live'] = xEbuglive;
    return data;
  }

  @override
  String toString() {
    return jsonEncode(this);
  }
}

class AuthInitStatus {
  num? error;
  bool? login;
  String? xPiver;
  String? xEvdebugparam;

  AuthInitStatus({this.error, this.login, this.xPiver, this.xEvdebugparam});

  AuthInitStatus.fromJson(Map<String, dynamic> json) {
    error = json['error'] ?? 0;
    login = json['login'] ?? false;
    xPiver = json['api-ver'] ?? '';
    xEvdebugparam = json['dev-debug-param'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['error'] = error;
    data['login'] = login;
    data['api-ver'] = xPiver;
    data['dev-debug-param'] = xEvdebugparam;
    return data;
  }

  @override
  String toString() {
    return jsonEncode(this);
  }
}

class AuthInitData {
  AuthInitDataOutlet? outlet;
  List<AuthInitDataOutletSubs>? outletSubs;
  List<AuthInitDataTrxTipe>? trxTipe;
  List<AuthInitDataPayTipe>? payTipe;
  List<AuthInitDataCurTipe>? curTipe;

  AuthInitData({this.outlet, this.outletSubs, this.trxTipe, this.payTipe, this.curTipe});

  AuthInitData.fromJson(Map<String, dynamic> json) {
    outlet = (json['outlet'] != null) ? AuthInitDataOutlet.fromJson(json['outlet']) : null;
    outletSubs = json['outlet_subs'] == null ? null : (json['outlet_subs'] as List).map((e) => AuthInitDataOutletSubs.fromJson(e)).toList();
    trxTipe = json['trx_tipe'] == null ? null : (json['trx_tipe'] as List).map((e) => AuthInitDataTrxTipe.fromJson(e)).toList();
    payTipe = json['pay_tipe'] == null ? null : (json['pay_tipe'] as List).map((e) => AuthInitDataPayTipe.fromJson(e)).toList();
    curTipe = json['cur_tipe'] == null ? null : (json['cur_tipe'] as List).map((e) => AuthInitDataCurTipe.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (outlet != null) {
      data['outlet'] = outlet!.toJson();
    }
    if (outletSubs != null) {
      data['outlet_subs'] = outletSubs?.map((e) => e.toJson()).toList();
    }
    if (trxTipe != null) {
      data['trx_tipe'] = trxTipe?.map((e) => e.toJson()).toList();
    }
    if (payTipe != null) {
      data['pay_tipe'] = payTipe?.map((e) => e.toJson()).toList();
    }
    if (curTipe != null) {
      data['cur_tipe'] = curTipe?.map((e) => e.toJson()).toList();
    }
    return data;
  }

  @override
  String toString() {
    return jsonEncode(this);
  }
}

class AuthInitDataOutlet {
  String? id;
  String? outletName;
  String? outletCode;
  String? outletAddress;
  String? outletPhone;
  String? invoicePrint;
  String? startingDate;
  String? invoiceFooter;
  String? dateFormat;
  String? timeZone;
  String? currency;
  String? currencyShow;
  String? decimalShow;
  String? decimalDigit;
  String? decimalZeroHide;
  String? outletMode;
  String? showIngCode;
  String? hppMode;
  String? cekAksesBydb;
  String? collectTax;
  String? taxRegistrationTitle;
  String? taxRegistrationNo;
  String? taxTitle;
  String? taxUseGlobal;
  String? taxIsGst;
  String? stateCode;
  String? preOrPostPayment;
  String? userId;
  String? parentId;
  String? orderId;
  String? maxSub;
  String? delStatus;

  AuthInitDataOutlet({
    this.id,
    this.outletName,
    this.outletCode,
    this.outletAddress,
    this.outletPhone,
    this.invoicePrint,
    this.startingDate,
    this.invoiceFooter,
    this.dateFormat,
    this.timeZone,
    this.currency,
    this.currencyShow,
    this.decimalShow,
    this.decimalDigit,
    this.decimalZeroHide,
    this.outletMode,
    this.showIngCode,
    this.hppMode,
    this.cekAksesBydb,
    this.collectTax,
    this.taxRegistrationTitle,
    this.taxRegistrationNo,
    this.taxTitle,
    this.taxUseGlobal,
    this.taxIsGst,
    this.stateCode,
    this.preOrPostPayment,
    this.userId,
    this.parentId,
    this.orderId,
    this.maxSub,
    this.delStatus,
  });

  AuthInitDataOutlet.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? '';
    outletName = json['outlet_name'] ?? '';
    outletCode = json['outlet_code'] ?? '';
    outletAddress = json['outlet_address'] ?? '';
    outletPhone = json['outlet_phone'] ?? '';
    invoicePrint = json['invoice_print'] ?? '';
    startingDate = json['starting_date'] ?? '';
    invoiceFooter = json['invoice_footer'] ?? '';
    dateFormat = json['date_format'] ?? '';
    timeZone = json['time_zone'] ?? '';
    currency = json['currency'] ?? '';
    currencyShow = json['currency_show'] ?? '';
    decimalShow = json['decimal_show'] ?? '';
    decimalDigit = json['decimal_digit'] ?? '';
    decimalZeroHide = json['decimal_zero_hide'] ?? '';
    outletMode = json['outlet_mode'] ?? '';
    showIngCode = json['show_ing_code'] ?? '';
    hppMode = json['hpp_mode'] ?? '';
    cekAksesBydb = json['cek_akses_bydb'] ?? '';
    collectTax = json['collect_tax'] ?? '';
    taxRegistrationTitle = json['tax_registration_title'] ?? '';
    taxRegistrationNo = json['tax_registration_no'] ?? '';
    taxTitle = json['tax_title'] ?? '';
    taxUseGlobal = json['tax_use_global'] ?? '';
    taxIsGst = json['tax_is_gst'] ?? '';
    stateCode = json['state_code'] ?? '';
    preOrPostPayment = json['pre_or_post_payment'] ?? '';
    userId = json['user_id'] ?? '';
    parentId = json['parent_id'] ?? '';
    orderId = json['order_id'] ?? '';
    maxSub = json['max_sub'] ?? '';
    delStatus = json['del_status'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['outlet_name'] = outletName;
    data['outlet_code'] = outletCode;
    data['outlet_address'] = outletAddress;
    data['outlet_phone'] = outletPhone;
    data['invoice_print'] = invoicePrint;
    data['starting_date'] = startingDate;
    data['invoice_footer'] = invoiceFooter;
    data['date_format'] = dateFormat;
    data['time_zone'] = timeZone;
    data['currency'] = currency;
    data['currency_show'] = currencyShow;
    data['decimal_show'] = decimalShow;
    data['decimal_digit'] = decimalDigit;
    data['decimal_zero_hide'] = decimalZeroHide;
    data['outlet_mode'] = outletMode;
    data['show_ing_code'] = showIngCode;
    data['hpp_mode'] = hppMode;
    data['cek_akses_bydb'] = cekAksesBydb;
    data['collect_tax'] = collectTax;
    data['tax_registration_title'] = taxRegistrationTitle;
    data['tax_registration_no'] = taxRegistrationNo;
    data['tax_title'] = taxTitle;
    data['tax_use_global'] = taxUseGlobal;
    data['tax_is_gst'] = taxIsGst;
    data['state_code'] = stateCode;
    data['pre_or_post_payment'] = preOrPostPayment;
    data['user_id'] = userId;
    data['parent_id'] = parentId;
    data['order_id'] = orderId;
    data['max_sub'] = maxSub;
    data['del_status'] = delStatus;
    return data;
  }

  @override
  String toString() {
    return jsonEncode(this);
  }
}

class AuthInitDataOutletSubs {
  String? id;
  String? outletName;
  String? parentId;
  String? orderId;

  AuthInitDataOutletSubs({this.id, this.outletName, this.parentId, this.orderId});

  AuthInitDataOutletSubs.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? '';
    outletName = json['outlet_name'] ?? '';
    parentId = json['parent_id'] ?? '';
    orderId = json['order_id'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['outlet_name'] = outletName;
    data['parent_id'] = parentId;
    data['order_id'] = orderId;
    return data;
  }

  @override
  String toString() {
    return jsonEncode(this);
  }
}

class AuthInitDataTrxTipe {
  String? id;
  String? nama;
  String? trx;
  String? outletId;
  String? delStatus;

  AuthInitDataTrxTipe({this.id, this.nama, this.trx, this.outletId, this.delStatus});

  AuthInitDataTrxTipe.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? '';
    nama = json['nama'] ?? '';
    trx = json['trx'] ?? '';
    outletId = json['outlet_id'] ?? '';
    delStatus = json['del_status'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['nama'] = nama;
    data['trx'] = trx;
    data['outlet_id'] = outletId;
    data['del_status'] = delStatus;
    return data;
  }

  @override
  String toString() {
    return jsonEncode(this);
  }
}

class AuthInitDataPayTipe {
  String? byrId;
  String? byrNama;
  String? byrDesc;
  String? byrQrisData;
  String? byrQrisImage;
  String? byrHttp;
  String? outletId;
  String? delStatus;

  AuthInitDataPayTipe({this.byrId, this.byrNama, this.byrDesc, this.byrQrisData, this.byrQrisImage, this.byrHttp, this.outletId, this.delStatus});

  AuthInitDataPayTipe.fromJson(Map<String, dynamic> json) {
    byrId = json['byr_id'] ?? '';
    byrNama = json['byr_nama'] ?? '';
    byrDesc = json['byr_desc'] ?? '';
    byrQrisData = json['byr_qris_data'] ?? '';
    byrQrisImage = json['byr_qris_image'] ?? '';
    byrHttp = json['byr_http'] ?? '';
    outletId = json['outlet_id'] ?? '';
    delStatus = json['del_status'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['byr_id'] = byrId;
    data['byr_nama'] = byrNama;
    data['byr_desc'] = byrDesc;
    data['byr_qris_data'] = byrQrisData;
    data['byr_qris_image'] = byrQrisImage;
    data['byr_http'] = byrHttp;
    data['outlet_id'] = outletId;
    data['del_status'] = delStatus;
    return data;
  }

  @override
  String toString() {
    return jsonEncode(this);
  }
}

class AuthInitDataCurTipe {
  String? ctId;
  String? ctNama;
  String? ctLogo;
  String? ctKet;

  AuthInitDataCurTipe({this.ctId, this.ctNama, this.ctLogo, this.ctKet});

  AuthInitDataCurTipe.fromJson(Map<String, dynamic> json) {
    ctId = json['ct_id'] ?? '';
    ctNama = json['ct_nama'] ?? '';
    ctLogo = json['ct_logo'] ?? '';
    ctKet = json['ct_ket'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['ct_id'] = ctId;
    data['ct_nama'] = ctNama;
    data['ct_logo'] = ctLogo;
    data['ct_ket'] = ctKet;
    return data;
  }

  @override
  String toString() {
    return jsonEncode(this);
  }
}
