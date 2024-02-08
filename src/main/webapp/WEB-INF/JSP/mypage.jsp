<!-- いじるな -->
<HTML><%@ page language="java" pageEncoding="UTF-8"
    contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="../../assets/template/header2.jsp" %>



<!-- ここから下に書いてね -->

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM"
	crossorigin="anonymous">
	
<style>
	.cursor:hover {
    	background-color: #c0c0c0;
    }
</style>


<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
			integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz"
			crossorigin="anonymous"></script>

<div class="row">
	<div class="col-md-4 text-center">
		<a href="<%=request.getContextPath() %>/come/history" style="text-decoration:none;">
    	<div class="card mb-3" style="width: 18rem; height: 80%;">
    		<div class="cursor">
      			<div class="row g-4">
        			<div class="col-md-4">
          				<img src="/comecomeshop/images/icon/clock-history.svg" width=160px alt="履歴アイコン" class="img-fluid rounded-start">
        			</div>
        			<div class="col-md-8">
          				<div class="card-body">
            				<h5 class="card-title d-flex flex-column">注文履歴</h5>
            				<p class="card-text flex-fill"><small class="text-body-secondary">注文内容の確認</small></p>
          				</div>
        			</div>
      			</div>
    		</div>
    	</div>
    	</a>
  	</div>

  <div class="col-md-4 text-center">
		<a href="<%=request.getContextPath() %>/contact" style="text-decoration:none;">
    	<div class="card mb-3" style="width: 18rem; height: 80%;">
    		<div class="cursor">
      			<div class="row g-4">
        			<div class="col-md-4">
          				<img src="/comecomeshop/images/icon/telephone.svg" width=150px alt="電話アイコン" class="img-fluid rounded-start">
        			</div>
        			<div class="col-md-8">
          				<div class="card-body">
            				<h5 class="card-title d-flex flex-column">お問い合わせ</h5>
            				<p class="card-text flex-fill"><small class="text-body-secondary">メールの送信</small></p>
          				</div>
        			</div>
      			</div>
    		</div>
    	</div>
    	</a>
  	</div>
  
  <div class="col-md-4 text-center">
		<a href="<%=request.getContextPath() %>/come/security" style="text-decoration:none;">
    	<div class="card mb-3" style="width: 18rem; height: 80%;">
    		<div class="cursor">
      			<div class="row g-4">
        			<div class="col-md-4">
          				<img src="/comecomeshop/images/icon/shield-check.svg" width=105px alt="セキュリティアイコン" class="img-fluid rounded-start">
        			</div>
        			<div class="col-md-8">
          				<div class="card-body">
            				<h5 class="card-title d-flex flex-column">セキュリティ</h5>
            				<p class="card-text flex-fill"><small class="text-body-secondary">アカウント情報の<br>確認・変更</small></p>
          				</div>
        			</div>
      			</div>
    		</div>
    	</div>
    	</a>
  	</div>
  
  <div class="col-md-4 text-center">
		<a href="<%=request.getContextPath() %>/come/cart" style="text-decoration:none;">
    	<div class="card mb-3" style="width: 18rem; height: 80%;">
    		<div class="cursor">
      			<div class="row g-4">
        			<div class="col-md-4">
          				<img src="/comecomeshop/images/icon/cart4.svg" width=130px alt="カートアイコン" class="img-fluid rounded-start">
        			</div>
        			<div class="col-md-8">
          				<div class="card-body">
            				<h5 class="card-title d-flex flex-column">カート</h5>
            				<p class="card-text flex-fill"><small class="text-body-secondary">カート情報の確認</small></p>
          				</div>
        			</div>
      			</div>
    		</div>
    	</div>
    	</a>
  	</div>
  
  <div class="col-md-4 text-center">
		<a href="<%=request.getContextPath() %>/come/card" style="text-decoration:none;">
    	<div class="card mb-3" style="width: 18rem; height: 80%;">
    		<div class="cursor">
      			<div class="row g-4">
        			<div class="col-md-4">
          				<img src="/comecomeshop/images/icon/credit-card.svg" width=130px alt="履歴アイコン" class="img-fluid rounded-start">
        			</div>
        			<div class="col-md-8">
          				<div class="card-body">
            				<h5 class="card-title d-flex flex-column">お支払い方法</h5>
            				<p class="card-text flex-fill"><small class="text-body-secondary">お支払い方法の<br>追加・削除・確認</small></p>
          				</div>
        			</div>
      			</div>
    		</div>
    	</div>
    	</a>
  	</div>
  
  <div class="col-md-4 text-center">
		<a href="<%=request.getContextPath() %>/come/userpost" style="text-decoration:none;">
    	<div class="card mb-3" style="width: 18rem; height: 80%;">
    		<div class="cursor">
      			<div class="row g-4">
        			<div class="col-md-4">
          				<img src="/comecomeshop/images/icon/house.svg" width=150px alt="履歴アイコン" class="img-fluid rounded-start">
        			</div>
        			<div class="col-md-8">
          				<div class="card-body">
            				<h5 class="card-title d-flex flex-column">住所の変更</h5>
            				<p class="card-text flex-fill"><small class="text-body-secondary">住所の変更</small></p>
          				</div>
        			</div>
      			</div>
    		</div>
    	</div>
    	</a>
  	</div>

  
</div>

<!-- いじるな -->
<%@include file="../../assets/template/footer.jsp" %>
