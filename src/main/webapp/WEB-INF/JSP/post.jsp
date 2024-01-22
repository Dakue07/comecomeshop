<HTML><%@ page language="java" pageEncoding="UTF-8"
    contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<%@include file="../../assets/template/header2.jsp" %>

<!-- ここから下に書いてね -->

<style>
    h1 {
        text-align: center;
        line-height: 200px;
    }

    /* Center-align the link text */
    a.register-link,
    a.register2-link {
        display: block;
        text-align: center;
        line-height: 100px;
        color: #0066FF;
    }

    /* Style for address container */
    .address-container {
        display: flex;
        flex-wrap: wrap;
        justify-content: space-around;
    }

    /* Style for each address item */
    .address-item {
        width: 30%; /* Adjust the width as needed */
        background: #ffe4e1;
        border: #ff69b4 solid 2px;
        font-size: 80%;
        padding: 20px;
        margin: 10px;
    }
</style>

<c:if test="${empty data}">
    <h1>住所が登録されていません</h1>
    <a class="register-link" href="<%= request.getContextPath() %>/createpost">新しく住所を登録する</a>
</c:if>

<c:if test="${not empty data}">
    <div class="address-container">
        <c:forEach var="data" items="${data}">
            <div class="address-item">
                郵便番号：${data.useraddress_receiver}<br>
                都道府県：${data.useraddress_postcode}<br>
                市町村・番地(部屋番号・建物名)：${data.useraddress_state_city}<br>
                受取人：${data.useraddress_street}<br>
                <form action="<%= request.getContextPath() %>/come/deletepost" method="post">
                    <input type="hidden" name="user_id" value="${data.user_id}">
                    <input type="hidden" name="useraddress_receiver" value="${data.useraddress_receiver}">
                    <input type="hidden" name="useraddress_postcode" value="${data.useraddress_postcode}">
                    <input type="hidden" name="useraddress_state_city" value="${data.useraddress_state_city}">
                    <input type="hidden" name="useraddress_street" value="${data.useraddress_street}">
                    <input type="submit" value="この住所を削除する">
                </form>
            </div>
        </c:forEach>
    </div>
</c:if>

<a class="register2-link" href="<%= request.getContextPath() %>/createpost">新しく住所を登録する</a>

<!-- いじるな -->
<%@include file="../../assets/template/footer.jsp" %>
