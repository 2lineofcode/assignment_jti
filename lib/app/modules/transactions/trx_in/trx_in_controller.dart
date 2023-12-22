import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../core/app_pref.dart';
import '../../../extensions/ext_money.dart';
import '../../../helpers/helpers.dart';
import '../../../models/auth_init_data_entity.dart';
import '../../../repository/repo_trx.dart';
import '../../home/home_controller.dart';

class TrxInController extends GetxController {
  /// dep inject repo
  final repoTrx = Get.find<TransactionRepository>();

  /// field
  final startDateSelected = DateFormat(kDateFormatYMD).format(DateTime.now()).obs;
  final photos = <String>[].obs;
  final tfAmount = TextEditingController();
  final tfDescription = TextEditingController();

  /// data
  final initData = AuthInitData().obs;
  final listOutlet = <String>[].obs;
  final listCurrency = <String>[].obs;
  final selectedOutlet = ''.obs;
  final selectedCurrency = ''.obs;

  @override
  Future<void> onInit() async {
    initData.value = (Get.arguments as AuthInitData);

    listOutlet.add(initData.value.outlet?.outletName ?? '');
    listCurrency.value = initData.value.curTipe?.map((e) => e.ctNama ?? '').toList() ?? [];

    selectedOutlet.value = (Get.arguments as AuthInitData).outlet?.outletName ?? '';
    selectedCurrency.value = listCurrency[0];
    super.onInit();
  }

  Future<void> onSubmit() async {
    LoadingUiHelper.show();
    final getCurrencyId = initData.value.curTipe?.map((e) => e.ctNama).toList().indexOf(selectedCurrency.value);
    final res = await repoTrx.postAddTransactions(
      trxType: TransactionType.debet.trxCode,
      date: startDateSelected.value,
      currId: (getCurrencyId! + 1),
      nominal: tfAmount.text.moneyUnformat() ?? 0,
      description: tfDescription.text,
    );
    LoadingUiHelper.dismiss();

    /// * success
    if (res.data['status']['error'] == 0) {
      SnackbarHelper.success('Successfully added Transaction with id: ${res.data['data']['trx_id']}');
      await Get.find<HomeController>().onRefresh(); // -> refresh data home screen
    }
  }
}
