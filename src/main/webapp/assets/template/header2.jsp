<%@ page language="java" pageEncoding="UTF-8"
    contentType="text/html; charset=UTF-8" %>
    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/assets/css/header2.css">
		<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/assets/css/reset2.css">
		<title>toppage</title>
	</head>
	<body>
<!-- header -->
		<header>
			
			<% String imagePath = "/comecomeshop/images/logo.png"; %>
    		<img src="<%= imagePath %>" alt="comecomeshop" width="150" height="80">
			<nav class="pc-nav">
				<ul>
					<li><a href="#">マイページ</a></li>
					<li><a href="#">カート</a></li>
					<li><a href="<%=request.getContextPath() %>/signup">新規登録</a></li>
					<li><a href="#">ログイン</a></li>	
				</ul>
			</nav>
		</header>

    