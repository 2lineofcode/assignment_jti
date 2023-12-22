import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../core/app_pref.dart';
import '../../../extensions/ext_money.dart';
import '../../../helpers/helpers.dart';
import '../../../models/auth_init_data_entity.dart';
import '../../../repository/repo_trx.dart';
import '../../home/home_controller.dart';

class TrxMoveController extends GetxController with GetSingleTickerProviderStateMixin, StateMixin {
  /// dep inject repo
  final repoTrx = Get.find<TransactionRepository>();

  /// field
  final startDateSelected = DateFormat(kDateFormatYMD).format(DateTime.now()).obs;
  final photos = <String>[].obs;
  final tfAmount = TextEditingController();
  final tfTitle = TextEditingController();
  final tfDescription = TextEditingController();

  /// data
  final trxType = TransactionType.move.obs;
  final initData = AuthInitData().obs;

  final listCurrency = <String>[].obs;
  final selectedCurrency = ''.obs;

  final listOutlet1 = <String>[].obs;
  final listOutlet2 = <String>[].obs;
  final selectedOutlet1Id = ''.obs;
  final selectedOutlet1Name = ''.obs;
  final selectedOutlet2Id = ''.obs;
  final selectedOutlet2Name = ''.obs;

  @override
  Future<void> onInit() async {
    initData.value = (Get.arguments[0] as AuthInitData);

    /// list :from
    listOutlet1.add(initData.value.outlet?.outletName ?? '');
    selectedOutlet1Id.value = initData.value.outlet?.id ?? '';
    selectedOutlet1Name.value = initData.value.outlet?.outletName ?? '';

    /// list :to
    listOutlet2.value = initData.value.outletSubs?.map((e) => e.outletName ?? '').toList() ?? [];
    selectedOutlet2Id.value = initData.value.outletSubs?.first.id ?? '1';
    selectedOutlet2Name.value = initData.value.outletSubs?.first.outletName ?? '';

    /// list :currency
    listCurrency.value = initData.value.curTipe?.map((e) => e.ctNama ?? '').toList() ?? [];
    selectedCurrency.value = listCurrency[0];
    super.onInit();
  }

  Future<void> onSubmit() async {
    /// validation
    if (tfAmount.text.isBlank! || tfAmount.text == '0') {
      SnackbarHelper.warning('`Amount` is still empty, please input amount..');
      return;
    }

    LoadingUiHelper.show();
    final getCurrencyId = initData.value.curTipe?.map((e) => e.ctNama).toList().indexOf(selectedCurrency.value);
    final res = await repoTrx.postAddTransactions(
      trxType: trxType.value.trxCode,
      outletId1: int.tryParse(selectedOutlet1Id.value) ?? 1,
      outletId2: int.tryParse(selectedOutlet2Id.value) ?? 0,
      currId: (getCurrencyId! + 1),
      date: startDateSelected.value,
      nominal: tfAmount.text.moneyUnformat() ?? 0,
      photo1Base64: photos.isNotEmpty ? photos[0] : '',
      photo2Base64: photos.length >= 2 ? photos[1] : '',
      photo3Base64: photos.length >= 3 ? photos[2] : '',
      photo4Base64: photos.length >= 4 ? photos[3] : '',
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
