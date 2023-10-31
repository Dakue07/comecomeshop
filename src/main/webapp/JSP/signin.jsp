<%@ page language="java" pageEncoding="UTF-8"
    contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link href="../CSS/style.css" rel="stylesheet" />
    <title>ログイン画面</title>
</head>
<body>
    <form action="Servlet名" method="post">
        <dl>
            <dt>ユーザー名</dt>
            <dd><input type="text" name="name" autocomplete="off" placeholder="ユーザー名" required="required"></dd>
        </dl>

        <dl>
            <dt>パスワード</dt>
            <dd>
                <input type="password" name="pass" id="passwordInput" autocomplete="off" placeholder="パスワード" required="required">
                <button id="showPasswordButton" type="button">表示</button>
            </dd>
        </dl>

        <button type="button" onclick="location.href='ログイン先のjsp'">ログイン</button>
        <button type="button" onclick="location.href='signup.html'">新規登録はこちら</button>
    </form>

    <script src="../JS/login.js"></script>
</body>
</html>
