import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/app_pref.dart';
import '../../helpers/helper_loading.dart';
import '../../helpers/helper_snackbar.dart';
import '../../models/auth_init_data_entity.dart';
import '../../models/transactions_get_entity.dart';
import '../../repository/repo_auth.dart';
import '../../repository/repo_trx.dart';
import '../../routes/app_pages.dart';

class HomeController extends GetxController with GetSingleTickerProviderStateMixin, StateMixin {
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

    try {
      change(0, status: RxStatus.loading());
      initData.value = await repoAuth.getInitData();
      transactionList.value = await repoTrx.getTransactions(trxId: 0);
      await onGroupingSum();
      change(200, status: RxStatus.success());
    } catch (e) {
      change(400, status: RxStatus.error('$e'));
    }
    super.onInit();
  }

  Future<void> onRefresh() async {
    change(0, status: RxStatus.loading());
    transactionList.value = await repoTrx.getTransactions(trxId: 0);
    await onGroupingSum();
    change(200, status: RxStatus.success());
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

  void onForceCloseSlider() {
    sliderWidth.value = 0;
    isSliderOpen.value = false;
    update();
  }

  Future<void> onGroupingSum() async {
    sumIDR.value = 0;
    sumUSD.value = 0;
    sumSGD.value = 0;
    sumEUR.value = 0;

    transactionList.forEach((element) {
      if (element.trxCurtipeVar == r'Rp') {
        if (element.trxPtipeNama == 'Masuk') {
          sumIDR.value += double.tryParse(element.trxNominal!) ?? 0;
        } else {
          sumIDR.value -= double.tryParse(element.trxNominal!) ?? 0;
        }
      }

      if (element.trxCurtipeVar == r'$') {
        if (element.trxPtipeNama == 'Masuk') {
          sumUSD.value += double.tryParse(element.trxNominal!) ?? 0;
        } else {
          sumUSD.value -= double.tryParse(element.trxNominal!) ?? 0;
        }
      }

      if (element.trxCurtipeVar == r'S$') {
        if (element.trxPtipeNama == 'Masuk') {
          sumSGD.value += double.tryParse(element.trxNominal!) ?? 0;
        } else {
          sumSGD.value -= double.tryParse(element.trxNominal!) ?? 0;
        }
      }

      if (element.trxCurtipeVar == r'€') {
        if (element.trxPtipeNama == 'Masuk') {
          sumEUR.value += double.tryParse(element.trxNominal!) ?? 0;
        } else {
          sumEUR.value -= double.tryParse(element.trxNominal!) ?? 0;
        }
      }

      update();
    });
  }

  Future<void> onDeleteTrx(String trxId) async {
    LoadingUiHelper.show();
    await repoTrx.postDelTransactions(trxId: trxId);
    await onRefresh();
    SnackbarHelper.info('Trx with id $trxId has been delete');
    LoadingUiHelper.dismiss();
  }

  /// ! goPage
  void goInputInOrOut(TransactionType trxType) {
    Get.toNamed(Routes.TRX_IN_OUT, arguments: [trxType, initData.value]);
    onToggleSlider();
  }

  void goInputMove() {
    Get.toNamed(Routes.TRX_MOVE, arguments: [initData.value]);
    onToggleSlider();
  }

  void goInputMutation() {
    Get.toNamed(Routes.TRX_MUTATION, arguments: [initData.value]);
    onToggleSlider();
  }

  void goInputKurs() {
    Get.toNamed(Routes.TRX_KURS, arguments: [initData.value]);
    onToggleSlider();
  }

  void logout() => {AppPref.setIsLogin(false), Get.offAllNamed(Routes.LOGIN)};
}
