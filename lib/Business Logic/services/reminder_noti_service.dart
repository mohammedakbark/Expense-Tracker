import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;


class ReminderNotification {
  final FlutterLocalNotificationsPlugin notiPlugin =
      FlutterLocalNotificationsPlugin();

  static Future initNotification() async {
    AndroidInitializationSettings androidInitializationSettings =
        const AndroidInitializationSettings('wallet_logo');

    var initializationsettings =
        InitializationSettings(android: androidInitializationSettings);

    return FlutterLocalNotificationsPlugin().initialize(
      initializationsettings,
    );
  }

  _notificationDetails() async {
    return const NotificationDetails(
        android: AndroidNotificationDetails(
      "channelId",
      "channelName",
      importance: Importance.max,
      priority: Priority.high,
    ));
  }

    // Future initlocal() async {
    //   tz.getLocation("Asia/Mumbai");
    // }

  Future showNotification({
    int id = 0,
  }) async {
    // await initlocal().then((value) async {
      // final _scheduleTime = _nextInstanceOfTime(TimeOfDay(hour: 8, minute: 0),value);
      await notiPlugin.show(
          id,
          "Daily Expense Reminder",
          "Reminder to record your daily expenses",
          

          // _scheduleTime,
          await _notificationDetails(),
          // uiLocalNotificationDateInterpretation:
          //     UILocalNotificationDateInterpretation.wallClockTime
              );
    // });
  }

  // tz.TZDateTime _nextInstanceOfTime(TimeOfDay time,location) {
  //   final now = tz.TZDateTime.now(location);
  //   final scheduledTime = tz.TZDateTime(
  //       location, now.year, now.month, now.day, time.hour, time.minute);
  //   if (scheduledTime.isBefore(now)) {
  //     return scheduledTime.add(
  //         const Duration(days: 1)); // Schedule for tomorrow if time has passed
  //   }
  //   return scheduledTime;
  // }
}
