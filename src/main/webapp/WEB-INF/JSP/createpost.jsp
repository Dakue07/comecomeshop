<!-- いじるな -->
<HTML>
<head>
<%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<%@include file="../../assets/template/header2.jsp"%>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet">

<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/CSS/style.css">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/CSS/createpost.css">

</head>




<!-- ここから下に書いてね -->

<body>

	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>住所登録</title>
<body class="bg-light">
	<div class="container">
		<div class="main2 container-fluid">
			<div class="row bg-light text-dark py-5">
				<h2 class="fs-1 mb-5 text-center fw-bold">住所登録</h2>

				<form action="come/addpost" method="post">
					<div class="row">
						<div class="col-md-6 mb-3">
							<label class="form-label" for="inputEmail">郵便番号</label> <span
								class="text-danger">*</span> <input id="input_zip"
								class="form-control" name="useraddress_postcode" id="postcode"
								autocomplete="off" placeholder="郵便番号(ハイフンなし)" maxlength="7"
								minlength="7" required>
						</div>
						<div class="col-md-6 mb-3">
							<label class="form-label" for="inputEmail">都道府県</label> <span
								class="text-danger">*</span> <input type="text"
								id="input_state_town" class="form-control"
								name="useraddress_state_city" id="state_city" autocomplete="off"
								placeholder="都道府県" required>
						</div>
						<div class="col-md-6 mb-3">
							<label class="form-label" for="inputEmail">市区町村</label> <span
								class="text-danger">*</span> <input type="text"
								id="input_street" class="form-control" name="useraddress_street"
								id="street" autocomplete="off" placeholder="市区町村" required>
						</div>
						<div class="col-md-6 mb-3">
							<label class="form-label" for="inputEmail">番地・(部屋番号・建物名)</label>
							<span class="text-danger">*</span> <input type="text"
								id="input_street" class="form-control" name="street_address"
								autocomplete="off" placeholder="番地・(部屋番号・建物名)" required>
						</div>
						<div class="col-md-6 mb-3">
							<label class="form-label" for="inputEmail">受取人</label> <span
								class="text-danger">*</span> <input type="text"
								class="form-control" name="useraddress_receiver" id="receiver"
								autocomplete="off" placeholder="受取人" required>
						</div>
						<div class="text-center mb-3">
							<button class="btn btn-primary btn-md" type="submit"
								style="width: 30%;">住所登録</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>

	<script src="<%=request.getContextPath()%>/JS/login.js"></script>

	<script type="text/javascript"
		src="https://postcode-jp.com/js/postcodejp.js" charset="utf-8">
		
	</script>
	<!--srcはそのままでお願いします-->
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/JS/postcodejp_script.js"
		charset="utf-8"></script>
	<script>
		document.addEventListener('DOMContentLoaded', function() {
			var input = document.getElementById('input_zip');

			input.addEventListener('input', function() {

				var value = input.value.replace(/\D/g, '');
				input.value = value;
			});

			input.addEventListener('keydown', function(event) {
				if (event.key === '-') {
					event.preventDefault();
				}
			});
		});
	</script>



	<!-- いじるな -->
	<%@include file="../../assets/template/footer.jsp"%>
</body>