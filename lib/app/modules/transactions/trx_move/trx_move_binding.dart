import 'package:get/get.dart';

import 'trx_move_controller.dart';

class TrxMoveBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TrxMoveController>(
      () => TrxMoveController(),
    );
  }
}
