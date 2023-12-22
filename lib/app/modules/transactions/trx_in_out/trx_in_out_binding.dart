import 'package:get/get.dart';

import '../../../repository/repo_trx.dart';
import 'trx_in_out_controller.dart';

class TrxInOutBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TransactionRepository>(() => TransactionRepository());
    Get.lazyPut<TrxInOutController>(() => TrxInOutController());
  }
}
