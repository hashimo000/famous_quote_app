import 'package:famous_quote_app/alarm.dart';
import 'package:famous_quote_app/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
  List<Alarm> alarmList = [
    Alarm(alarmTime: DateTime.now()),
    Alarm(alarmTime: DateTime.now()),
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
              largeTitle:
                  const Text("通知時間", style: TextStyle(color: Colors.white)),
              trailing: GestureDetector(
                child: const Icon(Icons.add,
                    color: Color.fromARGB(255, 32, 134, 243)),
                onTap: () {},
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
                            onPressed: (context) {
                              // 削除アクションのロジックをここに追加します。
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
                        title: Text(
                          DateFormat("H:mm").format(alarm.alarmTime),
                          style: const TextStyle(
                              color: Colors.white, fontSize: 50),
                        ),
                        trailing: CupertinoSwitch(
                          value: alarm.isActive,
                          onChanged: (newValue) {
                            setState(() {
                              alarm.isActive = newValue;
                            });
                          },
                        ),
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
