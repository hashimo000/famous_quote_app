import 'package:flutter/material.dart';
class UseaglePadge extends StatelessWidget {
  const UseaglePadge({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
       debugShowCheckedModeBanner: false,
      home:InstructionPage(),
 );
  }
}




class InstructionPage extends StatefulWidget {
  @override
  _InstructionPageState createState() => _InstructionPageState();
}

class _InstructionPageState extends State<InstructionPage> {
   int currentPage = 0;
final Widget page1 = Image.asset('assets/images/S__98926597.jpg');
final Widget page2 = Image.asset('assets/images/insort.jpg');
final Widget page3 = Image.asset('assets/images/select time.jpg');
final Widget page4 = Image.asset('assets/images/savebotton.jpg');
final Widget page5 = Image.asset('assets/images/add time.jpg');
final Widget page6 = Image.asset('assets/images/quote page.jpg');
  late final List<Widget> instructions;

  _InstructionPageState() {
    instructions = [
      Column(
        children: [
          page1,
          const Text('説明1', style: TextStyle(fontSize: 27,color: Colors.white,), textAlign: TextAlign.center,),
          const Text('+ボタンを押して通知時間を追加しよう！', style: TextStyle(fontSize: 27,color: Colors.white), textAlign: TextAlign.center),
          
        ],
      ),
      Column(
        children: [
          page2,
          const Text('説明2', style: TextStyle(fontSize: 27,color: Colors.white), textAlign: TextAlign.center),
          const Text('青枠をタップして時間を入力してみよう！', style: TextStyle(fontSize: 27,color: Colors.white), textAlign: TextAlign.center),
        ],
      ), Column(
        children: [

          page3,
          const Text('説明3', style: TextStyle(fontSize: 27,color: Colors.white), textAlign: TextAlign.center),
          const  Text('好きな時間を選ぼう！', style: TextStyle(fontSize: 27,color: Colors.white), textAlign: TextAlign.center),
        ],
      ), Column(
        children: [

          page4,
         const  Text('説明4', style: TextStyle(fontSize: 27,color: Colors.white), textAlign: TextAlign.center),
          const Text('時間を選んだら保存タップ！', style: TextStyle(fontSize: 27,color: Colors.white), textAlign: TextAlign.center),
        ],

      ), Column(
        children: [
          page5,
          const Text('説明5', style: TextStyle(fontSize: 27,color: Colors.white), textAlign: TextAlign.center),
          const Text('保存したら通知時間が追加されるよ。', style: TextStyle(fontSize: 27,color: Colors.white), textAlign: TextAlign.center),
        ],
      ),
      Column(
        children: [
          page6,
          const Text('説明6', style: TextStyle(fontSize: 27,color: Colors.white), textAlign: TextAlign.center),
          const Text('これらの名言がランダムにあなたを励ましてくれます！', style: TextStyle(fontSize: 27,color: Colors.white), textAlign: TextAlign.center),
        ],
      ),
    ];
  }
  @override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: const Text('使用方法'),
    ),
    body: Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Colors.blue, Colors.purple],
        ),
      ),
      child: Column( 
        children: [
          Expanded(
            child: PageView.builder(
              itemCount: instructions.length,
              onPageChanged: (index) {
                setState(() {
                  currentPage = index;
                });
              },
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      instructions[index],
                    ],
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: LinearProgressIndicator(
              value: (currentPage + 1) / instructions.length,
            ),
          ),
        ],
      ),
    ),
  );
}}