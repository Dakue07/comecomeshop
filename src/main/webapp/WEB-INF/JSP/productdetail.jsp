<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>商品詳細</title>
    <%@include file="../../assets/template/header2.jsp" %>
</head>
<body>
    <div>
        商品詳細
        <c:forEach var="data" items="${data[0]}">
            <br><img src="${data.rice_image_path}" alt="${data.rice_name}"><br>名前:${data.rice_name}<br>値段:${data.rice_price}<br>
        </c:forEach>
        review一覧
        <c:forEach var="data" items="${data[1]}">
            <div class="star">${data.review_star}</div>
            ${data.review_comment}<br><br>
            
            <c:if test="${userBean.user_id eq data.user_id}">
                <form action="<%= request.getContextPath() %>/come/deletereview" method="post">
                    <input type="hidden" name="review_id" value="${data.review_id}">
                    <input type="hidden" name="rice_id" value="${data.rice_id}">
                    <input type="submit" value="削除">
                </form>
            </c:if>
        </c:forEach>
    </div>
    
    <script>
    document.addEventListener("DOMContentLoaded", function() {
        var starElements = document.querySelectorAll(".star");
        starElements.forEach(function(starElement) {
            var reviewStar = parseInt(starElement.textContent);
            starElement.innerHTML = "";
            for (var i = 0; i < reviewStar; i++) {
                var starSpan = document.createElement("span");
                starSpan.innerHTML = "★";
                starSpan.style.color = "gold";
                starElement.appendChild(starSpan);
            }
        });
    });
    		
    </script>

<!-- フッター -->
<%@include file="../../assets/template/footer.jsp" %>
</body>
</html>
