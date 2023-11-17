# autocommit切断

# I-NSERT INTO USERTABLE (user_name, user_pass, user_Email)
# VALUES('メテオ', 'africa'
# 	, 'paradox@gmail.com');

INSERT INTO RICETABLE (rice_name, rice_genre, rice_weight, rice_made,
	rice_since, rice_stock, rice_price)
VALUES('たけだこまち', 'うるち米', 5, '東京都八王子市',
	'2003-07-13 00:00:00', 50, 6000);
	
INSERT INTO RICETABLE (rice_name, rice_genre, rice_weight, rice_made,
	rice_since, rice_stock, rice_price)
VALUES('コシヒカリ', 'うるち米', 10, '新潟県魚沼市',
	'2016-09-20 00:00:00', 72, 10000);

INSERT INTO RICETABLE (rice_name, rice_genre, rice_weight, rice_made,
	rice_since, rice_stock, rice_price)
VALUES('おおまつにしき', 'もち米', 15, '神奈川県横須賀市',
	'2023-11-01 00:00:00', 120, 22500);

INSERT INTO RICETABLE (rice_name, rice_genre, rice_weight, rice_made,
	rice_since, rice_stock, rice_price)
VALUES('おおまつにしき', 'もち米', 10, '神奈川県横須賀市',
	'2023-11-01 00:00:00', 80, 16000);

INSERT INTO RICETABLE (rice_name, rice_genre, rice_weight, rice_made,
	rice_since, rice_stock, rice_price)
VALUES('おおまつにしき', 'もち米', 5, '神奈川県横須賀市',
	'2023-11-01 00:00:00', 150, 8500);

INSERT INTO RICETABLE (rice_name, rice_genre, rice_weight, rice_made,
	rice_since, rice_stock, rice_price)
VALUES('ジャスミンライス', 'タイ米', 20, '新潟県上越市',
	'2022-06-08 00:00:00', 275, 19000);

INSERT INTO USERADDRESSTABLE (user_id, useraddress_receiver, useraddress_postcode,
	useraddress_state_city, useraddress_street)
VALUES(1, '石内遼', '231-0821', '神奈川県横浜市中区本牧大里町', '平茸荘962-22134');

INSERT INTO CARDTABLE (user_id, card_holdername, card_number,
	card_validity, card_securitycode)
VALUES(1, 'SASAKI KOJIRO', '1111222233334444', '2028-10-31', '878');

INSERT INTO CARTTABLE (user_id, rice_id, cart_quantity)
VALUES(1, 1, 3);

INSERT INTO CARTTABLE (user_id, rice_id, cart_quantity)
VALUES(1, 6, 2);

INSERT INTO ORDERTABLE (user_id, rice_id, order_amount)
VALUES(1, 1, 18000);

INSERT INTO ORDERTABLE (user_id, rice_id, order_amount)
VALUES(1, 6, 38000);

INSERT INTO ORDERDETAILSTABLE (order_id, rice_id, order_quantity,
	order_amount, rice_name, rice_price)
VALUES(1, 1, 3, 18000, 'たけだこまち', 6000);

INSERT INTO ORDERDETAILSTABLE (order_id, rice_id, order_quantity,
	order_amount, rice_name, rice_price)
VALUES(1, 6, 2, 38000, 'ジャスミンライス', 19000);

INSERT INTO REVIEWTABLE (user_id, rice_id, review_comment, review_star)
VALUES(1, 1, 'なんか白くておいしかったかも～', 4);

INSERT INTO REVIEWTABLE (user_id, rice_id, review_comment, review_star)
VALUES(1, 6, '安い割にコメがふっくらしていて美味しかった！また買いたいと思います！', 5);
