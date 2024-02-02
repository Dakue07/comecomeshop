<HTML>
<%@ page language="java" pageEncoding="UTF-8"
    contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@include file="../../assets/template/header2.jsp" %>

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

    .radio-group {
        display: flex;
        flex-direction: column;
        align-items: center;
        margin-top: 20px;
    }

    .radio-group input {
        margin-bottom: 10px;
    }
</style>

購入手続き<br>

<form action="<%= request.getContextPath() %>/come/urlsave" method="post">
	<input type="hidden" name="url" value="/createpost">
	<button type="submit" class="register2-link">新しく住所を登録する</button>
</form>

<form action="<%= request.getContextPath() %>/come/urlsave" method="post">
	<input type="hidden" name="url" value="/come/card">
	<button type="submit" class="register2-link">新しく支払い方法を追加する</button>
</form>

<form action="come/addorderdetail" method="post">
	<button type="button" onclick="toggleModal('address')">住所選択</button><br>
	<div id="address_modal" class="modal-container">
	    <div class="modal-content">
	        <span class="close-btn" onclick="toggleModal('address')">&times;</span>
	        <c:forEach var="data" items="${data[1]}">
	        <div class="radio-group">
	        <input type="radio" name="addressOption" value=${data.useraddress_id} checked>     
		        <label>
		            受取人:${data.useraddress_receiver}<br>
		            郵便番号:${data.useraddress_postcode}<br>
		            都道府県:${data.useraddress_state_city}<br>
		            市町村:${data.useraddress_street}<br>
		        </label>
		        </div>
	        </c:forEach>
	        
	            
	            
	      
	    </div>
	</div>
	
	<button type="button" onclick="toggleModal('payment')">支払い方法選択</button><br>
	<div  id="payment_modal" class="modal-container">
	    <div class="modal-content">
	        <span class="close-btn" onclick="toggleModal('payment')">&times;</span>
	        <c:forEach var="data" items="${data[2]}">
	        <div class="radio-group">
	        <input type="radio" name="paymentOption" value=${data.card_id} checked> 
	            カード番号:${data.card_replace_number}<br>
	            カード名義人:${data.card_holdername}<br>
	            有効期限:${data.card_validity}<br>
	        </div>
	        </c:forEach>
	    </div>
	</div>

<input type="submit" id="ConfirmOrderBtn" value="注文確定">
</form>


<script>
    function toggleModal(modalType) {
        var modal = document.getElementById(modalType + '_modal');
        modal.style.display = (modal.style.display === 'flex') ? 'none' : 'flex';
    }
</script>

<%@include file="../../assets/template/footer.jsp" %>
