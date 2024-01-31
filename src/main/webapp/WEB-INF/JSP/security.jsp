<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:if test="${data eq 'miss'}">
		<p class="text-danger">パスワードが違います。</p>
    </c:if>
	
	<form action="<%= request.getContextPath() %>come/changepassword" method="post">
		<div class="row">
			<div>
				<label class="form-label" for="inputoldPassword">パスワード</label>
				<span class="text-danger">*</span>
                <input type="password" class="form-control" name="user_pass" id="passwordInput" autocomplete="off" placeholder="パスワード">
                <button id="showPasswordButton" type="button">表示</button>
            </div>
            <div class="col-md-6 mb-3">
				<label class="form-label" for="inputEmail">パスワード</label>
				<span class="text-danger">*</span>
                <input type="password" class="form-control" name="user_pass" id="passwordInput" autocomplete="off" placeholder="新規パスワード" required>
                <button id="showPasswordButton" type="button">表示</button>
            </div>
        <div class="text-center mb-3"> 	
        <button class="btn btn-primary btn-md" type="submit" style="width: 50%;">パスワードを変更する</button>
        </div>
       </div>
	</form>
	
	<form action="<%= request.getContextPath() %>come/changeemail" method="post">
		<div class="row">
			<div>
				<label class="form-label" for="inputoldPassword">パスワード</label>
				<span class="text-danger">*</span>
                <input type="password" class="form-control" name="user_pass" id="passwordInput" autocomplete="off" placeholder="パスワード">
                <button id="showPasswordButton" type="button">表示</button>
            </div>
            <div class="col-md-6 mb-3">
				<label class="form-label" for="inputEmail">パスワード</label>
				<span class="text-danger">*</span>
                <input type="password" class="form-control" name="user_pass" id="passwordInput" autocomplete="off" placeholder="新規パスワード" required>
                <button id="showPasswordButton" type="button">表示</button>
            </div>
        <div class="text-center mb-3"> 	
        <button class="btn btn-primary btn-md" type="submit" style="width: 50%;">メールアドレスを変更する</button>
        </div>
       </div>
	</form>
</body>
</html>

<!-- user_idをhiddenでformに混ぜようぜ-->