<!-- いじるな -->
<HTML><%@ page language="java" pageEncoding="UTF-8"
    contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

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

<div class="row justify-content-center">
    <c:forEach var="data" items="${data}" varStatus="loopStatus">
        <div class="col-md-auto mb-3 d-flex justify-content-center rice-item">
            ${data.user_id}<br>
            ${data.user_name}<br>
            ${data.user_pass}<br>
            ${data.user_Email}<br>
            <form action = "<%= request.getContextPath() %>/come/userdelete" method = post>
	          	<button type="submit" class="btn btn-outline-warning">サイトから消す</button>
	          	<input type="hidden" name="user_id" value="${data.user_id}">
			</form>
    </c:forEach>
</div>


<!-- いじるな -->