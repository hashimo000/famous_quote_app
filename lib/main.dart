
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

class MyHomePage extends StatefulWidget {
  final String title;

  const MyHomePage({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
               onPressed: () {
                notification();  // ここでnotification関数を呼び出します
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("ボタンを押下しました")),
    );  // また、SnackBarを表示してボタンが押されたことをユーザーにフィードバックするように追加します
               },
               child: const Text('+1 いいね!'),
               
            ),
          ],
        ),
      ),
    );
  }
}
