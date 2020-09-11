#!/bin/bash
###############################################################################################
# スクリプト名称：APP Precompile検知/実行スクリプト
# 作成日：2020/09/11
# 更新日：
#		：2020/00/00 ・
# メモ	：
# 機能	：2020/09/11 ・Precompile対象ファイルがコミット対象になっていた場合、
#                      precompileを実行して、git push を実行
###############################################################################################

#######################################################
# ローカル変数指定
#######################################################
APPPATH="~/Desktop/work/Japanizer"    # application path
CPATH=`pwd`
ASSETSPATH="${APP_PATH}/app/assets"
PUSHFILE="${APP_PATH}/gitpush.txt"     # git status結果内容ファイル
CBRANCH=`git branch | grep "*"`

#######################################################
## 実行時branchがmasterの場合処理をキャンセル
#######################################################
if [ $CBRANCH = "master" ]; then
  echo "現在のブランチがmasterの為処理をキャンセルします。"
  exit 1
fi

## Precompile 実行
if [ `cd ${APP_PATH} | git status | grep $ASSETSPATH` ]; then
  docker compose run --rm rails assets:precompile RAILS_ENV=production
  while ps | grep "docker compose run --rm rails assets:precompile" | cut -c -5 ; do sleep 60; done; echo "end"
fi

## コミット対象ファイルが残っていれば削除
if [ -e $PUSHFILE ]; then
  rm $PUSHFILE
fi

## git 処理(add-commit-push)
cat `git status | grep modified | cut -c 14- | tr "\n" " "` >> $PUSHFILE
git add $PUSHFILE
git commit $PUSHFILE -m "[add] precompile実行ファイル"
git push origin $CBRANCH

cd $CPATH
