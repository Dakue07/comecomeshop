<%@ page language="java" pageEncoding="UTF-8"
    contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8"> 
    <link rel="stylesheet" type="text/css" href="../CSS/style.css"  />
    <link rel="stylesheet" type="text/css" href="../assets/css/reset.css">
    <link rel="stylesheet" type="text/css" href="../assets/css/header.css">
    <link rel="stylesheet" type="text/css" href="../assets/css/footer.css">
    <title>ログイン画面</title>
</head>
<body>
	<!-- header -->
    <%@include file="../../assets/template/header.jsp" %>
    
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
    
    <!-- footer -->
    <%@include file="../../assets/template/footer.jsp" %>

    <script src="../JS/login.js"></script>
</body>
</html>
