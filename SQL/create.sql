# autocommit切断
SET AUTOCOMMIT = 0;
# ユーザーの作成 ユーザー名→ホスト名とパスワードをそれぞれ'で囲み指定

CREATE USER come IDENTIFIED BY 'come';


# 基本的な機能に関する全ての権限の付与

GRANT ALL PRIVILEGES ON * . * TO come;


# comeユーザーへの切り替え 切断と接続

quit
mysql -u come -p
come


# autocommit切断

SET AUTOCOMMIT = 0;


# カレントデータベースを指定

CONNECT orcl


# ユーザーテーブルの作成 1行目はもし存在していなければ作成としてエラーの要因を排除
# usertable以降はoracleと大して違いはない。
# SEQUENCEがないため自動で増えるようにAUTO_INCREMENTを付与


CREATE TABLE IF NOT EXISTS USERTABLE
(user_id int PRIMARY KEY AUTO_INCREMENT,
 user_name varchar(128) NOT NULL,
 user_pass varchar(128) NOT NULL,
 user_Email varchar(128) NOT NULL,
 CONSTRAINT uq_user_name UNIQUE(user_name)
);


# 以下同様にテーブルの作成をしていく

CREATE TABLE IF NOT EXISTS RICETABLE
(rice_id int PRIMARY KEY AUTO_INCREMENT,
 rice_name varchar(128) NOT NULL,
 rice_genre varchar(128) NOT NULL,
 rice_weight int NOT NULL,
 rice_made varchar(128) NOT NULL,
 rice_image_path varchar(128), 
 rice_since timestamp NOT NULL,
 rice_stock int NOT NULL,
 rice_price int NOT NULL,
 rice_flag boolean DEFAULT false,
 CONSTRAINT ck_rice_stock CHECK(rice_stock >= 0)
);

CREATE TABLE USERADDRESSTABLE
(useraddress_id int PRIMARY KEY AUTO_INCREMENT,
 user_id int,
 useraddress_receiver varchar(100),
 useraddress_postcode char(8) NOT NULL,
 useraddress_state_city varchar(100) NOT NULL,
 useraddress_street varchar(100) NOT NULL,
 FOREIGN KEY fk_useraddress_userid (user_id) REFERENCES USERTABLE(user_id)
 ON DELETE CASCADE
);

CREATE TABLE CARDTABLE (
	card_id int PRIMARY KEY AUTO_INCREMENT,
    user_id int,
    card_holdername varchar(30) NOT NULL,
    card_number char(16) NOT NULL,
    card_validity date NOT NULL,
    card_securitycode char(3) NOT NULL,
    CONSTRAINT uq_card_number UNIQUE(card_number),
    FOREIGN KEY fk_card_userid (user_id) REFERENCES USERTABLE(user_id) ON DELETE CASCADE
);

CREATE TABLE CARTTABLE
(user_id int,
 rice_id int,
 cart_quantity int NOT NULL,
 FOREIGN KEY fk_cart_userid (user_id) REFERENCES USERTABLE(user_id),
 FOREIGN KEY fk_cart_riceid (rice_id) REFERENCES RICETABLE(rice_id)
 ON DELETE CASCADE
);

CREATE TABLE ORDERTABLE
(order_id int PRIMARY KEY AUTO_INCREMENT,
 user_id int,
 rice_id int,
 order_amount int NOT NULL,
 order_time timestamp DEFAULT CURRENT_TIMESTAMP,
 FOREIGN KEY fk_order_userid (user_id) REFERENCES USERTABLE(user_id),
 FOREIGN KEY fk_order_riceid (rice_id) REFERENCES RICETABLE(rice_id)
 ON DELETE CASCADE
);

CREATE TABLE ORDERDETAILSTABLE
(order_id int,
 rice_id int,
 order_quantity int NOT NULL,
 order_amount int NOT NULL,
 rice_name varchar(128) NOT NULL,
 rice_image_path varchar(128), 
 rice_price int NOT NULL,
 FOREIGN KEY fk_orderdetails_orderid (order_id) REFERENCES ORDERTABLE(order_id),
 FOREIGN KEY fk_orderdetails_riceid (rice_id) REFERENCES RICETABLE(rice_id)
 ON DELETE CASCADE
);

CREATE TABLE REVIEWTABLE
(user_id int,
 rice_id int,
 review_comment varchar(600),
 review_star int NOT NULL,
 FOREIGN KEY fk_review_userid (user_id) REFERENCES USERTABLE(user_id)
 ON DELETE CASCADE,
 FOREIGN KEY fk_review_riceid (rice_id) REFERENCES RICETABLE(rice_id)
 ON DELETE CASCADE,
 CONSTRAINT ck_high_review_star CHECK(review_star <= 5),
 CONSTRAINT ck_low_review_star CHECK(review_star >= 1)
);