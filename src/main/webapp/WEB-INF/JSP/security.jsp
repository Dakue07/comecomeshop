<!-- いじるな -->
<html>
<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@include file="../../assets/template/header2.jsp" %>

<!-- ここから下に書いてね -->

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
    .cursor:hover {
        background-color: #c0c0c0;
    }
</style>

<body>

<div class="container">
<div class="main container-fluid">
    <div class="row bg-light text-dark py-5">
        <div class="col-md-8 offset-md-2">
	<h2 class="fs-1 mb-5 text-center fw-bold">パスワード変更</h2>

    <c:if test="${data eq 'miss'}">
        <p class="text-center text-danger">パスワードが違います。</p>
    </c:if>

    <form action="<%=request.getContextPath() %>/come/changepassword" method="post">
        <div class="row">
            <div class="col-md-6 mb-3">
                <label class="form-label" for="password">現在のパスワード</label>
                <span class="text-danger">*</span>
                <input type="password" class="form-control" name="oldPassword" id="oldPassword" autocomplete="off" placeholder="現在のパスワード" required>
                <button id="showOldPasswordButton" type="button" onclick="togglePassword('oldPassword')">表示</button>
            </div>
            <div class="col-md-6 mb-3">
                <label class="form-label" for="password">新しいパスワード</label>
                <span class="text-danger">*</span>
                <input type="password" class="form-control" name="newPassword" id="newPassword" autocomplete="off" placeholder="新しいパスワード" required>
                <button id="showNewPasswordButton" type="button" onclick="togglePassword('newPassword')">表示</button>
            </div>
            <button type="submit" style="width: 50%;">パスワードの変更</button>
        </div>
    </form>

    <form action="<%=request.getContextPath() %>/come/changeEmail" method="post">
        <div class="row">
            <div class="col-md-auto mb-3">
                <label class="form-label" for="inputEmail">新しいEメールアドレス</label>
                <span class="text-danger">*</span>
                <input type="text" class="form-control" name="user_Ename" id="user_Ename" autocomplete="off" placeholder="新しいメールアドレス" required>
            </div>
            <button type="submit" style="width: 50%;">Eメールアドレスの変更</button>
        </div>
    </form>

    <!-- パスワードの表示・非表示を切り替えるJavaScript -->
    <script>
        function togglePassword(inputId) {
            var passwordInput = document.getElementById(inputId);
            var buttonId = 'show' + inputId.charAt(0).toUpperCase() + inputId.slice(1) + 'Button';
            var showPasswordButton = document.getElementById(buttonId);

            if (passwordInput.type === 'password') {
                passwordInput.type = 'text';
                showPasswordButton.textContent = '非表示';
            } else {
                passwordInput.type = 'password';
                showPasswordButton.textContent = '表示';
            }
        }
    </script>

</body>

</html>
<!-- いじるな -->
<%@include file="../../assets/template/footer.jsp" %>
