import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'trx_mutation_controller.dart';

class TrxMutationView extends GetView<TrxMutationController> {
  const TrxMutationView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TrxMutationView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'TrxMutationView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
