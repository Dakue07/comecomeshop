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
    <form action="come/userinsert" method="post">
        <dl>
            <dt>ユーザー名</dt>
            <dd><input type="text" name="user_name" autocomplete="off" placeholder="新規ユーザー名"></dd>
        </dl>

        <dl>
            <dt>パスワード</dt>
            <dd>
                <input type="password" name="user_pass" id="passwordInput" autocomplete="off" placeholder="新規パスワード">
                <button id="showPasswordButton" type="button">表示</button>
            </dd>
        </dl>

        <button type="submit">新規登録</button>
    </form>

    <script src="../JS/login.js"></script>
</body>
</html>
