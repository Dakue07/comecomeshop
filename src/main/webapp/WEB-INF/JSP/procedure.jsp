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
    
    form {
    display: flex;
    justify-content: space-between; /* Distribute the buttons evenly */
    margin-top: 20px; /* Add some top margin for spacing */
	}
	
	button {
    	padding: 10px;
    	margin: 0 5;
    	cursor: pointer;
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
    	height: auto;
    	max-height: 80vh;
    	overflow-y: auto;
        background-color: #fff;
        padding: 20px;
        border-radius: 5px;
        position: relative;
        width: 80%;
        max-width: 400px;
        text-align: center;
    }

    .close-btn {
    	position: sticky;
        top: 10px;
        left: 300px;
        font-size: 20px;
        cursor: pointer;
        width: 20px;
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
    
	body {
    	min-height: 100vh;
    	margin: 0;
    	display: flex;
    	flex-direction: column;
	}

	header {
    	position: sticky;
    	top: 0;
    	width: 100%;
    	z-index: 1000; /* Ensure the header stays on top */
	}

	main {
    	margin-top: 80px; /* Adjust the value based on your header height */
	}

	footer {
    	margin-top: auto;
	}

	form {
    	margin-top: 20px; /* Adjust the value based on your layout preferences */
	}
	
	h2 {
		text-align: center;
	}


</style>

<h2>購入手続き</h2><br>

<form action="<%= request.getContextPath() %>/come/urlsave" method="post">
	<input type="hidden" name="url" value="/createpost">
	<button type="submit" class="register2-link">新しく住所を登録する</button>
</form>

<form action="<%= request.getContextPath() %>/come/urlsave" method="post">
	<input type="hidden" name="url" value="/come/card">
	<button type="submit" class="register2-link">新しく支払い方法を追加する</button>
</form>


<form action="come/addorderdetail" method="post">
	<button type="button" onclick="toggleModal('address')" style="position: absolute; left: 20%;">住所選択</button><br>
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
	
	<button type="button" onclick="toggleModal('payment')" style="position: relative;">支払い方法選択</button><br>
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

<input type="submit" id="ConfirmOrderBtn" value="注文確定" style="position: absolute; right: 20%; height: 50px;">
</form>


<script>
    function toggleModal(modalType) {
        var modal = document.getElementById(modalType + '_modal');
        modal.style.display = (modal.style.display === 'flex') ? 'none' : 'flex';
    }
</script>

<%@include file="../../assets/template/footer.jsp" %>