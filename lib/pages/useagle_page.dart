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
  final List<String> instructions = [
    'Step 1: Do this',
    'Step 2: Do that',
    'Step 3: Do something else',
    // Add as many steps as you need
  ];

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
                      Text(
                        instructions[index],
                        style: TextStyle(fontSize: 24),
                        textAlign: TextAlign.center,
                      ),
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
