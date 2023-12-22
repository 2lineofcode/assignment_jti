import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'trx_move_controller.dart';

class TrxMoveView extends GetView<TrxMoveController> {
  const TrxMoveView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TrxMoveView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'TrxMoveView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
