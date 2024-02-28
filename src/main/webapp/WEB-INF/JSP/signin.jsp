<!-- いじるな -->
<HTML><%@ page language="java" pageEncoding="UTF-8"
    contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!-- ここから下に書いてね -->
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>サインイン</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <body class="bg-light">
<div class="container" style="height: 752px;">
<div class="main container-fluid">
    <div class="row bg-light text-dark py-5">
        <div class="col-md-8 offset-md-2">
	<h2 class="fs-1 mb-5 text-center fw-bold">サインイン</h2>
	
	<c:if test="${data eq 'miss'}">
		<p class=" text-center text-danger">ユーザ名またはパスワードが違います。</p>
    </c:if>
	
	<form action="come/signin" method="post">
		<div class="row">
			<div class="col-md-6 mb-3">
				<label class="form-label" for="inputEmail">ユーザー名</label>
				<span class="text-danger">*</span>
            	<input type="text" class="form-control" name="user_name" id="inputName" autocomplete="off" placeholder="ユーザー名" required>
            </div>
			<div class="col-md-6 mb-3">
				<label class="form-label" for="inputEmail">パスワード</label>
				<span class="text-danger">*</span>
                <input type="password" class="form-control" name="user_pass" id="passwordInput" autocomplete="off" placeholder="パスワード">
                <button id="showPasswordButton" type="button">表示</button>
            </div>
        <div class="text-center mb-3"> 	
        <button class="btn btn-primary btn-md" type="submit" style="width: 50%;">サインイン</button>
        </div>
       </div>
	</form>
	</div>
		<div class="text-muted text-center"><small>アカウントがない場合は <a href="<%=request.getContextPath() %>/signup">こちら</a></small></div>
	</div>
	</div>
	</div>
    <!-- パスワードの表示 -->
    <script src="<%= request.getContextPath() %>/JS/password.js"></script>

</HTML>
<!-- いじるな -->
<%@include file="../../assets/template/footer.jsp" %>



