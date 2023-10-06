
import 'package:famous_quote_app/pages/famous_quote_page.dart';
import 'package:famous_quote_app/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =FlutterLocalNotificationsPlugin();
void main() {
  final app =MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp());
  final scope =ProviderScope(child: app);
   runApp(scope);}
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

final indexProvider = StateProvider((ref) {
  return 0;
});

class MyApp extends ConsumerWidget {
  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final index =ref.watch(indexProvider);

    final items=[
      BottomNavigationBarItem(
        icon:Icon(Icons.person),
        label: "名言",
        ),
      BottomNavigationBarItem(
          icon:Icon(Icons.alarm),
          label: "アラーム",
          ),
      
    ];
    final bar =BottomNavigationBar(
      items:items,
      backgroundColor: Colors.black,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.grey,
      currentIndex: index,
      onTap: (index){
        ref.read(indexProvider.notifier).state=index;
      },
    );
    final pages=[
      Famous_Quote_Page(),
      MyHomePage(title: "アラーム")
    ];
    return Scaffold(
      body: pages[index],
      bottomNavigationBar: bar,
     
    );
  }
}
