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


<div class="row">
    <c:forEach var="data" items="${data}" varStatus="loopStatus">
        <div class="col-md-3 mb-3">
            <div class="card rice-item">
                <div class="card-body">
                    <h5 class="card-title">ID: ${data.rice_id}</h5>
                    <p class="card-text">商品名: ${data.rice_name}</p>
                    <p class="card-text">種類: ${data.rice_genre}</p>
                    <p class="card-text">サイズ: ${data.rice_weight}kg</p>
                    <p class="card-text">生産地: ${data.rice_made}</p>
                    <p class="card-text">${data.rice_image_path}</p>
                    <p class="card-text">精米日: ${data.rice_since}</p>
                    <p class="card-text">在庫数: ${data.rice_stock}</p>
                    <p class="card-text">価格: ${data.rice_price}円</p>
                    <p class="card-text">
                        <c:if test="${data.rice_flag == true}">販売中</c:if>
                        <c:if test="${data.rice_flag == false}">販売停止中</c:if>
                    </p>
                    <div class="btn-group-vertical" role="group" aria-label="Vertical button group">
                        <form action="<%= request.getContextPath() %>/come/indecateproduct" method="post">
                            <button type="submit" class="btn btn-outline-primary">サイトに表示する</button>
                            <input type="hidden" name="rice_id" value="${data.rice_id}">
                        </form>
                        <form action="<%= request.getContextPath() %>/come/nonindecateproduct" method="post">
                            <button type="submit" class="btn btn-outline-danger">サイトから消す</button>
                            <input type="hidden" name="rice_id" value="${data.rice_id}">
                        </form>
                    </div>
                </div>
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
