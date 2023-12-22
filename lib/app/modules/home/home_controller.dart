import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/app_pref.dart';
import '../../models/auth_init_data_entity.dart';
import '../../models/transactions_get_entity.dart';
import '../../repository/repo_auth.dart';
import '../../repository/repo_trx.dart';
import '../../routes/app_pages.dart';

class HomeController extends GetxController with GetSingleTickerProviderStateMixin {
  /// dep inject repo
  final repoAuth = Get.find<AuthRepository>();
  final repoTrx = Get.find<TransactionRepository>();

  /// tab
  late TabController? tabController;
  final currentTabSelected = 0.obs;

  /// slider
  final isSliderOpen = false.obs;
  final sliderWidth = 0.0.obs;

  /// data
  final initData = AuthInitData().obs;
  final transactionList = <TransactionsGetData>[].obs;

  /// grouping sum
  final sumIDR = 0.0.obs;
  final sumUSD = 0.0.obs;
  final sumSGD = 0.0.obs;
  final sumEUR = 0.0.obs;

  @override
  Future<void> onInit() async {
    tabController = TabController(length: 4, vsync: this);

    initData.value = await repoAuth.getInitData();
    transactionList.value = await repoTrx.getTransactions(trxId: 0);
    await onGroupingSum();
    super.onInit();
  }

  Future<void> onRefresh() async {
    transactionList.value = await repoTrx.getTransactions(trxId: 0);
    await onGroupingSum();
  }

  void onTabChanged(int index) {
    currentTabSelected.value = index;
    tabController?.index = index;
  }

  void onToggleSlider() {
    isSliderOpen.value = !isSliderOpen.value;
    if (isSliderOpen.value) {
      sliderWidth.value = 360;
    } else {
      sliderWidth.value = 0;
    }
    update();
  }

  Future<void> onGroupingSum() async {
    transactionList.forEach((element) {
      if (element.trxCurtipeVar == 'Rp') {
        sumIDR.value += double.tryParse(element.trxNominal!) ?? 0;
      }

      if (element.trxCurtipeVar == '\$') {
        sumUSD.value += double.tryParse(element.trxNominal!) ?? 0;
      }

      if (element.trxCurtipeVar == 'S\$') {
        sumSGD.value += double.tryParse(element.trxNominal!) ?? 0;
      }

      if (element.trxCurtipeVar == '€') {
        sumEUR.value += double.tryParse(element.trxNominal!) ?? 0;
      }

      update();
    });
  }

  /// ! goPage
  void goInputIn() {
    Get.toNamed(Routes.TRX_IN, arguments: initData.value);
    onToggleSlider();
  }

  void goInputOut() {
    Get.toNamed(Routes.TRX_OUT, arguments: initData.value);
    onToggleSlider();
  }

  void goInputMove() {
    Get.toNamed(Routes.TRX_MOVE, arguments: initData.value);
    onToggleSlider();
  }

  void goInputMutation() {
    Get.toNamed(Routes.TRX_MUTATION, arguments: initData.value);
    onToggleSlider();
  }

  void goInputKurs() {
    Get.toNamed(Routes.TRX_KURS, arguments: initData.value);
    onToggleSlider();
  }

  void logout() => {AppPref.setIsLogin(false), Get.offAllNamed(Routes.LOGIN)};
}
