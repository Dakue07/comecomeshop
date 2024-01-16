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
    <select class="mySelect" data-rice-stock="${data.rice_stock}" name="cart_quantity">
        <c:forEach var="i" begin="1" end="${data.rice_stock}">
            <option value="${i}" <c:if test="${i == data.cart_quantity}">selected</c:if>>${i}</option>
        </c:forEach>
    </select>
    <form action="<%= request.getContextPath() %>/come/deleteCart" method="post">
        <button class="btn btn-primary">削除</button>
        <input type="hidden" name="rice_id" value="${data.rice_id}">
    </form>
</c:forEach>

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
    });
</script>



<!-- いじるな -->
<%@include file="../../assets/template/footer.jsp" %>
