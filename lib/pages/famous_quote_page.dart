import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:math';


class Tweet {
  final String userName;
  final String iconUrl;
  final String text;
  

  Tweet(this.userName, this.iconUrl, this.text,);
}

// 適当なモデル
final models = [ /* あなたのモデルのリスト */ 
  Tweet('Walt Disney', 'icon1.png', '勝者と敗者の違いはたいていの場合、やめないことである。', ),
  Tweet('Muhammad Ali', 'icon2.png', "1日1日を無駄に消費せず、毎日を価値あるものにせよ", ),
  Tweet('Dorian Yates', 'icon3.png', '拳銃を突きつけて「あと2回やれ」と言ったらどうする？死に物狂いでやるだろう？それが追い込むということだ', ),
  Tweet('Jane Fonda,', 'icon4.png', 'NoPain,NoGain', ),
  Tweet('林修', 'icon5.png', '1カ月頑張れるかどうかで人生が変わる。1カ月頑張れる人は、1年頑張れる。1年頑張れる人は、一生頑張れる。', ),
  Tweet('Thomas Carlyle（イギリスの思想家)', 'icon6.png', '天才とは、無限に努力できる能力のことである', ),
  Tweet('Benjamin Franklin', 'icon7.png', '最も高い利息が得られる投資、それは知識への投資である。', ),
  Tweet('碇シンジ', 'icon8.png', '逃げちゃダメだ、逃げちゃダメだ、逃げちゃダメだ！', ),
  Tweet('範馬勇次郎', 'icon9.png', '何を前にし―、何を食べているのか意識しろ それが命喰う者に課せられた責任、義務と知れ', ),
  Tweet('スティーブン・スティール', 'icon10.png', '真の失敗とはッ！ 開拓の心を忘れ！ 困難に挑戦する事に無縁のところにいる者たちの事をいうのだッ！', ),
  Tweet('マイト・ガイ', 'icon11.png', '自分を信じない奴なんかに努力する価値はない！！！', ),
  Tweet('ナラ・シカマル', 'icon1.png', 'このまま逃げて筋を通さねえまま生きていくようなそういうめんどくせー、生き方したしたくねーんすよ', ),
  Tweet('うちは・フガク', 'icon2.png', '考え方は違ってもお前を誇りに思うお前は本当に優しい子だ・・・', ),
  Tweet('ドクタークレハ', 'icon3.png', '優しいだけじゃ人は救えないんだ!', ),
  Tweet('マーシャル・D・ティーチ', 'icon4.png', '人の夢は!終わらねェ!', ),
  Tweet('鋼の錬金術師', 'icon5.png', '痛みを伴わない教訓には意義がない。人は何かの犠牲なしには何も得ることはできないのだから', ),
  Tweet('ショウ・タッカー', 'icon6.png', '……君のような勘のいいガキは嫌いだよ', ),
  Tweet('イワンコフ', 'icon7.png', '“奇跡”ナメるんじゃないよォ!', ),
  Tweet('ボンちゃん', 'icon8.png', '命を賭けて友達を迎えに行く友達を...見捨てておめェら明日食う飯が美味ェかよ！！！！',),
  Tweet('アルベルト', 'icon9.png', 'やるんだな！？今、ここで！', ),
  Tweet('ウソップ', 'icon10.png', '今ここで全力で戦わなかった俺に、あいつらと同じ船に乗る資格なんてあるはずねぇ！あいつらと全力で笑い合っていいはずがねえ！',),
  Tweet('田中龍之介', 'icon11.png', 'ところで平凡な俺よ、下を向いている暇はあるのか', ),
  Tweet('孫悟空', 'icon1.png', '無理とわかっていてもやんなきゃなんねー時だってあるんだぁーー！！', ),
  Tweet('荒井一市', 'icon1.png', 'この先理不尽なこともいっぱいあるだろけどよ結局お前が自分でなんとかするしかねーんだよ', ),
  Tweet('駒野勉', 'icon1.png', 'やりたいことを思いっきりやるためには、やりたくないことも思いっきりやんなきゃいけないんだよ', ),
  Tweet('南波六太', 'icon1.png', '俺の敵は大体俺です', ),
  Tweet('南波六太', 'icon1.png', '本気の失敗には価値がある', ),
  Tweet('南波六太', 'icon1.png', 'グーみたいな奴がいて、チョキみたいな奴もいて、パーみたいな奴もいる、誰が一番強いか答えを知ってる奴はいるか？', ),
  Tweet('美輪明宏', 'icon1.png', '苦しかったこと、悲しかったことが、いつか必ず花開く時が来る。辛いこと、悲しいことは幸せになるための必要事項。', ),
  Tweet('フロイド・メイウェザー', 'icon1.png', 'お前らが休んでいるとき、俺は練習している。お前らが寝ているとき、俺は練習している。お前らが練習しているときは、当然俺も練習している', ),
  Tweet('マニー・パッキャオ', 'icon1.png', '自分のためではなく、国の威信のために戦う', ),
  Tweet('タイガーウッズ', 'icon1.png', '他人の期待に耳を傾けてはいけない。自分の人生を生き、自分の期待に応えるのだ。', ),
  Tweet('大山倍達', 'icon1.png', '正義なき力は無能なり。力なき正義も無能なり。', ),
  Tweet('E班長:大槻', 'icon1.png', '明日からがんばるんじゃない、今日、今日だけがんばるんだっ。今日をがんばった者、今日をがんばり始めた者にのみ、明日が来るんだよ', ),
  Tweet('鴨川源二', 'icon1.png', '努力した者が全て報われるとは限らんしかし！成功した者は皆すべからく努力しておる！！', ),
  Tweet('銀の匙', 'icon1.png', ' 君の人生は教科書に全部書いてあんのかい？', ),
  Tweet('無免ライダー', 'icon1.png', '勝てる勝てないじゃなく ここで俺は お前に立ち向かわなくちゃいけないんだ！', ),

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
    height: 80,
    // 画像を丸くする
    child: ClipRRect(
      borderRadius: BorderRadius.circular(30.0),
      child: Image.asset('assets/images/kkrn_icon_user_1.png'),
    ),
  );

  // 名前と時間
  final metaText = Container(
    padding: const EdgeInsets.all(6),
    height: 30,
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

