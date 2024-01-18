<!-- いじるな -->
<HTML><%@ page language="java" pageEncoding="UTF-8"
    contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@include file="../../assets/template/header2.jsp" %>


<!-- ここから下に書いてね -->


<style>
	body {
	    font-family: Arial, sans-serif;
	}
	
	.modal-container {
	    display: none;
	    position: fixed;
	    top: 0;
	    left: 0;
	    width: 100%;
	    height: 100%;
	    background-color: rgba(0, 0, 0, 0.7);
	    align-items: center;
	    justify-content: center;
	}
	
	.modal-content {
	    background-color: #fff;
	    padding: 20px;
	    border-radius: 5px;
	    position: relative;
	    width: 80%;
	    max-width: 400px;
	    text-align: center;
	}
	
	.close-btn {
	    position: absolute;
	    top: 10px;
	    right: 10px;
	    font-size: 20px;
	    cursor: pointer;
	}
</style>


購入手続き<br>


受取場所<br>

<button id="chooseAddressBtn">住所選択</button><br>
<div id="modalContainer" class="modal-container">
	<div class="modal-content">
	    <span class="close-btn" onclick="closeModal()">&times;</span>
        <c:forEach var="data" items="${data[1]}">
        ${data.useraddress_receiver}<br>
        ${data.useraddress_postcode}<br>
        ${data.useraddress_state_city}<br>
        ${data.useraddress_street}<br>
       	</c:forEach>	        
    </div>
</div>

<button id="choosePayMentBtn">支払い方法選択</button><br>

<button id="ConfirmOrderBtn">注文確定</button>


<script>
document.getElementById('chooseAddressBtn').addEventListener('click', openModal)

function openModal() {
    document.getElementById('modalContainer').style.display = 'flex';
}

function closeModal() {
    document.getElementById('modalContainer').style.display = 'none';
}
</script>


<!-- いじるな -->
<%@include file="../../assets/template/footer.jsp" %>
