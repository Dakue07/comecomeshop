<%@ page language="java" pageEncoding="UTF-8"
    contentType="text/html; charset=UTF-8" %>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM"
	crossorigin="anonymous">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<style>
a {
	display: inline-block;
	position: relative;
	color: #555;
	text-decoration: none;
}

a:before {
	content: "";
	position: absolute;
	left: 0;
	bottom: -4px;
	width: 100%;
	height: 3px;
	background: #555;
	transform: scale(0, 1);
	transition: 0.4s;
}



form .btn.btn-outline-success {
    width: 150px;
}
</style>
</head>
<body>
	<header>
		<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
			integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz"
			crossorigin="anonymous"></script>
		<nav class="navbar navbar-expand-lg bg-body-tertiary full-width">

			<a class="navbar-brand ms-3" href="<%=request.getContextPath() %>/come/productlist"> <img
				src="/comecomeshop/images/logo.png" alt="Bootstrap" width="150"
				height="80">
			</a>
			<div class="collapse navbar-collapse" id="navbarNav">
				<ul class="navbar-nav nav-underline ms-auto grid gap-3">
					<!-- 検索form -->
					<form class="d-flex flex-row me-3" action="<%= request.getContextPath() %>/come/search" role="search" method="get">
						<input class="form-control me-2" type="search"
							placeholder="Enter content..." aria-label="Search" name="name">							
						<button class="btn btn-outline-success" type="submit" onclick="location.href='<%=request.getContextPath() %>/come/search'">検索</button>
					</form>
					<li class="nav-item"><a class="nav-link"
						aria-current="page" href="<%=request.getContextPath() %>/come/productlist">ホーム</a></li>
					<li class="nav-item"><a class="nav-link" href="<%=request.getContextPath() %>/mypage">マイページ</a></li>
					<li class="nav-item"><a class="nav-link" href="<%=request.getContextPath() %>/come/cart">カート</a></li>
					
					<c:if test="${not empty userBean}">
						<li class="nav-item dropdown">
						    <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-expanded="false">${userBean.user_name}</a>
						    <ul class="dropdown-menu">
						      <li><a class="dropdown-item" href="<%=request.getContextPath() %>/signin">アカウント切り替え</a></li>
						      <li><a class="dropdown-item" href="<%=request.getContextPath() %>/come/signout">サインアウト</a></li>
						    </ul>
						 </li>
					</c:if>
					
					<c:if test="${empty userBean}">
						<li class="nav-item">
							<button class="btn btn-outline-success me-2" type="button" onclick="location.href='<%=request.getContextPath() %>/signin'">サインイン</button>
						</li>
						<li class="nav-item">
							<button class="btn btn-outline-success me-2" type="button" onclick="location.href='<%=request.getContextPath() %>/signup'">新規登録</button>
						</li>
					</c:if>
					
					
				</ul>
			</div>
			</div>
			</div>
		</nav>
	</header>
	<!-- ここから下いじるな -->