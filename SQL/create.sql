# ユーザーの作成 ユーザー名→ホスト名とパスワードをそれぞれ'で囲み指定

CREATE USER come IDENTIFIED BY 'come';


# 基本的な機能に関する全ての権限の付与

GRANT ALL PRIVILEGES ON * . * TO come;


# comeユーザーへの切り替え 切断と接続

quit
mysql -u come -p
come


# カレントデータベースを指定

CONNECT orcl


# ユーザーテーブルの作成 1行目はもし存在していなければ作成としてエラーの要因を排除
# usertable以降はoracleと大して違いはない。
# SEQUENCEがないため自動で増えるようにAUTO_INCREMENTを付与

CREATE TABLE IF NOT EXISTS UserTable
(user_id int PRIMARY KEY AUTO_INCREMENT,
 user_name varchar(40) NOT NULL,
 user_pass varchar(40) NOT NULL,
 CONSTRAINT uq_user_name UNIQUE(user_name)
);


# 以下同様にテーブルの作成をしていく

CREATE TABLE IF NOT EXISTS RiceTable
(rice_id int PRIMARY KEY AUTO_INCREMENT,
 rice_name varchar(500) NOT NULL,
 rice_genre varchar(500) NOT NULL,
 rice_weight int NOT NULL,
 rice_made varchar(500) NOT NULL,
 rice_image mediumblob,
 rice_since timestamp NOT NULL,
 rice_stock int NOT NULL,
 rice_price int NOT NULL,
 CONSTRAINT uq_rice_name UNIQUE(rice_name),
 CONSTRAINT ck_rice_stock CHECK(rice_stock >= 0)
);

CREATE TABLE UserInfoTable
(user_id int,
 userinfo_address varchar(1000) NOT NULL,
 userinfo_card int NOT NULL,
 CONSTRAINT uq_userinfo_card UNIQUE(userinfo_card)
);

CREATE TABLE CartTable
(user_id int,
 rice_id int,
 FOREIGN KEY fk_cart_userid (user_id) REFERENCES UserTable(user_id),
 FOREIGN KEY fk_cart_riceid (rice_id) REFERENCES RiceTable(rice_id)
);

CREATE TABLE OrderedTable
(user_id int,
 rice_id int,
 ordered_amount int NOT NULL,
 ordered_time timestamp DEFAULT CURRENT_TIMESTAMP,
 FOREIGN KEY fk_ordered_userid (user_id) REFERENCES UserTable(user_id),
 FOREIGN KEY fk_ordered_riceid (rice_id) REFERENCES RiceTable(rice_id)
);

CREATE TABLE ReviewTable
(user_id int,
 rice_id int,
 review_comment varchar(600),
 review_star int NOT NULL,
 FOREIGN KEY fk_review_userid (user_id) REFERENCES UserTable(user_id),
 FOREIGN KEY fk_review_riceid (rice_id) REFERENCES RiceTable(rice_id),
 CONSTRAINT ck_high_review_star CHECK(review_star <= 5),
 CONSTRAINT ck_low_review_star CHECK(review_star >= 1)
);