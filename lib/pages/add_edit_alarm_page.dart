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
          GestureDetector(//onTapが使えるよう
          child:Container(
            padding: EdgeInsets.only(right: 20),
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
        child: Row(
          children: [
            const Text("時間",style: TextStyle(color: Colors.white),),
            Container(
              width: 70,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.orange),
                borderRadius: BorderRadius.circular(10),

              ),
              child: const TextField(),
            )
          ],
        ),
      ),
    );
  }
}