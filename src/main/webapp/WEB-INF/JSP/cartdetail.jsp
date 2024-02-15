<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:forEach var="data" items="${data}">
	<div class="col-md-auto mb-3 d-flex justify-content-center">
		<div class="card" style="width: 17rem;">
			<div class="card-body" style="min-height: 430px;">
				<form action="<%=request.getContextPath()%>/come/productdetail"
					method="post" style="text-align: center;">
					<button type="submit" class="btn-clear">
						<input type="hidden" name="rice_id" value="${data.rice_id}">
						<img src="<%= request.getContextPath() %>${data.rice_image_path}"
							class="card-img-top rice_image" alt="${data.rice_name}">

						<h4 class="card-title">${data.rice_name}
							${data.rice_weight}kg</h4>
						<h5>価格:${data.rice_price}円</h5>
				</form>
				</button>
				<c:choose>
					<c:when test="${data.rice_stock == 0}">
						<p style="color: red;">在庫がありません</p>
					</c:when>
					<c:otherwise>
						<form class="cart_buttom"
							action="<%=request.getContextPath()%>/come/addcart" method="post"
							onsubmit="return checkUserId()">
							<select class="mySelect" style="width: 53.6px;"
								data-rice-stock="${data.rice_stock}" name="cart_quantity">
							</select> <input type="hidden" name="rice_id" value="${data.rice_id}">
							<button class="btn btn-primary">カートへ入れる</button>
						</form>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</div>
</c:forEach>