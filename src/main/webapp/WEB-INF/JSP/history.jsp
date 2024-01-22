<!-- いじるな -->
<HTML><%@ page language="java" pageEncoding="UTF-8"
    contentType="text/html; charset=UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<%@include file="../../assets/template/header2.jsp" %>


<!-- ここから下に書いてね -->
購入履歴
<c:forEach var = "data" items = "${data}">
	<a href="<%=request.getContextPath() %>/come/productdetail" style="text-decoration:none;">
		${data.rice_image_path}<br>${data.rice_name}<br>${data.order_quantity}<br>${data.order_amount}
		<button>レビュー削除</button><!--後でforEach使って購入履歴の数ぶん追加する。削除はproductdetailに飛ばす -->
	</a>
</c:forEach>


<!-- いじるな -->
<%@include file="../../assets/template/footer.jsp" %>
