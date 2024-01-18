<HTML>
<%@ page language="java" pageEncoding="UTF-8"
    contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<%@include file="../../assets/template/header2.jsp" %>

<!-- ここから下に書いてね -->

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
