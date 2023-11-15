<!-- いじるな -->
<HTML><%@ page language="java" pageEncoding="UTF-8"
    contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>

<%@include file="../../assets/template/header2.jsp" %>


<!-- ここから下に書いてね -->
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>サインイン</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
<main class="container">
	<h2 class="text-center p-5" style="font-size: 35px;" >サインイン</h2>
	
	<form action="come/login" method="post">
		<div class="row">
			<div class="col-md-6 mb-3">
				<label class="form-label" for="inputEmail">ユーザー名</label>
				<span class="text-danger">*</span>
            	<input type="text" class="form-control" name="user_name" id="inputName" autocomplete="off" placeholder="新規ユーザー名" required>
            </div>
			<div class="col-md-6 mb-3">
				<label class="form-label" for="inputEmail">パスワード</label>
				<span class="text-danger">*</span>
                <input type="password" class="form-control" name="user_pass" id="passwordInput" autocomplete="off" placeholder="新規パスワード">
                <button id="showPasswordButton" type="button">表示</button>
            </div>
        <div class="d-grid mb-3"> 	
        <button class="btn btn-primary" type="submit">サインイン</button>
        </div>
       </div>
	</form>
    <!-- パスワードの表示 -->
    <script src="<%= request.getContextPath() %>/JS/login.js"></script>
</main>
</HTML>
<!-- いじるな -->
<%@include file="../../assets/template/footer.jsp" %>



