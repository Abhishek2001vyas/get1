import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;


class notification {
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  final AndroidInitializationSettings _androidInitializationSettings =
      AndroidInitializationSettings('qwe');

  void initialiseNotification() async {
    InitializationSettings initializationSettings =
        InitializationSettings(android: _androidInitializationSettings);
    await _flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  void sendNotification(String title, String body) async {
    AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails('channelId', 'channelName',
            playSound: false,
            importance: Importance.max,
            priority: Priority.high);
    NotificationDetails notificationDetails = NotificationDetails(
      android: androidNotificationDetails,
    );
    await _flutterLocalNotificationsPlugin.show(
        0, title, body, notificationDetails);
  }

  void scheduleNotification(String title, String body) async {
    AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails('channelId', 'channelName',
            importance: Importance.max, priority: Priority.high);
    NotificationDetails notificationDetails = NotificationDetails(
      android: androidNotificationDetails,
    );
    await _flutterLocalNotificationsPlugin.periodicallyShow(
        1, title, body, RepeatInterval.everyMinute, notificationDetails);
  }

  void canelnotifications() async {
    _flutterLocalNotificationsPlugin.cancel(0);
  }

  Future qwe(
      {int id = 0,
      String? title,
      String? body,
      required TimeOfDay timepicker}) async {
    AndroidNotificationDetails androidNotificationDetails =
    AndroidNotificationDetails('channelId', 'channelName',
        importance: Importance.max, priority: Priority.high);
    NotificationDetails notificationDetails = NotificationDetails(
      android: androidNotificationDetails,
    );
    return _flutterLocalNotificationsPlugin.zonedSchedule(
        id, title, body,  tz.TZDateTime.from(
      timepicker as DateTime,
      tz.local,
    ), notificationDetails,androidAllowWhileIdle: true,
        uiLocalNotificationDateInterpretation:
        UILocalNotificationDateInterpretation.absoluteTime);
  }
}
