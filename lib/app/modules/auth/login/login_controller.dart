import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/app_pref.dart';
import '../../../helpers/helper_loading.dart';
import '../../../helpers/helper_snackbar.dart';
import '../../../repository/repo_auth.dart';
import '../../../routes/app_pages.dart';

class LoginController extends GetxController {
  final repoAuth = Get.find<AuthRepository>();

  final tfUsername = TextEditingController();
  final tfPassword = TextEditingController();

  @override
  void onInit() {
    if (kDebugMode) {
      tfUsername.text = 'admin@admin.com';
      tfPassword.text = 'admin';
    }
    super.onInit();
  }

  Future<void> onLogin() async {
    LoadingUiHelper.show();
    await repoAuth.postLogin(tfUsername.text, tfPassword.text).then((response) async {
      final status = response.status?.login;
      final dataUser = response.data?.user;

      /// ! login failed
      if (status == false) {
        SnackbarHelper.danger('User / Password Not Match');
        return;
      }

      /// * login success
      AppPref.setIsLogin(true);
      AppPref.setCurrentUserId(dataUser!.userId!);
      AppPref.setCurrentUserRole(dataUser.role!);
      AppPref.setCurrentOutletId(dataUser.outletId!);
      await Get.offAllNamed(Routes.HOME);
    });
    LoadingUiHelper.dismiss();
  }
}
