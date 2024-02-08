<HTML>
<%@ page language="java" pageEncoding="UTF-8"
    contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<%@include file="../../assets/template/header2.jsp" %>
<style>
    body {
        font-family: Arial, sans-serif;
		background-image: url(/comecomeshop/images/ine.png);
        background-size: cover;
        background-repeat: no-repeat;
        background-attachment: fixed;
        background-color: rgba(122, 122, 122, 0.1); /* 透明度を指定 */
    }

    footer {
        position: sticky;
        top: 100vh;
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
        overflow: auto;
    }

    .modal-content {
        background-color: #fff;
        padding: 20px;
        border-radius: 5px;
        position: relative;
        width: 90%;
        max-width: 600px;
        text-align: center;
        max-height: 80%;
        overflow-y: auto;
        margin: auto;
        display: flex;
        flex-direction: column;
        justify-content: space-around;
    }

    .modal-content p {
        margin-bottom: 10px;
    }

    .modal-content table {
        width: 100%;
    }

    .modal-content input {
        width: 100%;
        margin-bottom: 10px;
    }

    .close-btn {
        position: absolute;
        top: 10px;
        right: 10px;
        font-size: 20px;
        cursor: pointer;
    }

    .cp_ipselect {
        overflow: hidden;
        width: 90%;
        margin: 2em auto;
        text-align: center;
    }

    .cp_ipselect select {
        width: 100%;
        padding-right: 1em;
        cursor: pointer;
        text-indent: 0.01px;
        text-overflow: ellipsis;
        border: none;
        outline: none;
        background: transparent;
        background-image: none;
        box-shadow: none;
        -webkit-appearance: none;
        appearance: none;
    }

    .cp_ipselect select::-ms-expand {
        display: none;
    }

    .cp_ipselect.cp_sl01 {
        position: relative;
        border-radius: 2px;
        border: 2px solid skyblue;
        background: #ffffff;
    }

    .cp_ipselect.cp_sl01::before {
        position: absolute;
        top: 0.8em;
        right: 0.8em;
        width: 0;
        height: 0;
        padding: 0;
        content: '';
        border-left: 6px solid transparent;
        border-right: 6px solid transparent;
        border-top: 6px solid skyblue;
        pointer-events: none;
    }

    .cp_ipselect.cp_sl01 select {
        padding: 8px 38px 8px 8px;
        color: black;
    }

    .btn_02 {
        display: block;
        text-align: center;
        vertical-align: middle;
        text-decoration: none;
        width: 120px;
        margin: auto;
        padding: 1rem 4rem;
        font-weight: bold;
        border: 2px solid #27acd9;
        background: #27acd9;
        color: #fff;
        transition: 0.5s;
    }

    .btn_02:hover {
        color: #27acd9;
        background: #fff;
    }

    .box1 {
    border: #ff69b4 solid 1px;
    font-size: 100%;
    padding: 15px;
    width: 45%; /* Adjust the width to fit two columns */
    margin: 10px; /* Add some margin between the elements */
    display: inline-block; /* Make the elements display inline-block */
    box-sizing: border-box; /* Include padding and border in the element's total width and height */
}

@media (max-width: 768px) {
    .box1 {
        width: 100%; /* Make it full width on smaller screens */
    }
}


section {
  max-width: 300px;
  margin: 0 auto;
}
button.btn_06-2 {
  display: block;
  color: #ffffff;
  font-size: 20px;
  font-weight: bold;
  line-height: 0.6;
  text-decoration: none;
  text-align: center;
  padding: 1.3em .5em;
  background: rgba(0, 0, 0, 0.2);
  border: 1px solid transparent;
  border-radius: 6px;
  box-sizing: border-box;
  max-width: 360px;
  margin: 0 auto;
  position: relative;
}
button.btn_06-2 span {
  position: relative;
  display: block;
  transform: translate(-3px, -3px);
  transition: 0.3s;
  z-index: +1;
}
button.btn_06-2:after {
  content: "";
  position: absolute;
  top: 0;
  left: 0;
  margin: auto;
  width: 100%;
  height: 100%;
  background: #0096e1;
  border-radius: 6px;
  box-sizing: border-box;
  transform: translate(-3px, -3px);
  transition: 0.3s;
}
button.btn_06-2:hover span {
  transform: translate(0, 0);
}
button.btn_06-2:hover:after {
  transform: translate(0, 0);
}
@media all and (max-width: 1023px) {
  button.btn_06-2 {
    font-size: 18px;
  }
}
@media all and (max-width: 767px) {
  button.btn_06-2 {
    font-size: 16px;
  }
}

    
</style>

<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Calendar" %>
<%@ page import="java.util.List" %>

<%
    List<String> months = new ArrayList<>();
    for (int i = 1; i <= 12; i++) {
        String month = String.format("%02d", i);
        months.add(month);
    }

    List<String> years = new ArrayList<>();
    int currentYear = Calendar.getInstance().get(Calendar.YEAR);
    for (int i = currentYear; i <= currentYear + 20; i++) {
        years.add(Integer.toString(i));
    }

    request.setAttribute("months", months);
    request.setAttribute("years", years);
%>



<section>
  <br><button class="btn_06-2" id="addPaymentBtn"><span>支払方法の追加</span></a><br>
</section>

<div id="modalContainer" class="modal-container">
    <div class="modal-content">
        <span class="close-btn" onclick="closeModal()">&times;</span>
        <p>クレジットカードの追加</p>
        <form action="come/addcard" method="post">
            <table>
                <tr>
                    <td>カード番号</td>
                    <td><input type="tel" name="card_number" class="cp_iptxt" minlength="16" maxlength="16" required></td>
                </tr>
                <tr>
                    <td>クレジットカード名義人</td>
                    <td><input type="text" name="card_holdername" required></td>
                </tr>
                <tr>
                    <td>セキュリティコード</td>
                    <td><input type="number" name="card_securitycode" minlength="3" maxlength="3" required></input></td>
                </tr>
                <tr>
                    <td>有効期限</td>
                    <td>
                        <div class="cp_ipselect cp_sl01">
                            <select name="month" required>
                                <c:forEach var="month" items="${months}">
                                    <option value="${month}">${month}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="cp_ipselect cp_sl01">
                            <select name="year" required>
                                <c:forEach var="year" items="${years}">
                                    <option value="${year}">${year}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </td>
                </tr>
            </table>
            <br>
            <input type="submit" class="btn_02" value="カードを追加" /><br>
        </form>
    </div>
</div>

<br>
<c:forEach var="data" items="${data}"> 
		<b>カード番号：</b>${data.card_replace_number}<br>
    <b>名義人：</b>${data.card_holdername}<br>
		<form action="<%= request.getContextPath() %>/come/deletecard" method="post">
			<input type="hidden" name="card_number" value="${data.card_number}">
			<button type="submit">このカードを削除する</button>
		</form>
</c:forEach>

<script>
    document.getElementById('addPaymentBtn').addEventListener('click', openModal);

    function openModal() {
        document.getElementById('modalContainer').style.display = 'block';
    }

    function closeModal() {
        document.getElementById('modalContainer').style.display = 'none';
    }
</script>


