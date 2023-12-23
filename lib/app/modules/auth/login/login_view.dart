import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../env.g.dart';
import '../../../core/app_color.dart';
import '../../../helpers/helper_decoration.dart';
import 'login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final passwordVisible = false.obs;

    return Scaffold(
      appBar: AppBar(
        title: 'Login'.text.make(),
      ),
      body: VStack(
        [
          Spacer(),
          Container(
            decoration: DecorationHelper.box(),
            child: VStack(
              [
                'Welcome to ${Env.appName}'.text.bold.size(16).make().pOnly(bottom: 12),
                TextField(
                  controller: controller.tfUsername,
                  style: TextStyle(color: colorPrimary, fontSize: 13),
                  decoration: DecorationHelper.input(hint: 'Username'),
                ),
                12.heightBox,
                Obx(
                  () => TextField(
                    controller: controller.tfPassword,
                    style: TextStyle(color: colorPrimary, fontSize: 13),
                    obscureText: !passwordVisible.value,
                    enableSuggestions: false,
                    autocorrect: false,
                    onSubmitted: (_) => controller.onLogin(),
                    decoration: DecorationHelper.input(
                      hint: 'Password',
                      suffixIcon: IconButton(
                        icon: Icon(passwordVisible.isTrue ? Icons.visibility : Icons.visibility_off, size: 16),
                        onPressed: () => passwordVisible.value = !passwordVisible.value,
                      ),
                    ),
                  ),
                ),
                12.heightBox,
                HStack([
                  Spacer(),
                  ElevatedButton(
                    onPressed: () => controller.onLogin(),
                    child: 'Login'.text.make(),
                  ).h(38),
                ]),
              ],
            ).p16(),
          ),
          Spacer(),
        ],
      ).p16(),
    );
  }
}
