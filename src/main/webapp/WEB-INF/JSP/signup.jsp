<!-- いじるな -->
<HTML><%@ page language="java" pageEncoding="UTF-8"
    contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>

<%@include file="../../assets/template/header.jsp" %>


<!-- ここから下に書いてね -->

<form action="come/userinsert" method="post">
        
            ユーザー名
            	<input type="text" name="user_name" autocomplete="off" placeholder="新規ユーザー名">
			パスワード
                <input type="password" name="user_pass" id="passwordInput" autocomplete="off" placeholder="新規パスワード">
                <button id="showPasswordButton" type="button">表示</button>
            メールアドレス
            	<input type="text" name="user_Email" id="email" autocomplete="off" placeholder="新規メールアドレス">
            郵便番号
            	<input type="text" name="useraddress_postcode" id="postcode" autocomplete="off" placeholder="新規郵便番号">
            都道府県
            	<input type="text" name="useraddress_state_city" id="state_city" autocomplete="off" placeholder="都道府県">
            市区町村・番地・(部屋番号・建物名)
            	<input type="text" name="useraddress_street" id="state_city" autocomplete="off" placeholder="市区町村・番地・(部屋番号・建物名)">
            
            

        <button type="submit">新規登録</button>
    </form>

    <script src="<%= request.getContextPath() %>/JS/login.js"></script>


<!-- いじるな -->
<%@include file="../../assets/template/footer.jsp" %>
