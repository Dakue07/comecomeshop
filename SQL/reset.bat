REM プログラムのコードを非可視状態にする

@echo off


REM MySQLのディレクトリ

set MYSQLPATH=C:\Program Files\MySQL\MySQL Server 8.0\bin\


REM 接続先情報

set DB_NAME=orcl

set PASS=comecomeshoppass
set USER_ID=root
set OPTION=--default-character-set=utf8


REM スクリプト実行

"%MYSQLPATH%mysql.exe" %OPTION%  %DB_NAME% -u %USER_ID% -p%PASS%< drop.sql
"%MYSQLPATH%mysql.exe" %OPTION%  %DB_NAME% -u %USER_ID% -p%PASS%< create.sql@echo off