import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class OthersPage extends StatelessWidget {
  // コンパイル時定数ではないため、constキーワードを削除
  final Uri url = Uri.parse('https://forms.gle/QyrNd6jFdikaPaLb7'); 

  // コンストラクタからconstを削除
  OthersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('その他'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(  
            child: ListView(
              children: <Widget>[
                 Padding(
                  padding: const EdgeInsets.only(top: 50.0),
                  child:Center(
                  child: ElevatedButton(
                    onPressed: () => _launchUrl(url), 
                    child: const Text('お問い合わせ'),
                  ),
                ),
                 )
              ],
            ),
          ),
      
        ],
      ),
    );
  }

  Future<void> _launchUrl(Uri url) async {
    if (!await launchUrl(url)) {
      throw 'URLを開けませんでした: $url';
    }
  }
}
