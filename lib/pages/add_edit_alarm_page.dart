import 'package:famous_quote_app/alarm.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddEditAlarmPage extends StatefulWidget {
  List<Alarm>alarmList;
  final int? index;
 AddEditAlarmPage(this.alarmList,{this.index});

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
          child: const Text("キャンセル",style: TextStyle(color: Colors.orange),),
        ),
        onTap:(){
          Navigator.pop(context);
        }
        ),
        actions: [
          GestureDetector(//onTapが使えるよう
          child:Container(
            padding: EdgeInsets.only(right: 20),
            alignment: Alignment.center,
            child: const Text("保存",style: TextStyle(color:Colors.orange),),
          ),
          onTap: (){
            Alarm alarm =Alarm(alarmTime: DateTime(2023,10,1,selectedTime.hour,selectedTime.minute));
            if(widget.index !=null){
              widget.alarmList[widget.index!]=alarm;
            }else{
              widget.alarmList.add(alarm);
            }
            
            Navigator.pop(context);
            
          },
          ),
          
        ],
        
        
        backgroundColor: Colors.black,
        title: const Text("push時間"),
      ),
      body: Container(
        height: double.infinity,
        color: Colors.black,
        child:Column(
          children: [
            SizedBox(height: 50,),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("時間",style: TextStyle(color: Colors.white),),
            Container(
              width: 70,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.orange),
                borderRadius: BorderRadius.circular(10),

              ),
              child:  TextField(
                controller: controller,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
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