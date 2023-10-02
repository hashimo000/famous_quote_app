
import 'package:famous_quote_app/alarm.dart';
import 'package:famous_quote_app/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
  List<Alarm> alarmList =[
    Alarm(alarmTime:DateTime.now()),
  ];
    


  @override
  Widget build(BuildContext context) {
    return Scaffold(
     backgroundColor: Color.fromARGB(121, 41, 41, 56),
      body: Center(
        child: CustomScrollView(
          slivers: [
            CupertinoSliverNavigationBar(
              backgroundColor: Color.fromARGB(110, 21, 21, 22),
              largeTitle:const Text("通知時間", style:TextStyle(color: Colors.white)),
              trailing: GestureDetector(
                child:const Icon(Icons.add,color: Color.fromARGB(255, 32, 134, 243)),
                onTap: (){

                },
                ),
                
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  Alarm alarm =alarmList[index];
                  return Column(
                    children: [
                      if(index ==0)const Divider(color: Colors.grey,height: 1,),
                      ListTile(
                        title: Text(DateFormat("H:mm").format(alarm.alarmTime),
                        style: const TextStyle(color:Colors.white,fontSize: 50),
                        ),
                        trailing: CupertinoSwitch(
                          value: alarm.isActive, 
                          onChanged: (newValue){
                            setState(() {
                              alarm.isActive=newValue;
                            });
                          },),
                      ),
                      const Divider(color: Colors.grey,height: 0,)
                    ],
                  );
                },
                childCount: alarmList.length
                ),
                )
          ],
        ),
    //     child: Column(
    //       mainAxisAlignment: MainAxisAlignment.center,
    //       children: [
    //         ElevatedButton(
    //            onPressed: () {
    //             notification();  // ここでnotification関数を呼び出します
    // ScaffoldMessenger.of(context).showSnackBar(
    //   const SnackBar(content: Text("ボタンを押下しました")),
    // );  // また、SnackBarを表示してボタンが押されたことをユーザーにフィードバックするように追加します
    //            },
    //            child: const Text('+1 いいね!'),
               
    //         ),
    //       ],
    //     ),
      ),
    );
  }
}
