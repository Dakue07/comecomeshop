<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>商品詳細</title>
    <%@include file="../../assets/template/header2.jsp" %>
    <style>
        .star-rating {
            unicode-bidi: bidi-override;
            color: #c5c5c5;
            font-size: 20px;
            height: 20px;
            width: 100px;
            margin: 0 auto;
            position: relative;
            padding: 0;
        }

        .star-rating > span {
            display: inline-block;
            position: absolute;
            left: 0;
            top: 0;
            overflow: hidden;
            width: 0;
            color: #ffca08;
        }

        .star-rating > span:before {
            content: "★";
            display: inline-block;
            width: 20px;
            height: 20px;
        }

        .star-rating > span.full {
            width: 100%;
        }
    </style>
</head>
<body>
    <div>
        商品詳細
        <c:forEach var="data" items="${data[0]}">
            <br><img src="${data.rice_image_path}" alt="${data.rice_name}"><br>名前:${data.rice_name}<br>値段:${data.rice_price}
        </c:forEach>
        <c:forEach var="data" items="${data[1]}">
            <br>レビュー:${data.review_comment}<br>
       
            評価:${data.review_star}
            
            <c:if test="${userBean.user_id eq data.user_id}">
                <form action="<%= request.getContextPath() %>/come/deletereview" method="post">
                    <input type="hidden" name="review_id" value="${data.review_id}">
                    <input type="hidden" name="rice_id" value="${data.rice_id}">
                    <input type="submit" value="削除">
                </form>
            </c:if>
        </c:forEach>
    </div>

    <!-- フッター -->
    <%@include file="../../assets/template/footer.jsp" %>
</body>
</html>
