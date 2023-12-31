import 'package:get/get.dart';

import '../../../repository/repo_trx.dart';
import 'trx_move_controller.dart';

class TrxMoveBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TransactionRepository>(() => TransactionRepository());
    Get.lazyPut<TrxMoveController>(() => TrxMoveController());
  }
}
