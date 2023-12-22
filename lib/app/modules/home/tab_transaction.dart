import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../extensions/ext_money.dart';
import '../../helpers/helper_decoration.dart';
import '../../models/transactions_get_entity.dart';
import 'home_controller.dart';

class TabTransaction extends GetView<HomeController> {
  const TabTransaction({super.key});

  @override
  Widget build(BuildContext context) {
    return controller.obx(
      onLoading: CupertinoActivityIndicator(color: Colors.white).centered(),
      (state) => VStack([
        ListView.separated(
          shrinkWrap: true,
          separatorBuilder: (context, index) => 12.heightBox,
          itemCount: controller.transactionList.length,
          itemBuilder: (context, index) {
            final item = controller.transactionList[index];
            return itemTransactions(item);
          },
        ).expand(),
      ]).pOnly(top: 65, left: 12, right: 12),
    );
  }

  Widget itemTransactions(TransactionsGetData item) {
    return GestureDetector(
      onTap: () => _showBotSheet(item),
      child: Container(
        width: double.infinity,
        decoration: DecorationHelper.box(),
        child: VStack(
          [
            HStack([
              '# ${item.trxAsalOutletNama}'.text.bold.make(),
              Spacer(),
              '${item.trxPtipeNama}'.text.black.size(12).make().p8().box.color(item.trxPtipeNama == 'Masuk' ? Vx.green100 : Vx.red100).make().cornerRadius(90),
            ]),
            '${int.parse(item.trxNominal!).moneyFormat()}'.text.make(),
            item.trxKet.isNotEmptyAndNotNull ? '${item.trxKet}'.text.make().pSymmetric(v: 12) : 0.heightBox,
            '${item.trxTgl}'.text.size(10).minFontSize(10).make(),
          ],
        ).p12(),
      ),
    );
  }

  void _showBotSheet(TransactionsGetData item) {
    Get.bottomSheet(
      VStack(
        [
          HStack([
            '# ${item.trxAsalOutletNama}'.text.bold.make(),
            Spacer(),
            '${item.trxId}'.text.size(12).minFontSize(12).make(),
          ]).pOnly(bottom: 12),
          item.trxKet.isNotEmptyAndNotNull ? '${item.trxKet}'.text.make() : 0.heightBox,
          '${int.parse(item.trxNominal!).moneyFormat()}'.text.make().pOnly(top: 8),
          Divider(),
          OutlinedButton(
            onPressed: () => {Get.back(), controller.onDeleteTrx(item.trxId!)},
            child: 'Delete'.text.red500.make(),
          ).w(double.infinity),
        ],
      ).p12(),
      backgroundColor: Colors.white,
      shape: BeveledRectangleBorder(),
    );
  }
}
