<!-- いじるな -->
<HTML><%@ page language="java" pageEncoding="UTF-8"
    contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>

<%@include file="../../assets/template/header2.jsp" %>


<!-- ここから下に書いてね -->
<html lang="ja">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
<style>
body {
        font-family: Arial, sans-serif;
		background-image: url(/comecomeshop/images/ine.png);
        background-size: cover;
        background-repeat: no-repeat;
        background-attachment: fixed;
        background-color: rgba(122, 122, 122, 0.1); /* 透明度を指定 */
    }
</style>


</head>
<body class="bg-light">
<div class="container">
<div class="main container-fluid">
    <div class="row bg-light text-dark py-5">
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
                    <button type="submit" class="btn btn-primary">送信</button>
                </div>
            </form>
        </div>
    </div>
</div>
</div>
<!-- いじるな -->
<%@include file="../../assets/template/footer.jsp" %>