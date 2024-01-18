<!-- いじるな -->
<HTML><%@ page language="java" pageEncoding="UTF-8"
    contentType="text/html; charset=UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<%@include file="../../assets/template/header2.jsp" %>


<!-- ここから下に書いてね -->
カート
<c:forEach var="data" items="${data}">
    <br>${data.rice_name}<br>${data.rice_genre}<br>${data.rice_made}<br>${data.rice_weight}<br>${data.cart_quantity}${data.rice_image_path}<br>
    ${data.rice_since}<br>${data.rice_stock}<br>${data.rice_price}<br>
	<select class="mySelect" data-rice-stock="${data.rice_stock}" name="cart_quantity" onchange="calculateSubtotal(this)">
        <c:forEach var="i" begin="1" end="${data.rice_stock}">
            <option value="${i}" <c:if test="${i == data.cart_quantity}">selected</c:if>>${i}</option>
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
            var riceStockValue = parseInt(select.dataset.riceStock, 10);
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
        var price = parseInt(select.parentElement.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.innerHTML, 10);
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
</script>



<!-- いじるな -->
<%@include file="../../assets/template/footer.jsp" %>
