import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddEditAlarmPage extends StatefulWidget {
  const AddEditAlarmPage({super.key});

  @override
  State<AddEditAlarmPage> createState() => _AddEditAlarmPageState();
}

class _AddEditAlarmPageState extends State<AddEditAlarmPage> {
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
          GestureDetector(//onTapが使えるように
          child:Container(
            alignment: Alignment.center,
            child: const Text("保存",style: TextStyle(color:Colors.orange),),
          ),
          onTap: (){
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
      ),
    );
  }
}