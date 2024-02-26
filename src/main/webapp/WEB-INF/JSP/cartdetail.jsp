
<%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<c:set var="totalPrice" value="0" />

<!-- カートの中身 -->

<c:forEach var="data" items="${data}">
	<div class="card product_box">
		<div class="image_box">
			<img src="<%= request.getContextPath() %>${data.rice_image_path}"
				class="card-img-top, rice_img" alt="Product Image">
		</div>
		<div class="card-body card_product_info">
			<h4 class="card-title">${data.rice_name}${data.rice_weight}kg</h4>
			<p class="card-text" style="margin: 0;">
				品目:${data.rice_genre}<br> <span class="rice-price">単価:<a
					id="rice-price-num">${data.rice_price}</a>円
				</span>
			</p>
		</div>

		<div class="card_product_price">
			<c:set var="ricePrice"
				value="${data.rice_price * data.cart_quantity}" />
			<c:set var="totalPrice" value="${totalPrice + ricePrice}" />
			 個数: <select class="mySelect"
				data-rice-stock="${data.rice_stock}" name="absolute_cart_quantity"
				onChange="selectPullDown(this, '${data.rice_id}');">
				<c:forEach var="i" begin="1" end="${data.rice_stock}">
					<option value="${i}"
						<c:if test="${i == data.cart_quantity}">
    					    	  	id="selected" selected
    					    	  </c:if>>
						${i}</option>
				</c:forEach>
			</select> 個<br> 小計:<span class="subtotal">${data.cart_quantity * data.rice_price}</span>円
		</div>
		<div class="delete_btn">
			<form action="<%=request.getContextPath()%>/come/deleteCart"
				method="post">
				<button class="btn btn-danger">削除</button>
				<input type="hidden" name="rice_id" value="${data.rice_id}">
			</form>
		</div>
	</div>
</c:forEach>

<script>
document.getElementById("purchaseButton").addEventListener("click", function(event) {
    if (${totalPrice} == 0) {
        event.preventDefault();
        window.location.href = "<%=request.getContextPath()%>/come/productlist";
    }
});
</script>
