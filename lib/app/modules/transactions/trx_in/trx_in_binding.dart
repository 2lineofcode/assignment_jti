import 'package:get/get.dart';

import 'trx_in_controller.dart';

class TrxInBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TrxInController>(() => TrxInController());
  }
}
