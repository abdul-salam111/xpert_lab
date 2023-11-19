import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../appConst/index.dart';
import '../../index.dart';

class NavBarView extends GetView<NavBarController> {
  final List _pages = [
    const HomeView(),
     ReportsView(),
    const ProfileView(),
    const AlertsView(),
    const OrdersView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: Obx(
          () => BottomNavigationBar(
            unselectedIconTheme: const IconThemeData(color: darkBlue),
            enableFeedback: true,
            selectedLabelStyle: TextStyle(fontSize: 12.sp),
            currentIndex: controller.selectedTab.value,
            unselectedLabelStyle: TextStyle(fontSize: 12.sp, color: darkBlue),
            type: BottomNavigationBarType.fixed,
            onTap: (index) {
              controller.selectedTab.value = index;
            
            },
            selectedItemColor: Colors.red,
            unselectedItemColor: Colors.grey,
            items: [
              BottomNavigationBarItem(
                icon: navBarIcon(iconName: homeIcon),
                label: "Home",
              ),
              BottomNavigationBarItem(
                  icon: navBarIcon(iconName: reportIcon), label: "Reports"),
              BottomNavigationBarItem(
                  icon: navBarIcon(iconName: profileIcon), label: "Profile"),
              BottomNavigationBarItem(
                  icon: Obx(() => notificationBadgeforNotifiction(
                      showBadge: Get.put(AlertsController()).notificationCount.value == 0
                          ? false
                          : true,
                      count: Get.put(AlertsController()).notificationCount.value.toString())),
                  label: "Alerts"),
              BottomNavigationBarItem(
                  icon: navBarIcon(iconName: orderIcon), label: "Bookings"),
            ],
          ),
        ),
        body: Obx(() => _pages.elementAt(controller.selectedTab.value)));
  }
}
