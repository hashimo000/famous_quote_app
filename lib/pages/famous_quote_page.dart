import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:math';

// ツイート
// final Shader _linearGradient = LinearGradient(
//   colors: <Color>[
//     Color(0xff1A2980),
//     Color(0xff26D0CE),
//   ],
// ).createShader(
//   Rect.fromLTWH(
//     0.0,
//     0.0,
//     250.0,
//     70.0,
//   ),
// );

class Tweet {
  final String userName;
  final String iconUrl;
  final String text;
  

  Tweet(this.userName, this.iconUrl, this.text,);
}

// 適当なモデル
final models = [ /* あなたのモデルのリスト */ 
  Tweet('ルフィ', 'icon1.png', '海賊王におれはなる！', ),
  Tweet('Messi', 'icon2.png', 'GOAT', ),
  Tweet('ナミ', 'icon3.png', 'もう背中向けられないじゃないっ！', ),
  Tweet('ウソップ', 'icon4.png', 'お前らの”伝説のヒーロー”になってやる！', ),
  Tweet('サンジ', 'icon5.png', 'たとえ死んでもおれは女は蹴らん・・・！', ),
  Tweet('チョッパー', 'icon6.png', '人間ならもっと自由だ！', ),
  Tweet('ビビ', 'icon7.png', 'もう一度仲間と呼んでくれますか!?', ),
  Tweet('ロビン', 'icon8.png', '生ぎたいっ！', ),
  Tweet('フランキー', 'icon9.png', '存在することは罪にはならねェ！', ),
  Tweet('ブルック', 'icon10.png', '男が一度・・・必ず帰ると言ったのだから！', ),
  Tweet('ジンベイ', 'icon11.png', '失ったものばかり数えるな！', ),
  Tweet('シャンクス', 'icon1.png', 'この帽子をお前に預ける', ),
  Tweet('ヒルルク', 'icon2.png', '違う!…人に忘れられた時さ…!', ),
  Tweet('ドクタークレハ', 'icon3.png', '優しいだけじゃ人は救えないんだ!', ),
  Tweet('ティーチ', 'icon4.png', '人の夢は!終わらねェ!', ),
  Tweet('ガンフォール', 'icon5.png', '人の生きるこの世界に“神”などおらぬ!', ),
  Tweet('ボンクレー', 'icon6.png', '理由なんざ他にゃいらねェ!', ),
  Tweet('イワンコフ', 'icon7.png', '“奇跡”ナメるんじゃないよォ!', ),
  Tweet('ニューゲート', 'icon8.png', 'バカな息子をそれでも愛そう・・・',),
  Tweet('エース', 'icon9.png', '愛してくれて・・・ありがとう', ),
  Tweet('ロー', 'icon10.png', '取るべきイスは…必ず奪う!',),
  Tweet('サボ', 'icon11.png', '以後ルフィのバックにはおれがついてる!', ),
  Tweet('バルトロメオ', 'icon1.png', 'この子分盃!勝手に頂戴いたしますだべ!', ),
];

Tweet getRandomTweet() {
    final random = Random();
    return models[random.nextInt(models.length)];
  }
  Tweet randomTweet = getRandomTweet();
class Famous_Quote_Page extends StatelessWidget {
  const Famous_Quote_Page({Key? key}) : super(key: key);

  Widget modelToWidget(Tweet model) {
    // 以前のmodelToWidget関数の内容...

    // ... ここにその内容を追加する
     final icon = Container(
    margin: const EdgeInsets.all(20),
    width: 60,
    height: 60,
    // 画像を丸くする
    child: ClipRRect(
      borderRadius: BorderRadius.circular(30.0),
      child: Image.asset('assets/images/kkrn_icon_user_1.png'),
    ),
  );

  // 名前と時間
  final metaText = Container(
    padding: const EdgeInsets.all(6),
    height: 40,
    alignment: Alignment.centerLeft,
    child: Text(
      '${model.userName}   ',
      style: const TextStyle(color: Colors.white),
    ),
  );
  final text = Container(
    padding: const EdgeInsets.all(8),
    alignment: Alignment.centerLeft,
    child: Text(
      model.text,
      style: const TextStyle(fontWeight: FontWeight.bold,color: Colors.white),
    ),
  );
      return Container(
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        color: Colors.transparent,
      ),
      width: double.infinity,
      height: 120,
      child: Row(
        children: [
          icon,
          Expanded(
            child: Column(
              children: [
                metaText,
                text,
              ],
            ),
          ),
        ],
      ),
      );
 }
  

  @override
  Widget build(BuildContext context) {
    final list = ListView.builder(
      itemCount: models.length,
      itemBuilder: (c, i) => modelToWidget(models[i]),
    );

    return Scaffold(
      backgroundColor: Colors.black,
      
      body: Container(
                decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: [0.1, 0.8,],
            colors: [
               // Replace with your start color
               Color(0xff6033b3), Color(0xff9c27b0)
            ],
          ),
        ),

        child:list
        ),
    );
  }
}

