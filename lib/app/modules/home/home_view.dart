import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../env.g.dart';
import '../../widgets/clipper_container.dart';
import '../../widgets/home_clipper.dart';
import 'home_controller.dart';
import 'tab_home.dart';
import 'tab_report.dart';
import 'tab_tools.dart';
import 'tab_transaction.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => controller.onForceCloseSlider(),
      child: Scaffold(
        appBar: AppBar(
          title: '${Env.appName}'.text.make(),
          actions: [
            IconButton(
              icon: SvgPicture.asset('assets/icons/ic_notif.svg'),
              onPressed: () => {},
            ),
          ],
          toolbarHeight: kBottomNavigationBarHeight + 44,
          bottom: TabBar(
            controller: controller.tabController,
            onTap: (index) => controller.onTabChanged(index),
            tabs: [
              /// tab 1: Home
              Obx(
                () => Tab(
                  icon: SvgPicture.asset(controller.currentTabSelected.value == 0 ? 'assets/icons/ic_home_active.svg' : 'assets/icons/ic_home_inactive.svg'),
                  text: 'Home',
                ).pOnly(bottom: 16),
              ),

              /// tab 2: Transaction
              Obx(
                () => Tab(
                  icon: SvgPicture.asset(controller.currentTabSelected.value == 1 ? 'assets/icons/ic_trx_active.svg' : 'assets/icons/ic_trx_inactive.svg'),
                  text: 'Transaction',
                ).pOnly(bottom: 16),
              ),

              /// tab 3: Report
              Obx(
                () => Tab(
                  icon: SvgPicture.asset(controller.currentTabSelected.value == 2 ? 'assets/icons/ic_report_active.svg' : 'assets/icons/ic_report_inactive.svg'),
                  text: 'Report',
                ).pOnly(bottom: 16),
              ),

              /// tab 4: Tools
              Obx(
                () => Tab(
                  icon: SvgPicture.asset(controller.currentTabSelected.value == 3 ? 'assets/icons/ic_tools_active.svg' : 'assets/icons/ic_tools_inactive.svg'),
                  text: 'Tools',
                ).pOnly(bottom: 16),
              ),
            ],
          ),
        ),
        body: Stack(
          children: [
            TabBarView(
              controller: controller.tabController,
              physics: NeverScrollableScrollPhysics(),
              children: [
                TabHome(),
                TabTransaction(),
                TabReport(),
                TabTools(),
              ],
            ),

            /// --- curve refresh button ---
            ClipperContainer(
              clipper: HomeClipper(120),
              child: Container(
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    IconButton(
                      onPressed: () => controller.onRefresh(),
                      icon: SvgPicture.asset('assets/icons/ic_refresh.svg'),
                    ),
                  ],
                ),
              ),
            ).h(120),
          ],
        ),
      ),
    );
  }
}
