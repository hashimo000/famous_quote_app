import 'dart:async';

import 'package:famous_quote_app/alarm.dart';
import 'package:flutter/material.dart';
import 'package:famous_quote_app/pages/add_edit_alarm_page.dart';
import 'package:famous_quote_app/pages/famous_quote_page.dart';
import 'package:famous_quote_app/sqflite.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';

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
  List<Alarm> alarmList = [];
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =FlutterLocalNotificationsPlugin();
  DateTime time = DateTime.now();
  Future<void> initDb()async{
    await DbProvider.setDb();
    alarmList=await DbProvider.getData();
    setState(() {
      
    });
  }
  Future<void> reBuild()async{
    alarmList=await DbProvider.getData();
    alarmList.sort((a,b)=>a.alarmTime.compareTo(b.alarmTime));
    setState(() {
      
    });
  }
  void initializeNotification(){
    flutterLocalNotificationsPlugin.initialize(
    const InitializationSettings(
      android: AndroidInitializationSettings('ic_stat_'),
      iOS: DarwinInitializationSettings(),
    ),
  );
  }


void setNotification(int id,DateTime alarmTime){
   flutterLocalNotificationsPlugin.cancel(id);
     Tweet randomTweet = getRandomTweet();
  flutterLocalNotificationsPlugin.zonedSchedule(
    id,randomTweet.userName,randomTweet.text,tz.TZDateTime.from(alarmTime,tz.local),
   const NotificationDetails(
      android: AndroidNotificationDetails("id", "name", importance: Importance.max, priority: Priority.high),
      iOS: DarwinNotificationDetails(),),
    uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime
  );
}

  void notification() async {
  
  await flutterLocalNotificationsPlugin.initialize(
    const InitializationSettings(
      android: AndroidInitializationSettings('ic_stat_'),
      iOS: DarwinInitializationSettings(),
    ),
  );

  await flutterLocalNotificationsPlugin.show(
    1,
    "arat",
    "テスト",
    const NotificationDetails(
      android: AndroidNotificationDetails(
          "id", "name", importance: Importance.max, priority: Priority.high),
      iOS: DarwinNotificationDetails(),
    ),
  );
}
  @override
  void initState(){
  super.initState();
  initDb();
  initializeNotification();
  

    }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: [0.1, 0.8,],
            colors: [
               // Replace with your start color
               Color(0xff6033b3), Color(0xff9c27b0)
            ],
          ),
        ),
      
      child: Center(
        child: CustomScrollView(
          slivers: [
            CupertinoSliverNavigationBar(
              backgroundColor: const Color(0xff6033b3), 
              largeTitle:
                  const Text("通知時間", style: TextStyle(color: Colors.white)),
              trailing: GestureDetector(
                child: const Icon(Icons.add,
                    color: Color.fromARGB(255, 32, 134, 243)),
                onTap: () async{
                var result = await  Navigator.push(context, MaterialPageRoute(builder: (context) => AddEditAlarmPage(alarmList)));
                if (result != null){
                  setNotification(result.id,result.alarmTime);
                 reBuild();
                }
                
                },
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
                Alarm alarm = alarmList[index];
                return Column(
                  children: [
                    if (index == 0)
                      const Divider(
                        color: Colors.grey,
                        height: 1,
                      ),
                    Slidable(
                      
                      key: const ValueKey(0),

                      startActionPane: ActionPane(
                        extentRatio: 0.2,//削除スライドの大きさ（この場合画面の横幅の0.２倍）
                        motion: const ScrollMotion(),
                        children: [
                          // 例えば、左側に「Delete」アクションを追加する場合：
                          SlidableAction(
                            
                            onPressed: (context)async {
                              // 削除アクションのロジックをここに追加します。
                             await DbProvider.deleteData(alarm.id);
                             reBuild();
                            
                            },
                            backgroundColor:const Color(0xFFFE4A49),
                            foregroundColor: Colors.white,
                            
                            icon: Icons.delete,
                            label: '削除',
                          
                          ),
                          // 他のアクションも同様に追加できます。
                        ],
                      ),

                      // 必要に応じて、右側にもアクションを追加できます。
                      endActionPane: const ActionPane(
                        motion:  ScrollMotion(),
                        children:  [
                          // ここに右側のアクションを追加します。
                        ],
                      ),
                       child: ListTile(
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              DateFormat("yyyy/MM/dd").format(alarm.alarmTime), // 日付の表示
                              style: const TextStyle(
                                color: Colors.white, fontSize: 25), // 必要に応じてフォントサイズを調整
                                 ),
                                 Text(
                                  DateFormat("H:mm").format(alarm.alarmTime), // 時刻の表示
                                  style: const TextStyle(
                                    color: Colors.white, fontSize: 50),
                                    ),
                                    ],
                                    ),
                        trailing: CupertinoSwitch(
                          value: alarm.isActive,
                          onChanged: (newValue)async {
                            alarm.isActive=newValue;
                            await DbProvider.updateData(alarm);
                            reBuild();
                          }
                        ),
                        onTap: ()async{
                         await Navigator.push(context,MaterialPageRoute(builder: (context)=>AddEditAlarmPage(alarmList,index: index)));
                         setState(() {
                           reBuild();
                         });              },
                      ),
                    ),
                    const Divider(
                      color: Colors.grey,
                      height: 0,
                    )
                  ],
                );
              }, childCount: alarmList.length),
            )
          ],
        ),
       
      ),
      )
    );
    
  }
}