// ignore_for_file: depend_on_referenced_packages, unused_import

import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:flutter_background_service_android/flutter_background_service_android.dart';
import 'package:flutter_background_service_ios/flutter_background_service_ios.dart';
import 'package:get/get.dart';

import 'app/core/app_api.dart';
import 'app/core/app_log.dart';

/// ** Background Service **
/// here i made a background service, with packages:
/// https://pub.dev/packages/flutter_background_service
///
/// i found some limitations with `@iOS`
/// Keep in your mind, iOS doesn't have a long running service feature like Android.
/// So, it's not possible to keep your application running when it's in background because the OS
/// will suspend your application soon.
/// Currently, this provide onBackground method,
/// that will be executed periodically by Background Fetch capability provided by iOS.
/// It cannot be faster than 15 minutes and only alive about 15-30 seconds.
// [Android-only] This "Headless Task" is run when the Android app is terminated with `enableHeadless: true`
// Be sure to annotate your callback function to avoid issues in release mode on Flutter >= 3.3.0
Future<void> initBackgroundService() async {
  final service = FlutterBackgroundService();

  await service.configure(
    androidConfiguration: AndroidConfiguration(
      onStart: onStart,
      autoStart: true,
      autoStartOnBoot: true,
      isForegroundMode: true,
    ),
    iosConfiguration: IosConfiguration(
      autoStart: true,
      onForeground: onStart,
      onBackground: onIosBackground,
    ),
  );
}

@pragma('vm:entry-point')
Future<void> onStart(ServiceInstance service) async {
  WidgetsFlutterBinding.ensureInitialized();
  DartPluginRegistrant.ensureInitialized();

  if (service is AndroidServiceInstance) {
    service.on(ServiceName.setAsForeground).listen((event) {
      service.setAsForegroundService();
    });
    service.on(ServiceName.setAsBackground).listen((event) {
      service.setAsBackgroundService();
    });
  }

  service.on(ServiceName.stopService).listen((event) {
    service.stopSelf();
  });
  Timer.periodic(30.seconds, (timer) async => await _callApiBgHit_());
}

@pragma('vm:entry-point')
Future<bool> onIosBackground(ServiceInstance service) async {
  WidgetsFlutterBinding.ensureInitialized();
  DartPluginRegistrant.ensureInitialized();

  service.on(ServiceName.stopService).listen((event) {
    service.stopSelf();
  });
  Timer.periodic(30.seconds, (timer) async => await _callApiBgHit_());

  return true;
}

Future<void> _callApiBgHit_() async {
  try {
    log('=== callApiBgHit ===');
    final res = await Api.post(
      '/API/BgService/Hit',
      data: {'nama': 'Aditya Pratama', 'email': 'adit02hero@gmail.com', 'nohp': '085217087944'},
    );
    log('res: ${res.data}');
  } catch (e) {
    logE('e: $e');
  }
}

Future<String> getServiceStatus() async {
  final service = FlutterBackgroundService();
  final isRunning = await service.isRunning();

  if (isRunning) {
    return 'Running';
  } else {
    return 'Not Running';
  }
}

Future<void> forceStopService() async {
  final service = FlutterBackgroundService();
  final isRunning = await service.isRunning();
  if (isRunning) service.invoke(ServiceName.stopService);
}

mixin ServiceName {
  static const setAsForeground = 'setAsForeground';
  static const setAsBackground = 'setAsBackground';
  static const stopService = 'stopService';
}
