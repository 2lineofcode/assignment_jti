import 'package:get/get.dart';

import 'trx_kurs_controller.dart';

class TrxKursBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TrxKursController>(() => TrxKursController());
  }
}
