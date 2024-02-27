<!-- いじるな -->
<HTML><%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html; charset=UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM"
	crossorigin="anonymous">
<!DOCTYPE html>




<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/CSS/style.css">
<%@include file="../../assets/template/header2.jsp"%>


<!-- ここから下に書いてね -->


<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/CSS/productlist.css">
<%-- <%@include file="../../assets/template/slideshow.jsp"%> --%>

<div class="product_list">
	<h1 class="infomation">商品一覧</h1>


	<div class="row justify-content-center m-4, cleanness"
		style="max-width: 100%;">
		<c:forEach var="data" items="${data}">
			<div class="col-md-auto mb-3 d-flex justify-content-center">
				<div class="card" style="width: 17rem;">
					<div class="card-body" style="min-height: 430px;">
						<form action="<%=request.getContextPath()%>/come/productdetail"
							method="post" style="text-align: center;">
							<button type="submit" class="btn-clear">
								<input type="hidden" name="rice_id" value="${data.rice_id}">
								<img
									src="<%= request.getContextPath() %>${data.rice_image_path}"
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
									action="<%=request.getContextPath()%>/come/addcart"
									method="post" onsubmit="return checkUserId()">
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
	</div>
</div>
<%
String judgeAttribute = (String) request.getAttribute("judge");
%>

<script>
window.onload = function() {
    var judgeAttribute = "<%=judgeAttribute%>";

    if (judgeAttribute === "ok") {
        alert("ご購入ありがとうございました！");
    } else if (judgeAttribute === "no"){
        alert("在庫がなくなってしまったので購入できませんでした。");
    } else if (judgeAttribute === "mail") {
        alert("お問い合わせが完了しました");
    }

    sessionStorage.removeItem("purchaseCompleted");
};

sessionStorage.setItem("purchaseCompleted", "true");

		
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

    function checkUserId() {
        var user_id = "${userBean.user_id}";
        if (!user_id || user_id.trim() === "") {
          window.location.href = "<%=request.getContextPath()%>/signin";
			return false;
		}
		return true;
	}
</script>


<!-- いじるな -->
<%@include file="../../assets/template/footer.jsp"%>