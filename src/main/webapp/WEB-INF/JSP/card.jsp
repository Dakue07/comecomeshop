<!-- いじるな -->
<HTML><%@ page language="java" pageEncoding="UTF-8"
    contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

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
</style>
<button id="addPaymentBtn">支払い方法の追加</button><br>

<div id="modalContainer" class="modal-container">

	<div class="modal-content">
	    <span class="close-btn" onclick="closeModal()">&times;</span>
	        <p>クレジットカードの追加</p>
	        <form action="come/addcard" method="post">
	        <table>
	        	<tr>
	        		<td>カード番号</td>
	        		<td><input type="tel" name="card_number" required></td>
	        	</tr>
	        	<tr>
	        		<td>クレジットカード名義人</td>
	        		<td><input type="text" name="card_holdername" required></td>
	        	</tr>
	        	<tr>
	        		<td>セキュリティコード</td>
	        		<td><input type="number" name="card_securitycode" maxlength="3" required></input></td>
	        	</tr>
	        	<tr>
	        		<td>有効期限</td>
	        		<td>
	        			<select name="month" value="01" required>
							<option value="01">01</option>
							<option value="02">02</option>
							<option value="03">03</option>
							<option value="04">04</option>
							<option value="05">05</option>
							<option value="06">06</option>
							<option value="07">07</option>
							<option value="08">08</option>
							<option value="09">09</option>
							<option value="10">10</option>
							<option value="11">11</option>
							<option value="12">12</option>
	        			</select>
				
						<select name="year" value="2024" required>
							<option value="2024">2024</option>
							<option value="2025">2025</option>
							<option value="2026">2026</option>
							<option value="2027">2027</option>
							<option value="2028">2028</option>
							<option value="2029">2029</option>
							<option value="2030">2030</option>
							<option value="2031">2031</option>
							<option value="2032">2032</option>
							<option value="2033">2033</option>
							<option value="2034">2034</option>
							<option value="2035">2035</option>
							<option value="2036">2036</option>
							<option value="2037">2037</option>
							<option value="2038">2038</option>
							<option value="2039">2039</option>
							<option value="2040">2040</option>
							<option value="2041">2041</option>
							<option value="2042">2042</option>
							<option value="2043">2043</option>
							<option value="2044">2044</option>
						</select>
					</td>
	        	</tr>
	        </table>
	        
	        <input type="submit" value="カードを追加" />
	        
	        </form>
    </div>
</div>

<c:forEach var="data" items="${data}"> 
		${data.card_number}<br>
		${data.card_holdername}<br>
		<form action = "<%= request.getContextPath() %>/come/deletecard" method = post>
			<input type="submit" value="このカードを削除する">
		</form>
		
	</c:forEach>


<script>
document.getElementById('addPaymentBtn').addEventListener('click', openModal);

function openModal() {
    document.getElementById('modalContainer').style.display = 'flex';
}

function closeModal() {
    document.getElementById('modalContainer').style.display = 'none';
}
</script>



<!-- いじるな -->
<%@include file="../../assets/template/footer.jsp" %>
