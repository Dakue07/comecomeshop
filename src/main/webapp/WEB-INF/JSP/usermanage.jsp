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
        
        
        .box5 {
    		padding: 0.5em 1em;
    		margin: 2em 0;
    		border: double 5px #4ec4d3;
    		width: 50%; /* 追加: 横幅を50%に設定 */
		}

		.box5 p {
    		margin: 0; 
    		padding: 0;
		}
		
		
</style>

<body>
<a href="<%=request.getContextPath() %>/admin" class="btn btn-radius-solid">管理者トップへ戻る<i class="fas fa-angle-right fa-position-right"></i></a>

	
    <c:forEach var="data" items="${data}" varStatus="loopStatus">
    	<div class="box5">
            <b>ユーザーID：</b>${data.user_id}<br>
           	<b>名前：</b>${data.user_name}<br>
           	<b>email</b>:${data.user_Email}<br>
           	<form action = "<%= request.getContextPath() %>/come/deleteuser" method = post>
	       		<button type="submit">サイトから消す</button>
        		<input type="hidden" name="user_id" value="${data.user_id}">				
        	</form>
        </div>
    </c:forEach>
   


</body>
</HTML>