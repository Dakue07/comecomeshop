<!-- いじるな -->
<HTML><%@ page language="java" pageEncoding="UTF-8"
    contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<link
    href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
    rel="stylesheet"
    integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM"
    crossorigin="anonymous">


<!-- ここから下に書いてね -->

<style>
    .f-left {
        flex: left;
    }

    .rice-item {
        margin: 10px; /* アイテムの間隔を調整 */
    }
</style>

<a href="<%=request.getContextPath() %>/admin">管理者トップへ戻る</a><br>

<a href="<%=request.getContextPath() %>/addproduct">商品を追加する</a>


<div class="row justify-content-center">
    <c:forEach var="data" items="${data}" varStatus="loopStatus">
        <div class="col-md-auto mb-3 d-flex justify-content-center rice-item">
            id:${data.rice_id}<br>
            ${data.rice_name}<br>
            ${data.rice_genre}<br>
            ${data.rice_weight}<br>
            ${data.rice_made}<br>
            ${data.rice_image_path}<br>
            ${data.rice_since}<br>
            ${data.rice_stock}<br>
            ${data.rice_price}<br>
            <c:if test="${data.rice_flag == true}">販売中</c:if>
            <c:if test="${data.rice_flag == false}">販売停止中</c:if><br>
            <div class="btn-group-vertical" role="group" aria-label="Vertical button group">
            	<c:if test="${data.rice_flag == true}">
            		<form action = "<%= request.getContextPath() %>/come/nonindecateproduct" method = post>
			          	<button type="submit" class="btn btn-outline-warning">サイトから消す</button>
			          	<input type="hidden" name="rice_id" value="${data.rice_id}">
			        </form>
			    </c:if>
			    <c:if test="${data.rice_flag == false}">
	            	<form action = "<%= request.getContextPath() %>/come/indecateproduct" method = post>
			          	<button type="submit" class="btn btn-outline-primary">サイトに表示する</button>
			          	<input type="hidden" name="rice_id" value="${data.rice_id}">
			        </form>
			    </c:if>
		        <form action="<%= request.getContextPath() %>/come/deleteproduct" method="post">
		        	<button type="submit" class="btn btn-outline-danger">商品削除</button>
		        	<input type="hidden" name="rice_id" value="${data.rice_id}">
		        </form>
			</div>
        </div>
        <%-- 4つごとに改行 --%>
        <c:if test="${loopStatus.index % 4 == 3}">
            <div class="w-100"></div>
        </c:if>
    </c:forEach>
</div>

<!-- いじるな -->
<%@include file="../../assets/template/footer.jsp" %>