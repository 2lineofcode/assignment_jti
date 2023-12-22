import 'package:get/get.dart';

import '../modules/auth/login/login_binding.dart';
import '../modules/auth/login/login_view.dart';
import '../modules/home/home_binding.dart';
import '../modules/home/home_view.dart';
import '../modules/transactions/trx_in/trx_in_binding.dart';
import '../modules/transactions/trx_in/trx_in_view.dart';
import '../modules/transactions/trx_kurs/trx_kurs_binding.dart';
import '../modules/transactions/trx_kurs/trx_kurs_view.dart';
import '../modules/transactions/trx_move/trx_move_binding.dart';
import '../modules/transactions/trx_move/trx_move_view.dart';
import '../modules/transactions/trx_mutation/trx_mutation_binding.dart';
import '../modules/transactions/trx_mutation/trx_mutation_view.dart';
import '../modules/transactions/trx_out/trx_out_binding.dart';
import '../modules/transactions/trx_out/trx_out_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.LOGIN;

  static final routes = [
    /// ------------------------------------------------------------------------
    /// ! root
    /// ------------------------------------------------------------------------
    // GetPage(
    //   name: Routes.ROOT,
    //   page: () => AppPref.isLogin ? HomeView() : LoginView(),
    //   binding: AppPref.isLogin ? HomeBinding() : LoginBinding(),
    // ),
    // ------------------------------------------------------------------------

    GetPage(
      name: Routes.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: Routes.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.TRX_IN,
      page: () => const TrxInView(),
      binding: TrxInBinding(),
    ),
    GetPage(
      name: Routes.TRX_OUT,
      page: () => const TrxOutView(),
      binding: TrxOutBinding(),
    ),
    GetPage(
      name: Routes.TRX_MOVE,
      page: () => const TrxMoveView(),
      binding: TrxMoveBinding(),
    ),
    GetPage(
      name: Routes.TRX_KURS,
      page: () => const TrxKursView(),
      binding: TrxKursBinding(),
    ),
    GetPage(
      name: Routes.TRX_MUTATION,
      page: () => const TrxMutationView(),
      binding: TrxMutationBinding(),
    ),
  ];
}
