import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
class OthersPage extends StatelessWidget {
   final String url = 'https://qiita.com/advent-calendar/2023/kaiyo-tech';  
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
                Center(
        
          child: Text('お問い合わせ'),
        
      ),
               
              
              ],
            ),
          ),
        ],
      ),
    );
  }
}
