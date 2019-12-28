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
    # ������ Mac ����������
    PATH=$PATH:/usr/local/opt/openssl@1.1/bin
    PATH=$PATH:/usr/local/opt/sqlite/bin
    PATH=$PATH:/usr/local/opt/gettext/bin
    PATH=$PATH:/usr/local/opt/icu4c/bin
    PATH=$PATH:/usr/local/opt/icu4c/sbin
    export PATH
    ;;
  linux*)
    # ������ Linux ����������
    ;;
esac

export LD_LIBRARY_PATH=\
:$LD_LIBRARY_PATH\
:/usr/local/lib

export GTEST_COLOR=1

## �䴰��ǽ�ζ���
autoload -U compinit
compinit

## ��������ץ�����������
#limit coredumpsize 102400

## ���Ϥ�ʸ���������˲��ԥ����ɤ�̵�����Ǥ�ɽ��
unsetopt promptcr

## ����Ȥ�
setopt prompt_subst

## �ӡ��פ��Ĥ餵�ʤ�
setopt nobeep

## �������ޥ�� jobs �ν��Ϥ�ǥե���Ȥ� jobs -l �ˤ���
setopt long_list_jobs

## �䴰��������ǥե�����μ��̤�ޡ���ɽ��
setopt list_types

## �����ڥ����Υץ�����Ʊ�����ޥ��̾��¹Ԥ������ϥꥸ�塼��
setopt auto_resume

## �䴰��������ɽ��
setopt auto_list

## ľ����Ʊ�����ޥ�ɤ�ҥ��ȥ���ɲä��ʤ�
setopt hist_ignore_dups

## cd ���˼�ư�� push
#setopt autopushd

## Ʊ���ǥ��쥯�ȥ�� pushd ���ʤ�
setopt pushd_ignore_dups

## �ե�����̾�� #, ~, ^ �� 3 ʸ��������ɽ���Ȥ��ư���
setopt extended_glob

## TAB �ǽ���䴰������ڤ��ؤ���
setopt auto_menu

## zsh �γ���, ��λ�����ҥ��ȥ�ե�����˽񤭹���
setopt extended_history

## =command �� command �Υѥ�̾��Ÿ������
setopt equals

## --prefix=/usr �ʤɤ� = �ʹߤ��䴰
setopt magic_equal_subst

## �ҥ��ȥ��ƤӽФ��Ƥ���¹Ԥ���֤˰�ö�Խ�
setopt hist_verify

# �ե�����̾��Ÿ���Ǽ����ǤϤʤ�����Ū�˥�����
setopt numeric_glob_sort

## ���ϻ�8�ӥåȤ��̤�
setopt print_eight_bit

## �ҥ��ȥ��ͭ
setopt share_history

## �䴰����Υ������������ͭ����
zstyle ':completion:*:default' menu select=1

## �䴰����ο��Ť�
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

## �ǥ��쥯�ȥ�̾������ cd
setopt auto_cd

## ���å����б��ʤɤ�ưŪ���䴰
setopt auto_param_keys

## �ǥ��쥯�ȥ�̾���䴰�������� / ��ưŪ���ղä��������䴰��������
setopt auto_param_slash

## ���ڥ�����å�
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
