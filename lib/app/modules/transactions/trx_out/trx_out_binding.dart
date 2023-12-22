import 'package:get/get.dart';

import 'trx_out_controller.dart';

class TrxOutBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TrxOutController>(
      () => TrxOutController(),
    );
  }
}
