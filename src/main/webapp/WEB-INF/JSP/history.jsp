<!-- いじるな -->
<HTML><%@ page language="java" pageEncoding="UTF-8"
    contentType="text/html; charset=UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<%@include file="../../assets/template/header2.jsp" %>


<!-- ここから下に書いてね -->
購入履歴
<c:forEach var = "data" items = "${data}">
    <br><img src="${data.rice_image_path}" alt="${data.rice_name}">
	${data.rice_image_path}${data.rice_name}${data.order_quantity}${data.order_amount}
		<form action = "<%= request.getContextPath() %>/come/productdetail" method = post onsubmit="return checkUserId()">
			<button>ここ押したらOrderDetailに飛ぶよ</button><!--購入履歴ページから。削除はproductdetailに飛ばす -->
			<input type="hidden" name = "rice_id" value = "${data.rice_id}">
		</form>
		<form>
			<button>ここ押したらreviewが書ける予定</button>
		</form>
</c:forEach>


<!-- いじるな -->
<%@include file="../../assets/template/footer.jsp" %>
