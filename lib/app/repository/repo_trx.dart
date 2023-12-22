import 'package:dio/dio.dart';

import '../core/app_api.dart';
import '../core/app_exception.dart';
import '../core/app_pref.dart';
import '../models/transactions_get_entity.dart';

enum TransactionType {
  debet(1),
  kredit(2),
  move(3);

  const TransactionType(this.trxCode);
  final num trxCode;
}

class TransactionRepository {
  Future<List<TransactionsGetData>> getTransactions({
    required num trxId,
    String? outletId,
    String? userId,
    String? startDate,
    String? endDate,
  }) async {
    try {
      final res = await Api.get(
        '/API/Trx/Get',
        data: {
          'act': 'trxGet',
          'outlet_id': outletId ?? AppPref.currentOutletId,
          'user_id': userId ?? AppPref.currentUserId,
          'data': {
            'trx_id': trxId,
            'status': 1,
            'date_start': startDate,
            'date_end': endDate,
          }
        },
      );

      return TransactionsGet.fromJson(res.data).data!;
    } catch (e) {
      throw ApiException('$e');
    }
  }

  Future<Response<dynamic>> postAddTransactions({
    required num trxType,
    required num currId,
    required num nominal,
    required String date,
    String description = '',
    String photo1Base64 = '',
    String photo2Base64 = '',
    String photo3Base64 = '',
    String photo4Base64 = '',
    num outletId1 = 1,
    num outletId2 = 0,
  }) async {
    try {
      return await Api.post(
        '/API/Trx/Add',
        data: {
          'act': 'trxAdd',
          'outlet_id': AppPref.currentOutletId,
          'user_id': AppPref.currentUserId,
          'data': {
            'ptipe': trxType,
            'curr_id': currId,
            'nominal': nominal.toString(),
            'ket': description,
            'photo': photo1Base64,
            'photo2': photo2Base64,
            'photo3': photo3Base64,
            'photo4': photo4Base64,
            'outlet_id1': outletId1,
            'outlet_id2': outletId2,
            'tgl': date,
          }
        },
      );
    } catch (e) {
      throw ApiException('$e');
    }
  }

  Future<bool> postDelTransactions({required String trxId}) async {
    try {
      final res = await Api.get(
        '/API/Trx/Del',
        data: {
          'act': 'trxDel',
          'outlet_id': AppPref.currentOutletId,
          'user_id': AppPref.currentUserId,
          'data': {'trx_id': trxId},
        },
      );
      return res.data['data'] as bool;
    } catch (e) {
      throw ApiException('$e');
    }
  }
}
