import 'package:get/get.dart';

import 'trx_mutation_controller.dart';

class TrxMutationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TrxMutationController>(
      () => TrxMutationController(),
    );
  }
}
