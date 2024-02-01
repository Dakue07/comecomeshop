<!-- いじるな -->
<HTML><%@ page language="java" pageEncoding="UTF-8"
    contentType="text/html; charset=UTF-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM"
	crossorigin="anonymous">
<!DOCTYPE html>


<%@include file="../../assets/template/header2.jsp" %>


<!-- ここから下に書いてね -->
<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
			integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz"
			crossorigin="anonymous"></script>

<style>
    body {
        background-image: url(/comecomeshop/images/backgroundine.png);
        background-size: cover;
        background-repeat: no-repeat;
        background-attachment: fixed;
        background-color: rgba(122, 122, 122, 1.0); /* 透明度を指定 */
    }
    .cleanness {
    	opacity: 0.8;
    }
    .infomation {
    	text-align: center;
    	color: #143204;
    	font-family: "Yu Gothic", cursive, fantasy;
    	font-size: 350%;
    	font-weight: bold;
    	opacity: 0.7;
    }
   .btn-clear {
    	border: none;
    	background-color: #ffffff;
    }
</style>


<%@include file="../../assets/template/slideshow.jsp" %>

<h1 class="infomation">商品一覧</h1>

<div class="row justify-content-center m-4, cleanness" style="max-width: 100%;">
  <c:forEach var="data" items="${data}">
    <div class="col-md-auto mb-3 d-flex justify-content-center">
      <div class="card" style="width: 17rem;">
        <div class="card-body">
      	  <button onclick="window.location='<%= request.getContextPath() %>/come/productdetail';" class="btn-clear">
        
        	<img src="<%= request.getContextPath() %>${data.rice_image_path}" class="card-img-top" alt="${data.rice_name}">
      
          	<h4 class="card-title">${data.rice_name}</h4>
         	<h5>重量:${data.rice_weight}kg</h5>
          	<h5>価格:${data.rice_price}円</h5>
      	  </button>
          <form action = "<%= request.getContextPath() %>/come/addcart" method = post onsubmit="return checkUserId()">
          <select class="mySelect" data-rice-stock="${data.rice_stock}" name="cart_quantity">
    	  </select>
          	<button class="btn btn-primary">カートへ入れる</button>
          	<input type="hidden" name="rice_id" value="${data.rice_id}">
          </form>
        </div>
      </div>
    </div>
  </c:forEach>
</div>

<script>
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
          window.location.href = "<%=request.getContextPath() %>/signin";
          return false; 
        }
        return true; 
	}
</script>


	<!-- いじるな -->
	<%@include file="../../assets/template/footer.jsp" %>