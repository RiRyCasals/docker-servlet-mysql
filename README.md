# 使い方

## doker compose

1. `docker compose up -d` でコンテナの起動
2. `docker compose stop` でコンテナの停止

Dockerfileを書き換えた場合 `docker compose up -d --build` でコンテナを再ビルドして起動できる．

## コンパイル

1. コンテナが起動した状態で `docker exec -it tomcat_server bash` を行いtomcat用コンテナ内のbashに入る
2. `sh webapps/Sample/WEB-INF/compile.sh` でコンパイルを行う（サンプル以外は適宜パスなど変更）
3. `exit` で bash を終了する

### コンパイル時の注意

コンパイルオプションで `-cp .jarのパス` を指定する必要性がある．

サンプルのコンパイルについては `webapps/compile.sh` を参照


# docker-compose.yaml について

`dokcer-compose.yaml` 内の `db: environment: ` 以下にて，MySQLの

- データベース名
- ユーザ名
- ユーザパスワード
- ルートパスワード

を設定してあります．

お好みで変更してください．


# ディレクトリ構成

ローカル環境の `webapps` ディレクトリが tomcat用コンテナの `/usr/local/tomcat/webapps` にボリュームしてある．

`webapps/Sample` が基本的なディレクトリ構成になるため参考にされたし．


# DBのテーブル作成について

## init.sql

初回コンテナ起動時のテーブル作成やデータ挿入用のSQLを記入できる．

## interactive

1. `docker exec -it mysql_server bash` でMySQL用コンテナ内のbashに入る
2. `mysql -u root -p` でパスワードを打ち込み対話型モードに入る
