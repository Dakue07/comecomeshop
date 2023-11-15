<!-- いじるな -->
<HTML><%@ page language="java" pageEncoding="UTF-8"
    contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>

<%@include file="../../assets/template/header2.jsp" %>


<!-- ここから下に書いてね -->

<form action="come/login" method="post">
        <dl>
            <dt>ユーザー名</dt>
            <dd><input type="text" name="user_name" autocomplete="off" placeholder="ユーザー名" required="required"></dd>
        </dl>

        <dl>
            <dt>パスワード</dt>
            <dd>
                <input type="password" name="user_pass" id="passwordInput" autocomplete="off" placeholder="パスワード" required="required">
                <button id="showPasswordButton" type="button">表示</button>
            </dd>
        </dl>

        <button type="submit">ログイン</button>
        <button type="button" onclick="signup">新規登録はこちら</button>
    </form>


<!-- いじるな -->
<%@include file="../../assets/template/footer.jsp" %>



