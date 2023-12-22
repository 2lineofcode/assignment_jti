import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'trx_kurs_controller.dart';

class TrxKursView extends GetView<TrxKursController> {
  const TrxKursView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TrxKursView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'TrxKursView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
