import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'app/core/app_theme.dart';
import 'app/routes/app_pages.dart';
import 'env.g.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// initialize get_storage (shared preference)
  await GetStorage.init();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: Env.appName,
      initialRoute: AppPages.INITIAL,
      theme: AppTheme.light,
      themeMode: AppTheme.currentTheme,
      darkTheme: AppTheme.dark,
      debugShowCheckedModeBanner: false,
      getPages: AppPages.routes,
      defaultTransition: Transition.fadeIn,
    );
  }
}
