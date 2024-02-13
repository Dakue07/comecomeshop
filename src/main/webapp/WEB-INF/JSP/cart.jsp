<HTML>
<%@ page language="java" pageEncoding="UTF-8"
    contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<%@include file="../../assets/template/header2.jsp" %>

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/CSS/style.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/CSS/cart.css">



<!-- ここから下に書いてね -->

<script>
    document.addEventListener('DOMContentLoaded', function () {
        var selects = document.querySelectorAll('.mySelect');
       /*  selects.forEach(function (select) {
            var riceStockValue = parseInt(select.dataset.riceStock, 10);

            select.innerHTML = '';
            
            for (var i = 1; i <= riceStockValue; i++) {
                var option = document.createElement('option');
                option.value = i;
                option.innerHTML = i;
                select.add(option);
            }
        }); */
        // ページ読み込み時に合計を計算して表示する
        calculateTotal();
    });

    // 数量が変更されたときに小計を計算して表示する関数
	function calculateSubtotal(select) {
    	var quantity = parseInt(select.value, 10);
    	var priceElement = select.closest('.card').querySelector('.card-text .rice-price');
    	var price = priceElement ? parseInt(priceElement.innerHTML, 10) : 0;
    	var subtotal = quantity * price;
    
    	console.log('quantity:', quantity);  // デバッグ用
    	console.log('price:', price);        // デバッグ用
    
    	// 小計を表示するspan要素を取得して更新する
    	select.nextElementSibling.innerHTML = subtotal;
    	// 合計を計算して表示する関数を呼び出す
    	calculateTotal();
	}

    // 合計を計算して表示する関数
    function calculateTotal() {
        var subtotals = document.querySelectorAll('.subtotal');
        var total = 0;
        subtotals.forEach(function (subtotal) {
            total += parseInt(subtotal.innerHTML, 10);
        });
        // 合計を表示するspan要素を取得して更新する
        document.getElementById('total').innerHTML = total;
    }
    function selectPullDown(quantitySelect, riceId) {
        var rice_quantity = quantitySelect.value;
        console.log('rice_Id:', riceId);           // デバッグ用
        console.log('rice_quantity:', rice_quantity); // デバッグ用
        

        // XMLHttpRequestオブジェクトを初期化
        var send_data = new XMLHttpRequest();

        send_data.open('POST', '<%= request.getContextPath() %>/come/addcart', true);
        send_data.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
        send_data.onreadystatechange = function () {
            if (send_data.readyState == 4 && send_data.status == 200) {
                // サーバーからの応答を処理する（必要に応じて）
            }
        };

        // 送信するデータを組み立てる
        var data = 'rice_id=' + encodeURIComponent(riceId) + '&absolute_cart_quantity=' + encodeURIComponent(rice_quantity);

        // データを送信
        send_data.send(data);
        // 数量が変更されたときに小計を計算して表示する関数を呼び出す
        calculateSubtotal(quantitySelect);
    }
</script>

<style>
    #purchaseContainer {
        position: fixed;
        top: 0;
        right: 0;
        margin: 20px;
        z-index: 1;
    }
</style>

<c:set var="totalPrice" value="0" />
<div style="display: flex; justify-content: space-between;">

    <!-- カートの中身 -->
    <div style="width: 48%;">
        カート

        <c:forEach var="data" items="${data}">
            <div class="card" style="width: 40rem; margin-bottom: 10px;">
                <img src="<%= request.getContextPath() %>${data.rice_image_path}" class="card-img-top" alt="Product Image">
                <div class="card-body">
                    <h4 class="card-title">品種:${data.rice_name} ${data.rice_weight}kg</h4>
                  	<p class="card-text"  style="margin: 0;">
					    品目:${data.rice_genre}<br>
					    <span class="rice-price">単価:${data.rice_price}円</span>
					</p>

                    <c:set var="ricePrice" value="${data.rice_price * data.cart_quantity}" />
                    <c:set var="totalPrice" value="${totalPrice + ricePrice}" />
                    
                    個数:
					<select class="mySelect" data-rice-stock="${data.rice_stock}" name="absolute_cart_quantity" onChange="selectPullDown(this, '${data.rice_id}');">
    					<c:forEach var="i" begin="1" end="${data.rice_stock}">	
    					    <option value="${i+1}"
    					    	 <c:if test="${i == data.cart_quantity}">
    					    	  	id="selected" selected
    					    	  </c:if>
   					    	  >
   					    	  	${i}
   					    	  </option>
					    </c:forEach>
					</select>
					個<br>
					
                     小計:<span class="subtotal">${data.cart_quantity * data.rice_price}</span>円
                    <form action="<%= request.getContextPath() %>/come/deleteCart" method="post" style="float: right;">
                        <button class="btn btn-primary">削除</button>
                        <input type="hidden" name="rice_id" value="${data.rice_id}">
                    </form>
                </div>
            </div>
        </c:forEach>
    </div>
    

    <!-- カートの購入フォーム -->
    <div id="purchaseContainer" style="margin-top: 120px;">
        <form action="<%= request.getContextPath() %>/come/procedure" method="post">
            <div class="card" style="width: 18rem; margin-bottom: 70px; float: right; position: relative; top: 350px; right: 20px;">
                <div class="card-body">
                    <!-- 合計金額のフォントサイズを大きくし、色を赤に変更 -->
                    合計金額：<span id="total" style="font-size: 1.5em; color: red;">${totalPrice}</span>円
                    <button class="btn btn-primary" style="width: 15rem; height: 5rem;">購入</button>
                    <c:forEach var="data" items="${data}">
                        <input type="hidden" name="cart_quantity_${data.rice_id}" value="${data.cart_quantity}">
                    </c:forEach>
                </div>
            </div>
        </form>
    </div>
</div>

<!-- いじるな -->
<%@include file="../../assets/template/footer.jsp" %>
