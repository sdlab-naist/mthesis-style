# mthesis-style
修論のTeXのスタイル これをforkして書き始めると良い

# VSCodeのおすすめ設定
MacでもWindowsでも使える設定だが、TeXLiveなどのTeXディストリビューションはインストール済みの前提とする。

## LaTeX Workshopを入れる
VSCodeのLaTeXプラグインのLaTeX Workshopをインストールする。

`Win : ファイル > 基本設定 > 設定`

`Mac : Code > 基本設定 > 設定 `

で `setting.json` を開く。 `Ctrl + ,`でも開く。
以下のように書く。
```
"latex-workshop.latex.tools": [
    {
      "command": "ptex2pdf",
      "args": ["-l", "-ot", "-kanji=utf8 -synctex=1", "%DOC%"],
      "name": "ptex2pdf"
    },
    {
      "command": "pbibtex",
      "args": ["%DOCFILE%", "-kanji=utf8"],
      "name": "pbibtex"
    }
  ],
  "latex-workshop.latex.recipes": [
    {
      "name": "toolchain",
      "tools": [
        "ptex2pdf",
        "pbibtex",
        "ptex2pdf",
        "ptex2pdf"
      ]
    }
  ],
  "latex-workshop.view.pdf.viewer": "tab",
  "latex-workshop.chktex.enabled": false
```
## latex-workshop.latex.tools

昔はlatex-workshop.latex.toolchainという名前だったらしい。
参考文献をbibtexで書く場合、

- texファイルのコンパイル
- bibtexファイルのコンパイル
- texファイルのコンパイル
- texファイルのコンパイル

と4段階の操作が必要らしい。毎度4段階も操作をしないといけないのはめんどくさいのでこれらの一連の操作を一発でやってくれる君を作る。ここのtoolsでは一発でやってくれる君に渡す操作の名前とコマンドを登録する。ちなみにTeXで目次を出すのは2回コンパイルが必要だが、それもこの一連の操作でカバーできる。

## latex-workshop.latex.recipes
こいつが一発でやってくれる君。nameはなんでもいい。toolsに4段階の操作を登録する。

## latex-workshop.view.pdf.viewer
できたpdfを表示する方法。tabを指定するとVSCodeのタブで表示される。ブラウザに出すこともできる。個人的に好きなのは、タブで表示するとエディタが右側に分割されてpdfが表示されるので、できたタブを左側に移動させるやり方。

## latex-workshop.chktex.enabled
chktexっていうのがTeXの構文チェックをやってくれる君なのだが、日本語にやたら警告を出してきてウザいので無効化した。

# ビルドのやり方
基本的にtexファイルを保存したらrecipesの通りにビルドしてくれる。保存時以外にビルドしたい場合は 'Ctrl + Alt + B'、pdf表示は 'Ctrl + Alt + V'。できない場合はショートカット設定が必要かも。F1で `Build Latex Project` とか `View PDF File in new tab` とか呼び出すのでもできる。

# (おまけ)bibtexのTips
LaTeX Workshopにbibtexのリンターは入ってないっぽいのでほしいなら別途入れる。
## 自分で書くのダルいよね
参考文献をbibtexで書く場合、Google Scholarで出てくるようなものであれば、検索結果の`''`のマークをクリックしたらbibtexフォーマットで予め情報が書かれているものが手に入る。
## 英語タイトルで大文字が小文字になる
タイトルを`{{Some Title}}`とか`””Some Title””`とか2重で囲むとちゃんと大文字が反映される。
## 著者が複数いる場合
jsonとかに慣れてるとハマりやすいのが著者の区切り方。`,`ではなく`and`で区切る。`,`は氏と名の区切りで使う。
