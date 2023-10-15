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
          Text('1', style: TextStyle(fontSize: 24), textAlign: TextAlign.center),
          page1,
          Text('説明1', style: TextStyle(fontSize: 24), textAlign: TextAlign.center),
        ],
      ),
      Column(
        children: [
          Text('2', style: TextStyle(fontSize: 24), textAlign: TextAlign.center),
          page2,
          Text('説明1', style: TextStyle(fontSize: 24), textAlign: TextAlign.center),
        ],
      ), Column(
        children: [
          Text('3', style: TextStyle(fontSize: 24), textAlign: TextAlign.center),
          page3,
          Text('説明1', style: TextStyle(fontSize: 24), textAlign: TextAlign.center),
        ],
      ), Column(
        children: [
          Text('4', style: TextStyle(fontSize: 24), textAlign: TextAlign.center),
          page4,
          Text('説明1', style: TextStyle(fontSize: 24), textAlign: TextAlign.center),
        ],
      ), Column(
        children: [
          Text('5', style: TextStyle(fontSize: 24), textAlign: TextAlign.center),
          page5,
          Text('説明1', style: TextStyle(fontSize: 24), textAlign: TextAlign.center),
        ],
      ),
      Column(
        children: [
          Text('6', style: TextStyle(fontSize: 24), textAlign: TextAlign.center),
          page6,
          Text('説明1', style: TextStyle(fontSize: 24), textAlign: TextAlign.center),
        ],
      ),
    ];
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Instructions'),
      ),
      body: Column(
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
                        
                      
                      // You might want to add images/icons here
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
    );
  }
}
