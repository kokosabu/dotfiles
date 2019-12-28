export LANG=ja_JP.UTF-8
HISTFILE=$HOME/.zsh-history
HISTSIZE=100000
SAVEHIST=100000

export EDITOR=vim
export PATH=\
:$PATH\
:$HOME/bin\
:$HOME/android-sdk-linux_x86_r07/tools

case ${OSTYPE} in
  darwin*)
    # ここに Mac 向けの設定
    PATH=$PATH:/usr/local/opt/openssl@1.1/bin
    PATH=$PATH:/usr/local/opt/sqlite/bin
    PATH=$PATH:/usr/local/opt/gettext/bin
    PATH=$PATH:/usr/local/opt/icu4c/bin
    PATH=$PATH:/usr/local/opt/icu4c/sbin
    export PATH
    ;;
  linux*)
    # ここに Linux 向けの設定
    ;;
esac

export LD_LIBRARY_PATH=\
:$LD_LIBRARY_PATH\
:/usr/local/lib

export GTEST_COLOR=1

## 補完機能の強化
autoload -U compinit
compinit

## コアダンプサイズを制限
#limit coredumpsize 102400

## 出力の文字列末尾に改行コードが無い場合でも表示
unsetopt promptcr

## 色を使う
setopt prompt_subst

## ビープを鳴らさない
setopt nobeep

## 内部コマンド jobs の出力をデフォルトで jobs -l にする
setopt long_list_jobs

## 補完候補一覧でファイルの種別をマーク表示
setopt list_types

## サスペンド中のプロセスと同じコマンド名を実行した場合はリジューム
setopt auto_resume

## 補完候補を一覧表示
setopt auto_list

## 直前と同じコマンドをヒストリに追加しない
setopt hist_ignore_dups

## cd 時に自動で push
#setopt autopushd

## 同じディレクトリを pushd しない
setopt pushd_ignore_dups

## ファイル名で #, ~, ^ の 3 文字を正規表現として扱う
setopt extended_glob

## TAB で順に補完候補を切り替える
setopt auto_menu

## zsh の開始, 終了時刻をヒストリファイルに書き込む
setopt extended_history

## =command を command のパス名に展開する
setopt equals

## --prefix=/usr などの = 以降も補完
setopt magic_equal_subst

## ヒストリを呼び出してから実行する間に一旦編集
setopt hist_verify

# ファイル名の展開で辞書順ではなく数値的にソート
setopt numeric_glob_sort

## 出力時8ビットを通す
setopt print_eight_bit

## ヒストリを共有
setopt share_history

## 補完候補のカーソル選択を有効に
zstyle ':completion:*:default' menu select=1

## 補完候補の色づけ
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

## ディレクトリ名だけで cd
setopt auto_cd

## カッコの対応などを自動的に補完
setopt auto_param_keys

## ディレクトリ名の補完で末尾の / を自動的に付加し、次の補完に備える
setopt auto_param_slash

## スペルチェック
#setopt correct

xset b off
bindkey -e
alias emacs="emacs -nw"
alias gosh="rlwrap -b '(){},#\"; ' gosh"
alias etags="/usr/local/bin/ctags -e"
alias ntpdate="sudo ntpdate ntp1.jst.mfeed.ad.jp"
alias mosh_test="make all-tests.scm; ./mosh -5 all-tests.scm"

# GO
export GOROOT=$HOME/go
export GOOS=linux
export GOARCH=386
export GOBIN=$HOME/bin

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"
