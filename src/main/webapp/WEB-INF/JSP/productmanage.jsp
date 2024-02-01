<!-- いじるな -->
<HTML>
<%@ page language="java" pageEncoding="UTF-8"
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
    
    body {
    	background-color: #dcdcdc;
    }
    
    .cp_iptxt {
            position: relative;
            width: 80%;
            margin: 40px 3%;
        }

        .cp_iptxt input[type='text'] {
            font: 15px/24px sans-serif;
            box-sizing: border-box;
            width: 50%;
            padding: 0.3em;
            transition: 0.3s;
            letter-spacing: 1px;
            color: #aaaaaa;
            border: 1px solid #1b2538;
            border-radius: 4px;
        }

        .cp_iptxt input[type='text']:focus {
            border: 1px solid #da3c41;
            outline: none;
            box-shadow: 0 0 5px 1px rgba(218, 60, 65, .5);
        }

        a.btn-radius-solid {
            border: 1px solid #ccc;
            background: #f1e767;
            background: -webkit-gradient(linear, left top, left bottom, from(#fdfbfb), to(#ebedee));
            background: -webkit-linear-gradient(top, #fdfbfb 0%, #ebedee 100%);
            background: linear-gradient(to bottom, #fdfbfb 0%, #ebedee 100%);
            -webkit-box-shadow: inset 1px 1px 1px #fff;
            box-shadow: inset 1px 1px 1px #fff;
            display: inline-block;
            padding: 8px 20px;
            margin: 20px 0;
            text-align: center;
            text-decoration: none;
            color: #333;
            font-size: 16px;
            cursor: pointer;
        }

        a.btn-radius-solid:hover {
            background: -webkit-gradient(linear, left bottom, left top, from(#fdfbfb), to(#ebedee));
            background: -webkit-linear-gradient(bottom, #fdfbfb 0%, #ebedee 100%);
            background: linear-gradient(to top, #fdfbfb 0%, #ebedee 100%);
        }
</style>

<body>
<a href="<%= request.getContextPath() %>/admin" class="btn btn-radius-solid" style="text-decoration:none;">管理者トップへ戻る<i class="fas fa-angle-right fa-position-right"></i></a>

<a href="<%= request.getContextPath() %>/addproduct" class="btn btn-radius-solid" style="text-decoration:none;">商品を追加する<i class="fas fa-angle-right fa-position-right"></i></a>


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
                    <img src="<%= request.getContextPath() %>${data.rice_image_path}" alt="商品の画像" class="card-img-top">
                    <p class="card-text">収穫日: ${data.rice_since}月</p>
                    <p class="card-text">在庫数: ${data.rice_stock}</p>
                    <p class="card-text">価格: ${data.rice_price}円</p>
                    <p class="card-text">
                        <c:if test="${data.rice_flag == true}">販売中</c:if>
                        <c:if test="${data.rice_flag == false}">販売停止中</c:if>
                    </p>
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
				        <form action="<%= request.getContextPath() %>/come/adminreview" method="post">
				        	<button type="submit" class="btn btn-outline-danger">review一覧</button>
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

</body>
</HTML>