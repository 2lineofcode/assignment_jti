import '../core/app_api.dart';
import '../core/app_exception.dart';
import '../core/app_pref.dart';
import '../helpers/helper_snackbar.dart';
import '../models/auth_info_aja_entity.dart';
import '../models/auth_init_data_entity.dart';
import '../models/auth_login_entity.dart';

class AuthRepository {
  Future<AuthLogin> postLogin(String username, String password) async {
    try {
      final res = await Api.post(
        '/API/Auth',
        data: {'act': 'LOGIN', 'un': username, 'up': password},
      );
      return AuthLogin.fromJson(res.data);
    } catch (e) {
      throw ApiException('$e');
    }
  }

  Future<AuthInitData> getInitData() async {
    try {
      final res = await Api.get(
        '/API/Auth/initData',
        data: {
          'act': 'initData',
          'outlet_id': AppPref.currentOutletId,
        },
      );
      return AuthInit.fromJson(res.data).data!;
    } catch (e) {
      SnackbarHelper.danger('$e');
      throw ApiException('$e');
    }
  }

  Future<AuthInfoAjaData> getInfoAja() async {
    try {
      final res = await Api.get('/API/Auth/infoAja');
      return AuthInfoAja.fromJson(res.data).data!;
    } catch (e) {
      throw ApiException('$e');
    }
  }
}
