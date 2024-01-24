<HTML>
<%@ page language="java" pageEncoding="UTF-8"
    contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<%@include file="../../assets/template/header2.jsp" %>

<!-- ここから下に書いてね -->
カート

<c:if test="${empty userBean}">
    <script>
        alert("ログイン情報がありません。サインインしてください");
        window.location.href = "<%=request.getContextPath() %>/signin";
    </script>
</c:if>

<c:forEach var="data" items="${data}">
    <br>${data.rice_name}<br>${data.rice_genre}<br>${data.rice_made}<br>${data.rice_weight}<br>${data.cart_quantity}${data.rice_image_path}<br>
    ${data.rice_since}<br>${data.rice_stock}<br>${data.rice_price}<br>
	<select class="mySelect" data-rice-stock="${data.rice_stock}" name="cart_quantity" onChange="calculateSubTotal(this)" onClick="selectPullDown(this)">
        <c:forEach var="i" begin="1" end="${data.rice_stock}">
            <option  value="${i}" <c:if test="${i == data.cart_quantity}">selected</c:if>>${i}</option>
        </c:forEach>
    </select>
    <span class="subtotal">${data.cart_quantity * data.rice_price}</span>
    
    <form action="<%= request.getContextPath() %>/come/deleteCart" method="post">
        <button class="btn btn-primary">削除</button>
        <input type="hidden" name="rice_id" value="${data.rice_id}">
    </form>
</c:forEach>

<span id="total">合計: 0</span>


<form action="<%= request.getContextPath() %>/come/procedure" method="post">
    <button class="btn btn-primary">購入</button>
    <input type="hidden" name="rice_id" value="${rice_id}">
</form>


<script>
    document.addEventListener('DOMContentLoaded', function () {
        var selects = document.querySelectorAll('.mySelect');
        selects.forEach(function (select) {
            var riceStockValue = parseInt(select.dataset.rice-stock, 10);

            select.innerHTML = '';
            
            for (var i = 1; i <= riceStockValue; i++) {
                var option = document.createElement('option');
                option.value = i;
                option.innerHTML = i;
                select.add(option);
            }
        });
        // ページ読み込み時に合計を計算して表示する
        calculateTotal();
    });

    // 数量が変更されたときに小計を計算して表示する関数
    function calculateSubtotal(select) {
        var quantity = parseInt(select.value, 10);
        var priceElement = select.parentElement.nextElementSibling.nextElementSibling;
        var price = priceElement ? parseInt(priceElement.innerHTML, 10) : 0;
        var subtotal = quantity * price;
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
        document.getElementById('total').innerHTML = '合計: ' + total;
    }
    function selectPullDown(select) {
		
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
                <img src="${data.rice_image_path}" class="card-img-top" alt="Product Image">
                <div class="card-body">
                    <h5 class="card-title">${data.rice_name}</h5>
                    <p class="card-text">
                        ${data.rice_genre}<br>
                        ${data.rice_weight} kg<br>
                        ${data.rice_price} 円
                    </p>
                    <c:set var="ricePrice" value="${data.rice_price * data.cart_quantity}" />
                    <c:set var="totalPrice" value="${totalPrice + ricePrice}" />
                    
                    <select class="mySelect" data-rice-stock="${data.rice_stock}" name="cart_quantity_${data.rice_id}">
                        <c:forEach var="i" begin="1" end="${data.rice_stock}">
                            <option value="${i}" <c:if test="${i == data.cart_quantity}">selected</c:if>>${i}</option>
                        </c:forEach>
                    </select>
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
            <div class="card" style="width: 18rem; margin-bottom: 70px; float: right;">
                <div class="card-body">
                    <!-- 合計金額のフォントサイズを大きくし、色を赤に変更 -->
                    合計金額：<span id="overallTotalPrice" style="font-size: 1.5em; color: red;">${totalPrice}</span>円
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
