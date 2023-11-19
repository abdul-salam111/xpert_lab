import 'dart:math';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:xpert_lab/app/modules/alerts/controllers/alerts_controller.dart';

import 'package:xpert_lab/app/routes/app_pages.dart';

final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();
var alertController=Get.put(AlertsController());
@pragma('vm:entry-point')
void notificationTapBackground(NotificationResponse notificationResponse) {
  // ignore: avoid_print
  Get.toNamed(Routes.ALERTS);
  alertController.notificationCount.value= alertController .notificationCount.value=0;
}

class NotificationServices {
  //function to initialise flutter local notification plugin to show notifications for android when app is active
  void initLocalNotifications() async {
    var androidInitializationSettings =
        const AndroidInitializationSettings('@mipmap/ic_launcher');
    var iosInitializationSettings = const DarwinInitializationSettings();

    var initializationSetting = InitializationSettings(
        android: androidInitializationSettings, iOS: iosInitializationSettings);
    await _flutterLocalNotificationsPlugin.initialize(
      initializationSetting,
      onDidReceiveNotificationResponse:
          (NotificationResponse notificationResponse) {
        Get.toNamed(Routes.ALERTS);
      },
      onDidReceiveBackgroundNotificationResponse: notificationTapBackground,
    );
  }

  void requestNotificationPermission() async {
    _flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.requestPermission();
  }

  // function to show visible notification when app is active
}

Future<void> showNotification({String? title, String? body}) async {
  AndroidNotificationChannel channel = AndroidNotificationChannel(
    Random.secure().nextInt(100000).toString(),
    'High Importance Notification',
    importance: Importance.max,
    showBadge: true,
    playSound: true,
    // sound: const RawResourceAndroidNotificationSound('jetsons_doorbell')
  );

  AndroidNotificationDetails androidNotificationDetails =
      AndroidNotificationDetails(
    channel.id.toString(),
    channel.name.toString(),
    channelDescription: 'your channel description',
    importance: Importance.high,
    priority: Priority.high,
    playSound: true,
    ticker: 'ticker',
  );

  const DarwinNotificationDetails darwinNotificationDetails =
      DarwinNotificationDetails(
          presentAlert: true, presentBadge: true, presentSound: true);

  NotificationDetails notificationDetails = NotificationDetails(
      android: androidNotificationDetails, iOS: darwinNotificationDetails);

  Future.delayed(Duration.zero, () {
    _flutterLocalNotificationsPlugin.show(
      0,
      title.toString(),
      body.toString(),
      notificationDetails,
    );
  });
}
