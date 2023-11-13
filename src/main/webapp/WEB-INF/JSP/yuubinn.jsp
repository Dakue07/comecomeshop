<!-- いじるな -->
<HTML><%@ page language="java" pageEncoding="UTF-8"
    contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>

<%@include file="../../assets/template/header2.jsp" %>


<!-- ここから下に書いてね -->

	<span style="font-weight: bold; ">郵便番号</span>
	<input type="text" size="12" id="input_zip" /> <!--idはそのままでお願いします-->
	    
	<span style="font-weight: bold; ">住所１</span>
	<input type="text" size="32" id="input_state_town" />　<!--idはそのままでお願いします-->
	 
	<span style="font-weight: bold; ">住所２</span>
	<input type="text" size="32" id="input_street" />　<!--idはそのままでお願いします-->
	 
	     
	 <!-- 住所補完JavaScriptライブラリの読み込み -->
	<script type="text/javascript" src="https://postcode-jp.com/js/postcodejp.js" charset="utf-8"> </script>　<!--srcはそのままでお願いします-->
	<script type="text/javascript" src="${pageContext.request.contextPath}/JS/postcodejp_script.js" charset="utf-8"></script>　<!--srcはそのままでお願いします-->
	
	<!-- 11行目から23行目を書けば動くようになってるので自分でカスタマイズお願いします。 -->


<!-- いじるな -->
<%@include file="../../assets/template/footer.jsp" %>

