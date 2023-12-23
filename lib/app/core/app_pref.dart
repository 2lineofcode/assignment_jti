import 'package:get_storage/get_storage.dart';

/// storage key
const kIsLogin = 'is_login';
const kToken = 'token';
const kCurrentUserId = 'current_user_id';
const kCurrentUserRole = 'current_user_role';
const kCurrentOutletId = 'current_outlet_id';

/// const
const kDateFormatYMD = 'y-MM-d';
const kBgServiceUniqId = '1';
const kBgServiceTaskName = 'simple-hit-api';

final pref = GetStorage();

mixin AppPref {
  /// reset || reset
  static void clear() => pref.erase();
  static void reset() => pref.erase();

  /// * isLogin
  static bool get isLogin => pref.read(kIsLogin) ?? false;
  static void setIsLogin(bool b) => pref.write(kIsLogin, b);

  /// * token
  static String get token => pref.read(kToken) ?? '';
  static void setToken(String token) => pref.write(kToken, token);

  /// * currentUserId
  static String get currentUserId => pref.read(kCurrentUserId) ?? '';
  static void setCurrentUserId(String id) => pref.write(kCurrentUserId, id);

  /// * currentUserRole
  static String? get currentUserRole => pref.read(kCurrentUserRole);
  static void setCurrentUserRole(String role) => pref.write(kCurrentUserRole, role);

  /// * currentOutletId
  static String get currentOutletId => pref.read(kCurrentOutletId) ?? '';
  static void setCurrentOutletId(String id) => pref.write(kCurrentOutletId, id);
}
