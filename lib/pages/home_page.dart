
import 'package:famous_quote_app/alarm.dart';
import 'package:famous_quote_app/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';



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
  List<Alarm> alarmList =[
    Alarm(alarmTime:DateTime.now()),
  ];
    


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        // child:const CustomScrollView(
        //   slivers: [
        //     CupertinoSliverNavigationBar(
        //       backgroundColor: Colors.black,
        //       largeTitle: Text("通知時間", style:TextStyle(color: Colors.white)),
        //       trailing: GestureDetector(
        //         child:Icon(Icons.add,color: Colors.orange)),
        //     )
        //   ],
        // ),
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
