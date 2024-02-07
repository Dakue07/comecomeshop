<!-- いじるな -->
<HTML><%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../../assets/template/header2.jsp"%>

<link rel="stylesheet" type="text/css" href="CSS/style.css">

<!-- ここから下に書いてね -->

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM"
	crossorigin="anonymous">

<link rel="stylesheet" type="text/css" href="CSS/mypage.css">
<style>
.cursor:hover {
	background-color: #c0c0c0;
}
</style>


<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz"
	crossorigin="anonymous"></script>

<div class="row cards_wrap">
	<div class="menu_card">
		<a class="menu_card_link"
			href="<%=request.getContextPath()%>/come/history"></a>
		<div class="menu_card_body">
			<div class="menu_card_icon">
				<img src="/comecomeshop/images/icon/clock-history.svg" alt="履歴アイコン">
			</div>
			<div class="menu_card_info">
				<h5 class="">注文履歴</h5>
				<p class="">
					<small class="">注文内容の確認</small>
				</p>
			</div>
		</div>

	</div>
	<div class="menu_card">
		<a class="menu_card_link"
			href="<%=request.getContextPath()%>/come/history"></a>
		<div class="menu_card_body">
			<div class="menu_card_icon">
				<img src="/comecomeshop/images/icon/telephone.svg" alt="電話アイコン">
			</div>
			<div class="menu_card_info">
				<h5 class="">お問い合わせ</h5>
				<p class="">
					<small class="">メールの送信</small>
				</p>
			</div>
		</div>

	</div>
	<div class="menu_card">
		<a class="menu_card_link"
			href="<%=request.getContextPath()%>/come/history"></a>
		<div class="menu_card_body">
			<div class="menu_card_icon">
				<img src="/comecomeshop/images/icon/shield-check.svg" alt="セキュリティアイコン">
			</div>
			<div class="menu_card_info">
				<h5 class="">セキュリティ</h5>
				<p class="">
					<small class="">アカウント情報の確認・変更</small>
				</p>
			</div>
		</div>

	</div>
	<div class="menu_card">
		<a class="menu_card_link"
			href="<%=request.getContextPath()%>/come/history"></a>
		<div class="menu_card_body">
			<div class="menu_card_icon">
				<img src="/comecomeshop/images/icon/cart4.svg" alt="カートアイコン">
			</div>
			<div class="menu_card_info">
				<h5 class="">カート</h5>
				<p class="">
					<small class="">カート情報の確認</small>
				</p>
			</div>
		</div>
	</div>
		<div class="menu_card">
		<a class="menu_card_link"
			href="<%=request.getContextPath()%>/come/history"></a>
		<div class="menu_card_body">
			<div class="menu_card_icon">
				<img src="/comecomeshop/images/icon/credit-card.svg" alt="カードアイコン">
			</div>
			<div class="menu_card_info">
				<h5 class="">お支払方法</h5>
				<p class="">
					<small class="">お支払方法の追加・変更・確認</small>
				</p>
			</div>
		</div>

	</div>
	
	<div class="menu_card">
		<a class="menu_card_link"
			href="<%=request.getContextPath()%>/come/history"></a>
		<div class="menu_card_body">
			<div class="menu_card_icon">
				<img src="/comecomeshop/images/icon/house.svg" alt="履歴アイコン">
			</div>
			<div class="menu_card_info">
				<h5 class="">住所の変更</h5>
				<p class="">
					<small class="">住所の変更</small>
				</p>
			</div>
		</div>

	</div>


</div>

<!-- いじるな -->
<%@include file="../../assets/template/footer.jsp"%>