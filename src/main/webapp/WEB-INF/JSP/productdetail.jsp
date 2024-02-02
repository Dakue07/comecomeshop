<!-- いじるな -->
<HTML><%@ page language="java" pageEncoding="UTF-8"
    contentType="text/html; charset=UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<%@include file="../../assets/template/header2.jsp" %>


<!-- ここから下に書いてね -->

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


productdetail
<c:forEach var="data" items="${data[0]}">
	<br><img src="${data.rice_image_path}" alt="${data.rice_name}"><br>${data.rice_name}<br>${data.rice_price}
</c:forEach>

<c:forEach var="data" items="${data[1]}">
  <br>${data.review_comment}<br>
  <script>
    document.write(displayStars(${data.review_star}));
  </script>
  <br>${data.user_id}
  
  <!-- user_idが一致したら削除ボタンを表示 -->
  <c:if test="${userBean.user_id eq data.user_id}">
    <form action="<%= request.getContextPath() %>/come/deletereview" method="post">
      <input type="hidden" name="review_id" value="${data.review_id}">
      <input type="hidden" name="rice_id" value="${data.rice_id}">
      <input type="submit" value="削除">
    </form>
  </c:if>
</c:forEach>



<script>
function displayStars(starCount) {
  var starRatingContainer = document.createElement('div');
  starRatingContainer.classList.add('star-rating');
  
  for (var i = 0; i < 5; i++) {
    var starSpan = document.createElement('span');
    if (i < starCount) {
      starSpan.classList.add('full');
    }
    starRatingContainer.appendChild(starSpan);
  }
  
  return starRatingContainer;
}
</script>


<!-- いじるな -->
<%@include file="../../assets/template/footer.jsp" %>
