
import 'package:famous_quote_app/pages/famous_quote_page.dart';
import 'package:famous_quote_app/pages/home_page.dart';
import 'package:famous_quote_app/pages/useagle_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart';
final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =FlutterLocalNotificationsPlugin();
void main() {
  final app =MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp());
  final scope =ProviderScope(child: app);
    tz.initializeTimeZones();
    setLocalLocation(getLocation("Asia/Tokyo"));
   runApp(scope);}
//DarwinNotificationDetails()


final indexProvider = StateProvider((ref) {
  return 0;
});

class MyApp extends ConsumerWidget {
  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final index =ref.watch(indexProvider);

    final items=[
      const BottomNavigationBarItem(
        icon:Icon(Icons.person),
        label: "名言集",
        ),
      const BottomNavigationBarItem(
          icon:Icon(Icons.alarm),
          label: "通知",
          ),
      const BottomNavigationBarItem(
          icon:Icon(Icons.description),
          label: "使用方法",
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
      const Famous_Quote_Page(),
      const MyHomePage(title: "アラーム"),
      const UseaglePadge()
 
 ];
    return Scaffold(
      body: pages[index],
      bottomNavigationBar: bar,
     
    );
  }
}