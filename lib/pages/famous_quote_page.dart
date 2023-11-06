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
  Tweet('Walt Disney', 'uolruto.png', '勝者と敗者の違いはたいていの場合、やめないことである。', ),
  Tweet('Muhammad Ali', 'Muhammad Ali.png', "1日1日を無駄に消費せず、毎日を価値あるものにせよ", ),
  Tweet('Dorian Yates', 'Dorian Yates.png', '拳銃を突きつけて「あと2回やれ」と言ったらどうする？死に物狂いでやるだろう？それが追い込むということだ', ),
  Tweet('Jane Fonda,', 'Jane Fonda.png', 'NoPain,NoGain', ),
  Tweet('林修', '林修.png', '1カ月頑張れるかどうかで人生が変わる。1カ月頑張れる人は、1年頑張れる。1年頑張れる人は、一生頑張れる。', ),
  Tweet('Thomas Carlyle（イギリスの思想家)', 'Thomas Carlyle.png', '天才とは、無限に努力できる能力のことである', ),
  Tweet('Benjamin Franklin', 'Benjamin Franklin.png', '最も高い利息が得られる投資、それは知識への投資である。', ),
  Tweet('碇シンジ', 'ikarisinji.png', '逃げちゃダメだ、逃げちゃダメだ、逃げちゃダメだ！', ),
  Tweet('範馬勇次郎', '範馬勇次郎.png', '何を前にし―、何を食べているのか意識しろ それが命喰う者に課せられた責任、義務と知れ', ),
  Tweet('マイト・ガイ', 'maitogai.png', '自分を信じない奴なんかに努力する価値はない！！！', ),
  Tweet('ナラ・シカマル', 'ナラシカマル.png', 'このまま逃げて筋を通さねえまま生きていくようなそういうめんどくせー、生き方したしたくねーんすよ', ),
  Tweet('うちは・フガク', 'utiha.png', '考え方は違ってもお前を誇りに思うお前は本当に優しい子だ・・・', ),
  Tweet('ドクタークレハ', 'kureha.png', '優しいだけじゃ人は救えないんだ!', ),
  Tweet('マーシャル・D・ティーチ', 'マーシャルDティーチ.png', '人の夢は!終わらねェ!', ),
  Tweet('鋼の錬金術師', 'hagaren.png', '痛みを伴わない教訓には意義がない。人は何かの犠牲なしには何も得ることはできないのだから', ),
  Tweet('イエス・キリスト', 'kirisuto.png', 'もとめよ、さらばあたえられん。', ),
  Tweet('ボンちゃん', 'bonkure.png', '命を賭けて友達を迎えに行く友達を...見捨てておめェら明日食う飯が美味ェかよ！！！！',),
  Tweet('フランス皇帝 ナポレオン・ボナパル', 'naporeon.png', '余の辞書に不可能という言葉はない。', ),
  Tweet('ウソップ', 'usoppu.png', '今ここで全力で戦わなかった俺に、あいつらと全力で笑い合っていいはずがねえ！',),
  Tweet('田中龍之介', 'tanaka.png', 'ところで平凡な俺よ、下を向いている暇はあるのか', ),
  Tweet('孫悟空', 'goku.png', '無理とわかっていてもやんなきゃなんねー時だってあるんだぁーー！！', ),
  Tweet('荒井一市', 'arai.png', 'この先理不尽なこともいっぱいあるだろけどよ結局お前が自分でなんとかするしかねーんだよ', ),
  Tweet('駒野勉', 'tutomu.png', 'やりたいことを思いっきりやるためには、やりたくないことも思いっきりやんなきゃいけないんだよ', ),
  Tweet('南波六太', 'mutta.png', '俺の敵は大体俺です', ),
  Tweet('南波六太', 'mutta.png', '本気の失敗には価値がある', ),
  Tweet('南波六太', 'mutta.png', 'グーみたいな奴がいて、チョキみたいな奴もいて、パーみたいな奴もいる、誰が一番強いか答えを知ってる奴はいるか？', ),
  Tweet('美輪明宏', 'miwa.png', '苦しかったこと、悲しかったことが、いつか必ず花開く時が来る。辛いこと、悲しいことは幸せになるための必要事項。', ),
  Tweet('フロイド・メイウェザー', 'mei.png', 'お前らが休んでいるとき、俺は練習している。お前らが寝ているとき、俺は練習している。', ),
  Tweet('マニー・パッキャオ', 'mani.png', '自分のためではなく、国の威信のために戦う', ),
  Tweet('タイガーウッズ', 'taiga.png', '他人の期待に耳を傾けてはいけない。自分の人生を生き、自分の期待に応えるのだ。', ),
  Tweet('大山倍達', '大山倍達.png', '正義なき力は無能なり。力なき正義も無能なり。', ),
  Tweet('E班長:大槻', 'hantyo.png', '今日をがんばった者、今日をがんばり始めた者にのみ、明日が来るんだよ', ),
  Tweet('鴨川源二', 'kamo.png', '努力した者が全て報われるとは限らんしかし！成功した者は皆すべからく努力しておる！！', ),
  Tweet('銀の匙', 'gin.png', ' 君の人生は教科書に全部書いてあんのかい？', ),
  Tweet('無免ライダー', 'mumen.png', '勝てる勝てないじゃなく ここで俺は お前に立ち向かわなくちゃいけないんだ！', ),
  Tweet('ゲーテ', 'gete.png', '急がず休まず', ),
  Tweet('シャンフォール（作家）', 'gete.png', '機会が二度扉を叩くなどとは考えるな。', ),
  Tweet('アルベルト・アインシュタイン', 'ain.png', '想像力は知識よりも重要である。', ),
  Tweet('古代ローマの歴史家 リヴィウス', 'rivi.png', '遅くとも、何もやらないよりは、やるのがよろしい。', ),
  Tweet('劇作家 ウィリアム・シェイクスピア', 'syeiku.png', '逆境も考え方によっては素晴らしいもの。', ),
  Tweet('ギル・アメリオ', 'giru.png', '自分の力でどうにもならないことは、心配しても意味がない。', ),
  Tweet('発明家 スティーブンソン', 'suteli.png', '我々の目的は成功ではなく、失敗にたゆまずして進むことである。', ),
  Tweet('川上量生（ニコニコ創業者）', 'kawa.png', 'チャンスがあるのに行動しないことで終わってしまうのは惜しい', ),
  Tweet('マーク・ザッカーバーグ', 'mark.png', '最大のリスクは、リスクを取らないことだ', ),
  Tweet('ナイチンゲール', 'naitin.png', 'あなた方は進歩し続けない限りは、退歩していることになるのです', ),
  Tweet('孔子', 'kosi.png', '人生は単純なものなのに、我々が複雑にしようとしているのです', ),
  Tweet('パブロ・ピカソ', 'pikaso.png', '行動がすべての成功への基本的な鍵である。', ),
  Tweet('トーマス・エジソン', 'ejison.png', '失敗なんかしちゃいない。うまくいかない方法を一万通り見つけただけだ。', ),
  Tweet('ウォルト・ディズニー', 'uolruto.png', '夢見ることができれば、それは実現できる。', ),
  Tweet('リオネル・メッシ', 'messi.png', '努力すれば報われる？そうじゃないだろ。報われるまで努力するんだ', ),
  Tweet('ジョン・ウッデン', 'jon.png', '1日ずつ、人生最高の日にしよう。', ),
  Tweet('ソクラテス', 'sokuratesu.png', '簡単すぎる人生に、生きる価値などない。', ),
  


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
      child: Image.asset('assets/images/${model.iconUrl}'),
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

