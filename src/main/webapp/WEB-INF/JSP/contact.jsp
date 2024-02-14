<!-- いじるな -->
<HTML><%@ page language="java" pageEncoding="UTF-8"
    contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>


<%@include file="../../assets/template/header2.jsp" %>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/CSS/style.css">

<!-- ここから下に書いてね -->
<html lang="ja">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">


</head>
<body class="bg-light">
<div class="container" style="    margin-top: 20px;">
<div class="main container-fluid" style="padding: 0;">
    <div class="row bg-light text-dark py-5" style="padding: 0!important;">
        <div class="col-md-8 offset-md-2">
            <h2 class="fs-1 mb-5 text-center fw-bold">お問い合わせ</h2>
            <form method="post" action="<%= request.getContextPath() %>/come/sendmail">
                <div class="mb-3">
                    <input type="text" class="form-control" name="user_name" placeholder="名前（必須）" value="" required>
                </div>
                <div class="mb-4">
                    <textarea class="form-control" name="content" rows="5" placeholder="メッセージを入力してください" required></textarea>
                </div>
                <div class="form-check mb-4">
                    <input class="form-check-input" type="checkbox" value="" id="flexCheckIndeterminate" required>
                    <label class="form-check-label" for="flexCheckIndeterminate">
                      利用規約に同意します。<a href="" target="_blank" rel="noopener noreferrer" class="text-decoration-underline text-dark">プライバシーポリシーはこちら</a>
                    </label>
                  </div>
                <div class="text-center pt-4 col-md-6 offset-md-3">
                    <button type="submit" class="btn btn-primary" onclick="completedsubmit()">送信</button>
                </div>
            </form>
        </div>
    </div>
</div>
</div>

<!-- いじるな -->
<%@include file="../../assets/template/footer.jsp" %>