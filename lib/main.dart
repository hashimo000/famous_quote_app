
import 'package:famous_quote_app/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =FlutterLocalNotificationsPlugin();
void main() {
   runApp(MyApp());}
//DarwinNotificationDetails()
void notification() async {
  
  await flutterLocalNotificationsPlugin.initialize(
    const InitializationSettings(
      android: AndroidInitializationSettings('ic_launcher'),
      iOS: DarwinInitializationSettings(),
    ),
  );

  await flutterLocalNotificationsPlugin.show(
    1,
    "arat",
    "テスト",
    NotificationDetails(
      android: AndroidNotificationDetails(
          "id", "name", importance: Importance.max, priority: Priority.high),
      iOS: DarwinNotificationDetails(),
    ),
  );
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
