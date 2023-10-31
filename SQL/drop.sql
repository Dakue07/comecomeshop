# 初期化のためのテーブル削除 基本的にはoracleと変更はないが
# cascadeが意味をなさないのとIF EXISTS(存在していたら削除)は異なる点。

DROP TABLE ReviewTable IF EXISTS;
DROP TABLE OrderedTable IF EXISTS;
DROP TABLE CartTable IF EXISTS;
DROP TABLE UserInfoTable IF EXISTS;
DROP TABLE RiceTable IF EXISTS;
DROP TABLE UserTable IF EXISTS;


# 管理ユーザーに接続しなおし。

quit
mysql -h  -u  -p
# この行にパスワード


# comeユーザーの削除

DROP USER 'come'@'localhost';