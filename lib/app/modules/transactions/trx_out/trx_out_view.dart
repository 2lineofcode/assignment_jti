import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'trx_out_controller.dart';

class TrxOutView extends GetView<TrxOutController> {
  const TrxOutView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TrxOutView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'TrxOutView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
