# autocommit切断

# usertableはパスワードハッシュ化の影響でインサートできないため下記のように入れてください。
# user_name, user_pass, user_Email
# 'test', 'testdata', 'ttcac@ttc.ac.jp'

# user_name, user_pass, user_Email
# 'メテオ', 'africa', 'paradox@gmail.com'

# user_name, user_pass, user_Email
# 'admin', 'admin', 'admin@gmail.com'

INSERT INTO RICETABLE (rice_name, rice_genre, rice_weight, rice_made,
	rice_since, rice_stock, rice_price)
VALUES('たけだこまち', 'うるち米', 5, '東京都八王子市',
	'2003-07-13 00:00:00', 50, 6400);
	
INSERT INTO RICETABLE (rice_name, rice_genre, rice_weight, rice_made,
	rice_since, rice_stock, rice_price)
VALUES('コシヒカリ', 'うるち米', 10, '新潟県魚沼市',
	'2016-09-20 00:00:00', 72, 8200);

INSERT INTO RICETABLE (rice_name, rice_genre, rice_weight, rice_made,
	rice_since, rice_stock, rice_price)
VALUES('おおまつにしき', 'もち米', 15, '神奈川県横須賀市',
	'2023-11-01 00:00:00', 120, 9600);

INSERT INTO RICETABLE (rice_name, rice_genre, rice_weight, rice_made,
	rice_since, rice_stock, rice_price)
VALUES('おおまつにしき', 'もち米', 10, '神奈川県横須賀市',
	'2023-11-01 00:00:00', 80, 6800);

INSERT INTO RICETABLE (rice_name, rice_genre, rice_weight, rice_made,
	rice_since, rice_stock, rice_price)
VALUES('おおまつにしき', 'もち米', 5, '神奈川県横須賀市',
	'2023-11-01 00:00:00', 150, 3600);

INSERT INTO RICETABLE (rice_name, rice_genre, rice_weight, rice_made,
	rice_since, rice_stock, rice_price)
VALUES('ジャスミンライス', 'タイ米', 20, '新潟県上越市',
	'2022-06-08 00:00:00', 275, 12000);

INSERT INTO RICETABLE (rice_name, rice_genre, rice_weight, rice_made,
	rice_since, rice_stock, rice_price)
VALUES('かしわき', '無精米', 15, '石川県金沢市',
	'2020-09-26 00:00:00', 180, 6300);

# user_id, useraddress_receiver, useraddress_postcode,
	useraddress_state_city, useraddress_street
# 1, '石内遼', '231-0821', '神奈川県横浜市中区本牧大里町', '平茸荘962-22134'

# user_id, useraddress_receiver, useraddress_postcode,
	useraddress_state_city, useraddress_street
# 2, '光宙', '111-0032', '東京都台東区浅草', '舞茸ビル2-3-1'

# user_id, useraddress_receiver, useraddress_postcode,
	useraddress_state_city, useraddress_street
# 3, 'admin', '100-0002', '東京都千代田区千代田', '1番1号'

INSERT INTO CARDTABLE (user_id, card_holdername, card_number,
	card_validity, card_securitycode)
VALUES(1, 'SASAKI KOJIRO', '1111222233334444', '2028-10-31', '878');

INSERT INTO CARTTABLE (user_id, rice_id, cart_quantity)
VALUES(1, 1, 3);

INSERT INTO CARTTABLE (user_id, rice_id, cart_quantity)
VALUES(1, 6, 2);

INSERT INTO CARTTABLE (user_id, rice_id, cart_quantity)
VALUES(2, 6, 10);

INSERT INTO CARTTABLE (user_id, rice_id, cart_quantity)
VALUES(2, 6, 20);

INSERT INTO CARTTABLE (user_id, rice_id, cart_quantity)
VALUES(2, 7, 5);

INSERT INTO ORDERTABLE (user_id, rice_id, order_amount)
VALUES(1, 1, 19200);

INSERT INTO ORDERTABLE (user_id, rice_id, order_amount)
VALUES(1, 6, 24000);

INSERT INTO ORDERTABLE (user_id, rice_id, order_amount)
VALUES(2, 6, 120000);

INSERT INTO ORDERTABLE (user_id, rice_id, order_amount)
VALUES(2, 7, 31500);

INSERT INTO ORDERDETAILSTABLE (order_id, rice_id, order_quantity,
	order_amount, rice_name, rice_price)
VALUES(1, 1, 3, 19200, 'たけだこまち', 6400);

INSERT INTO ORDERDETAILSTABLE (order_id, rice_id, order_quantity,
	order_amount, rice_name, rice_price)
VALUES(1, 6, 2, 24000, 'ジャスミンライス', 12000);

INSERT INTO ORDERDETAILSTABLE (order_id, rice_id, order_quantity,
	order_amount, rice_name, rice_price)
VALUES(2, 6, 10, 120000, 'ジャスミンライス', 12000);

INSERT INTO ORDERDETAILSTABLE (order_id, rice_id, order_quantity,
	order_amount, rice_name, rice_price)
VALUES(2, 7, 5, 31500, 'かしわき', 6300);

INSERT INTO REVIEWTABLE (user_id, rice_id, review_comment, review_star)
VALUES(1, 1, 'なんか白くておいしかったかも～', 4);

INSERT INTO REVIEWTABLE (user_id, rice_id, review_comment, review_star)
VALUES(1, 6, '安い割にコメがふっくらしていて美味しかった！また買いたいと思います！', 5);

INSERT INTO REVIEWTABLE (user_id, rice_id, review_comment, review_star)
VALUES(1, 6, '米がパラパラしててチャーハンにいいね。こっちに乗り換えようかなって思った。定期的に買おうかな', 5);

INSERT INTO REVIEWTABLE (user_id, rice_id, review_comment, review_star)
VALUES(2, 7, 'ちょっと苦みが強すぎるかも。でも奥深い味だった', 3);
