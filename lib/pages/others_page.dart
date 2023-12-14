import 'package:flutter/material.dart';

class OthersPage extends StatelessWidget {
  const OthersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('使用方法'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(  
            child: ListView(
              children: const <Widget>[
                Text('Item 1'),
                Text('Item 1'),
                Text('Item 1'),
                Text('Item 1'),
                Text('Item 1'),
                Text('Item 1'),
                Text('Item 1'),
              
              ],
            ),
          ),
        ],
      ),
    );
  }
}
