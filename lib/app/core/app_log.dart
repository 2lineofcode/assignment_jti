import 'dart:developer' as developer;

import '../../env.g.dart';

/*
 * IDE Debug Log Colorize [ASCII]
 * Created by AditP at (c) 2021, LLC. All rights reserved.
 */
final _appName = Env.appName;

void print(dynamic msg, {String? name}) => developer.log('${LogColor.white}$msg${LogColor.reset}', name: name ?? _appName);
void log(dynamic msg, {String? name}) => developer.log('${LogColor.white}$msg${LogColor.reset}', name: name ?? _appName);

void logD(dynamic msg, {String? name}) => developer.log('${LogColor.cyan}$msg${LogColor.reset}', name: name ?? _appName);
void logI(dynamic msg, {String? name}) => developer.log('${LogColor.backgroundBlue}${LogColor.white}$msg${LogColor.reset}', name: name ?? _appName);
void logS(dynamic msg, {String? name}) => developer.log('${LogColor.green}$msg${LogColor.reset}', name: name ?? _appName);
void logW(dynamic msg, {String? name}) => developer.log('${LogColor.orange}$msg${LogColor.reset}', name: name ?? _appName);
void logE(dynamic msg, {String? name}) => developer.log('${LogColor.red}$msg${LogColor.reset}', name: name ?? _appName);
void logC(color, dynamic msg, {String? name}) => developer.log('$color$msg${LogColor.reset}', name: name ?? _appName);

mixin LogColor {
  static const reset = '\x1B[0m'; // default IDE color
  static const red = '\x1B[31m';
  static const green = '\x1B[32m';
  static const blue = '\x1B[34m';
  static const cyan = '\x1B[36m';
  static const orange = '\x1B[38;5;208m';

  static const backgroundRed = '\x1B[41m';
  static const backgroundGreen = '\x1B[42m';
  static const backgroundYellow = '\x1B[43m';
  static const backgroundBlue = '\x1B[44m';
  static const backgroundOrange = '\x1B[48;5;208m';

  static const white = '\x1B[37m';
  static const black = '\x1B[30m';
}
