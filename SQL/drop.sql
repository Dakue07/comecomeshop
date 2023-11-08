# autocommitの切断

BEGIN;


# データベースの選択

CONNECT orcl


# 初期化のためのテーブル削除 基本的にはoracleと変更はないが
# cascadeが意味をなさないのとIF EXISTS(存在していたら削除)は異なる点。

DROP TABLE IF EXISTS ReviewTable;
DROP TABLE IF EXISTS OrderedTable;
DROP TABLE IF EXISTS CartTable;
DROP TABLE IF EXISTS UserInfoTable;
DROP TABLE IF EXISTS RiceTable;
DROP TABLE IF EXISTS UserTable;


# 管理ユーザーに接続しなおし。

quit
mysql -u root -p
comecomeshoppass


# autocommit切断

BEGIN;


# comeユーザーの削除

DROP USER come;