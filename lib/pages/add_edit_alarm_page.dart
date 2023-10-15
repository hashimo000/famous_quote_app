import 'package:famous_quote_app/alarm.dart';
import 'package:famous_quote_app/main.dart';
import 'package:famous_quote_app/pages/famous_quote_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:intl/intl.dart';
import 'package:famous_quote_app/sqflite.dart';
import 'package:timezone/timezone.dart' as tz;
@immutable
class AddEditAlarmPage extends StatefulWidget {
 final List<Alarm>alarmList;
 final int? index;
 const AddEditAlarmPage(
  this.alarmList,{
    Key? key,
  this.index,
  }):super(key: key);

  @override
  State<AddEditAlarmPage> createState() => _AddEditAlarmPageState();
}

class _AddEditAlarmPageState extends State<AddEditAlarmPage> {
  TextEditingController controller=TextEditingController();
  DateTime selectedTime = DateTime.now();

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
  void initEditAlarm(){
    if(widget.index !=null){
      selectedTime=widget.alarmList[widget.index!].alarmTime;
      controller.text=DateFormat("H:mm").format(selectedTime);
      setState(() {
        
      });
    }
  }
  @override
  void initState(){
    super.initState();
  initEditAlarm();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth:100 ,
        leading: GestureDetector(
          child: Container(
          alignment: Alignment.center,
          child: const Text("キャンセル",style: TextStyle(color: Color.fromARGB(255, 32, 134, 243),fontSize: 20),),
        ),
        onTap:(){
          Navigator.pop(context);
        }
        ),
        actions: [
          GestureDetector(//onTapが使えるよう
          child:Container(
            padding: const EdgeInsets.only(right: 20),
            alignment: Alignment.center,
            child: const Text("保存",style: TextStyle(color:Color.fromARGB(255, 32, 134, 243),fontSize: 20),),
          ),
          onTap: ()async{
            DateTime now = DateTime.now();
            DateTime? alarmTime;
            if(now.compareTo(selectedTime)==-1){
              alarmTime=DateTime(selectedTime.year,selectedTime.month,selectedTime.day,selectedTime.hour,selectedTime.minute);
            }else{
              alarmTime=DateTime(now.year, now.month, now.day+1, selectedTime.hour, selectedTime.minute);
            }
            Alarm alarm =Alarm(alarmTime: alarmTime);
            if(widget.index !=null){
              alarm.id=widget.alarmList[widget.index!].id;
              await DbProvider.updateData(alarm);
            }else{
            int id =await DbProvider.insertData(alarm);
              alarm.id=id;

            }
                setNotification(alarm.id, alarm.alarmTime);
            Navigator.pop(context,alarm);
            
          },
          ),
          
        ],
        
        
        backgroundColor:const Color.fromARGB(255, 21, 21, 22),
        title: const Text("通知時間"),
      ),
      body: Container(
        height: double.infinity,
        color: const Color.fromARGB(255, 21, 21, 22),
        child:Column(
          children: [
            const SizedBox(height: 50,),
            Padding(
              padding:  const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("時間を入力 →",style: TextStyle(color: Colors.white,fontSize: 20),),
            Container(
              width: 70,
              decoration: BoxDecoration(
                border: Border.all(color:const Color.fromARGB(255, 32, 134, 243)),
                borderRadius: BorderRadius.circular(10),
                
              ),
              child:  TextField(
                controller: controller,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  border: InputBorder.none
                ),
                readOnly: true,
                onTap: (){
                  showModalBottomSheet(context: context, builder: 
                   (BuildContext context) {
                    return CupertinoDatePicker(
                      initialDateTime: selectedTime,
                      mode: CupertinoDatePickerMode.time,
                      onDateTimeChanged: (newDate){
                        String  time =DateFormat("H:mm").format(newDate);
                        selectedTime =newDate;
                        controller.text=time;
                        setState(() {
                          
                        });
                      },
      );
    });
                  
                },
              ),
            )
          ],
        ),),
             
          ],
          
        )
        
      ),
    );
  }
}