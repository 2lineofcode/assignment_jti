import 'package:get/get.dart';

import '../../repository/repo_auth.dart';
import '../../repository/repo_trx.dart';
import 'home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthRepository>(() => AuthRepository());
    Get.lazyPut<TransactionRepository>(() => TransactionRepository());
    Get.lazyPut<HomeController>(() => HomeController());
  }
}
