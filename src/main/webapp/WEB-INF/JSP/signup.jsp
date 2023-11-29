<!-- いじるな -->
<HTML><%@ page language="java" pageEncoding="UTF-8"
    contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>

<%@include file="../../assets/template/header2.jsp" %>


<!-- ここから下に書いてね -->
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>ユーザー登録</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <body class="bg-light">
	<div class="container">
	<div class="main container-fluid">
    <div class="row bg-light text-dark py-5">
	<h2 class="fs-1 mb-5 text-center fw-bold">ユーザー登録</h2>

	<form action="come/userinsert" method="post">
		<div class="row">
			<div class="col-md-6 mb-3">
				<label class="form-label" for="inputEmail">ユーザー名</label>
				<span class="text-danger">*</span>
            	<input type="text" class="form-control" name="user_name" id="inputName" autocomplete="off" placeholder="新規ユーザー名" required>
            </div>
			<div class="col-md-6 mb-3">
				<label class="form-label" for="inputEmail">パスワード</label>
				<span class="text-danger">*</span>
                <input type="password" class="form-control" name="user_pass" id="passwordInput" autocomplete="off" placeholder="新規パスワード" required>
                <button id="showPasswordButton" type="button">表示</button>
            </div>
            <div class="col-md-6 mb-3">
				<label class="form-label" for="inputEmail">メールアドレス</label>
				<span class="text-danger">*</span>
            	<input type="text" class="form-control" name="user_Email" id="email" autocomplete="off" placeholder="新規メールアドレス" required>
           	</div>
           	<div class="col-md-6 mb-3">
				<label class="form-label" for="inputEmail">郵便番号</label>
				<span class="text-danger">*</span>
            	<input type="text" class="form-control" name="useraddress_postcode" id="postcode" autocomplete="off" placeholder="郵便番号" required>
           	</div>
			<div class="col-md-6 mb-3">
				<label class="form-label" for="inputEmail">都道府県</label>
            	<span class="text-danger">*</span>
            	<input type="text" class="form-control" name="useraddress_state_city" id="state_city" autocomplete="off" placeholder="都道府県" required>
         	</div>
         	<div class="col-md-6 mb-3">
				<label class="form-label" for="inputEmail">市区町村・番地・(部屋番号・建物名)</label>
            	<span class="text-danger">*</span>
            	<input type="text" class="form-control" name="useraddress_street" id="street" autocomplete="off" placeholder="市区町村・番地・(部屋番号・建物名)" required>
            </div>
            <div class="col-md-6 mb-3">
				<label class="form-label" for="inputEmail">受取人</label>
            	<span class="text-danger">*</span>
            	<input type="text" class="form-control" name="useraddress_receiver" id="receiver" autocomplete="off" placeholder="受取人" required>
            </div>
        <div class="text-center mb-3"> 	
        <button class="btn btn-primary btn-md" type="submit" style="width: 30%;">新規登録</button>
        </div>
       </div>
    </form>
    </div>
    </div>
    </div>

    <script src="<%= request.getContextPath() %>/JS/login.js"></script>


</HTML>
<!-- いじるな -->
<%@include file="../../assets/template/footer.jsp" %>
