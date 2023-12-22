import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';

///
///   —————————————————————————————————————————————————————————————————————————————
///   * PATTERN TEST
///   simple crosscheck, it's project structure is testable?
///
///   * STEP
///   create mock simulate binding [controller <-> repository]
///   create mock class controller extend [Controller]
///   create mock class repository extend [Repository]
///
///   ? TEST 1 : is repository injected to controller?
///   ? TEST 2 : try call some method repo on controller is work?
/// —————————————————————————————————————————————————————————————————————————————
///
void main() {
  // binding simulate ..
  Get.lazyPut<TestRepository>(() => TestRepository());
  Get.lazyPut<TestController>(() => TestController());

  testWidgets('TestController', (test) async {
    await test.pumpWidget(
      GetMaterialApp(
        home: GetBuilder<TestController>(
          init: TestController(),
          builder: (controller) => Column(
            children: [
              Text('${controller.output}'),
              TextButton(
                child: Text('call some method from repo'),
                onPressed: () => controller.callSomeMethodOnRepo(),
              ),
            ],
          ),
        ),
      ),
    );

    // test 1 : check is repository injected to controller?
    expect(find.text('yes, repository has injected'), findsOneWidget);
    await test.pump();

    // test 2 : check try call some method repo on controller is work?
    await test.tap(find.text('call some method from repo')); // click some button..
    await test.pump();
    expect(find.text('im cat from repo.. MeoW'), findsOneWidget);
  });
}

class TestController extends GetxController {
  final repo = Get.find<TestRepository>();
  final output = ''.obs;

  @override
  void onInit() {
    output.value = '${repo.isImInjected}';
    update();
    super.onInit();
  }

  void callSomeMethodOnRepo() {
    output.value = repo.cat();
    update();
  }
}

class TestRepository {
  final isImInjected = 'yes, repository has injected';

  String cat() {
    return 'im cat from repo.. MeoW';
  }
}
