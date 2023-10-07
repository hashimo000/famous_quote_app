import 'package:famous_quote_app/alarm.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:famous_quote_app/sqflite.dart';
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
          child: const Text("キャンセル",style: TextStyle(color: Color.fromARGB(255, 32, 134, 243)),),
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
            child: const Text("保存",style: TextStyle(color:Color.fromARGB(255, 32, 134, 243)),),
          ),
          onTap: ()async{
            Alarm alarm =Alarm(alarmTime: DateTime(2023,10,1,selectedTime.hour,selectedTime.minute));
            if(widget.index !=null){
              alarm.id=widget.alarmList[widget.index!].id;
              await DbProvider.updateData(alarm);
            }else{
             await DbProvider.insertData(alarm);
            }
            
            Navigator.pop(context);
            
          },
          ),
          
        ],
        
        
        backgroundColor:const Color.fromARGB(255, 21, 21, 22),
        title: const Text("push時間"),
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
            const Text("時間",style: TextStyle(color: Colors.white),),
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