# はじめに
このWebアプリは都道府県と県庁所在地のクイズです。
小学生の子供が、ちょうど都道府県の勉強をしており、自分のプログラムスキルのアウトプットとして、そして子供の勉強に役立てばと思い開発しました。

# クイズの概要と遊び方

## 公開サイト
https://todofuken-quiz.herokuapp.com/

## クイズモード
以下の２つのモードから選べます。
- 1 : 都道府県名から県庁所在地を答える
- 2 : 県庁所在地から県名を答える

## 問題数
１問〜47問まで選べます。
すべての都道府県をシャッフルして、選んだ問題数４択で出題します。

# 工夫した点・チャレンジした点
- なるべくシンプルにクイズ出題に特化した
- 問題の順序や、選択肢の並びをランダムで表示できるようにした
- 今まで扱ったことのなかった、jqueryにトライした。

# 使用した言語、フレームワーク
このアプリは以下の言語、フレームワークで構成されています。
- Ruby on Rails -> DBに格納された都道府県データから、問題を作成します。
- HTML & CSS -> 
- Bootstrap4 -> 画面のUIの省力化のために使用 
- jquery -> 画面上で正誤判定を行うなどの処理に資料

# 更新履歴
## v1.0
- 初期作成
## v1.1
- クイズ内容選択後にワンタップでクイズを開始できるよう変更
- クイズポップアップ画面の改善
  - 押せないボタンは非表示
  - 自分が選択した解答がわかるように色付け
- タイトルとアイコンを表示
- 初期画面の選択肢の単純化