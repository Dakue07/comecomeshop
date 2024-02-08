<HTML>
<%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@include file="../../assets/template/header2.jsp"%>

<style>
body {
	font-family: Arial, sans-serif;
}

form {
	display: flex;
	justify-content: space-between; /* Distribute the buttons evenly */
	margin-top: 20px; /* Add some top margin for spacing */
}

button {
	padding: 10px;
	margin: 0 5;
	cursor: pointer;
}

.modal-container {
	display: none;
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background-color: rgba(0, 0, 0, 0.7);
	align-items: center;
	justify-content: center;
}

.modal-content {
	height: auto;
	max-height: 80vh;
	overflow-y: auto;
	background-color: #fff;
	padding: 20px;
	border-radius: 5px;
	position: relative;
	width: 80%;
	max-width: 400px;
	text-align: center;
}

.close-btn {
	position: sticky;
	top: 10px;
	left: 300px;
	font-size: 20px;
	cursor: pointer;
	width: 20px;
}

.radio-group {
	display: flex;
	flex-direction: column;
	align-items: center;
	margin-top: 20px;
}

.radio-group input {
	margin-bottom: 10px;
}

body {
	min-height: 100vh;
	margin: 0;
	display: flex;
	flex-direction: column;
}

header {
	position: sticky;
	top: 0;
	width: 100%;
	z-index: 1000; /* Ensure the header stays on top */
}

main {
	margin-top: 80px; /* Adjust the value based on your header height */
}

footer {
	margin-top: auto;
}

form {
	margin-top: 20px;
	/* Adjust the value based on your layout preferences */
}

h2 {
	text-align: center;
}
</style>

<h2>購入手続き</h2>
<br>

<div id="purchaseContainer" style="margin-top: 120px;">
	<form action="<%=request.getContextPath()%>/come/procedure"
		method="post">
		<div class="card"
			style="width: 18rem; margin-bottom: 70px; float: right;">
			<div class="card-body">
				<!-- 合計金額のフォントサイズを大きくし、色を赤に変更 -->
				合計金額：<span id="total" style="font-size: 1.5em; color: red;">${totalPrice}円</span>
			</div>
		</div>
	</form>


	<form action="<%=request.getContextPath()%>/come/urlsave" method="post">
		<input type="hidden" name="url" value="/createpost">
		<button type="submit" class="register2-link">新しく住所を登録する</button>
	</form>
	
	<form action="<%=request.getContextPath()%>/come/urlsave" method="post">
		<input type="hidden" name="url" value="/come/card">
		<button type="submit" class="register2-link">新しく支払い方法を追加する</button>
	</form>


	<form action="come/addorderdetail" method="post">
	<button type="button" onclick="toggleModal('address')"
		style="position: absolute; left: 20%;">住所選択</button>
	<br>
	<div id="address_modal" class="modal-container">
		<div class="modal-content">
			<span class="close-btn" onclick="toggleModal('address')">&times;</span>
			<c:forEach var="data" items="${data[1]}">
				<div class="radio-group">
					<input type="radio" name="addressOption"
						value=${data.useraddress_id } checked> <label>
						受取人:${data.useraddress_receiver}<br>
						郵便番号:${data.useraddress_postcode}<br>
						都道府県:${data.useraddress_state_city}<br>
						市町村:${data.useraddress_street}<br>
					</label>
				</div>
			</c:forEach>
		</div>
	</div>

	<button type="button" onclick="toggleModal('payment')"
		style="position: relative;">支払い方法選択</button>
	<br>
	<div id="payment_modal" class="modal-container">
		<div class="modal-content">
			<span class="close-btn" onclick="toggleModal('payment')">&times;</span>
			<c:forEach var="data" items="${data[2]}">
				<div class="radio-group">
					<input type="radio" name="paymentOption"
						value=${data.card_id
						} checked>
					カード番号:${data.card_replace_number}<br>
					カード名義人:${data.card_holdername}<br> 有効期限:${data.card_validity}<br>
				</div>
			</c:forEach>
		</div>
	</div>

	<input type="submit" id="ConfirmOrderBtn" value="注文確定"
		style="position: absolute; right: 20%; height: 50px;">
	</form>

	<c:set var="totalPrice" value="0" />

	<c:forEach var="data" items="${data[0]}">
	<div class="card" style="width: 40rem; margin-bottom: 10px;">
		<img src="<%= request.getContextPath() %>${data.rice_image_path}"
			class="card-img-top" alt="Product Image">
		<div class="card-body">
			<h5 class="card-title">${data.rice_name}</h5>
			<p class="card-text">
				${data.rice_genre}<br> ${data.rice_weight} kg<br> <span
					class="rice-price">${data.rice_price}</span> 円
			</p>

			<c:set var="ricePrice"
				value="${data.rice_price * data.cart_quantity}" />
			<c:set var="totalPrice" value="${totalPrice + ricePrice}" />

			<select class="mySelect" data-rice-stock="${data.rice_stock}"
				name="absolute_cart_quantity"
				onChange="selectPullDown(this, '${data.rice_id}');">
				<c:forEach var="i" begin="1" end="${data.rice_stock}">
					<option value="${i+1}"
						<c:if test="${i == data.cart_quantity}">
    					    	  	id="selected" selected
    					    	  </c:if>>
						${i}</option>
				</c:forEach>
			</select> <span class="subtotal">${data.cart_quantity * data.rice_price}</span>
			<form action="<%=request.getContextPath()%>/come/deleteCart"
				method="post" style="float: right;">
				<button class="btn btn-primary">削除</button>
				<input type="hidden" name="rice_id" value="${data.rice_id}">
			</form>
		</div>
	</div>
</c:forEach>
</div>


<script>

function calculateSubtotal(select) {
    var quantity = parseInt(select.value, 10);
    var price = parseInt(select.closest('.card').querySelector('.rice-price').textContent, 10);
    var subtotal = quantity * price;
    select.nextElementSibling.textContent = subtotal;
    calculateTotalPrice();
}

function selectPullDown(quantitySelect, riceId) {
    var rice_quantity = quantitySelect.value;
    var send_data = new XMLHttpRequest();
    send_data.open('POST', '<%=request.getContextPath()%>/come/addcart', true);
    send_data.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
    send_data.onreadystatechange = function() {
        if (send_data.readyState == 4 && send_data.status == 200) {
            // サーバーからの応答を処理する（必要に応じて）
        }
    };
    var data = 'rice_id=' + encodeURIComponent(riceId) + '&absolute_cart_quantity=' + encodeURIComponent(rice_quantity);
    send_data.send(data);
    calculateSubtotal(quantitySelect);
}
</script>

<%@include file="../../assets/template/footer.jsp"%>