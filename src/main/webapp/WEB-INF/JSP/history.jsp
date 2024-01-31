<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
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

    .radio-group {
        display: flex;
        flex-direction: column;
        align-items: center;
        margin-top: 20px;
    }

    .radio-group input {
        margin-bottom: 10px;
    }

    .rating-buttons button {
        background: none;
        border: none;
        cursor: pointer;
        font-size: 24px;
    }

    .rating-buttons button.selected {
        color: gold;
    }
</style>

<!-- ここから下に書いてね -->
購入履歴
<c:forEach var="data" items="${data}">
    <br><img src="<%= request.getContextPath() %>${data.rice_image_path}" alt="${data.rice_name}">
    ${data.rice_image_path}${data.rice_name}個数${data.order_quantity}合計${data.order_amount}
    <form action="<%= request.getContextPath() %>/come/productdetail" method="post" onsubmit="return checkUserId()">
        <button>ここ押したらproductDetailに飛ぶよ</button>
        <!-- 購入履歴ページから。削除はproductdetailに飛ばす -->
        <input type="hidden" name="rice_id" value="${data.rice_id}">
    </form>
    <button type="button" onclick="toggleModal('review', '${data.rice_id}')">reviewの追加</button><br>
    <div id="review_modal" class="modal-container">
        <div class="modal-content">
            <span class="close-btn" onclick="closeModal()">&times;</span>
            <p>reviewの追加</p>
            <form id="review_form" action="<%= request.getContextPath() %>/come/addreview" method="post">
                <!-- モーダル内のボタンを変更 -->
                <button type="button" onclick="submitReviewForm()">reviewの追加</button><br>
                <table>
                    <tr>
                        <td>評価</td>
                        <td>
                            <div class="rating-buttons">
                                <button type="button" onclick="setRating(1)"><i class="fas fa-star"></i></button>
                                <button type="button" onclick="setRating(2)"><i class="fas fa-star"></i></button>
                                <button type="button" onclick="setRating(3)"><i class="fas fa-star"></i></button>
                                <button type="button" onclick="setRating(4)"><i class="fas fa-star"></i></button>
                                <button type="button" onclick="setRating(5)"><i class="fas fa-star"></i></button>
                            </div>
                            <input type="hidden" name="review_star" id="evaluation" value="1">
                            <input type="hidden" name="rice_id" id="rice_id_input" value="">
                        </td>
                    </tr>
                    <tr>
                        <td>コメント</td>
                        <td>
                            <input type="text" name="review_comment">
                        </td>
                    </tr>
                </table>
            </form>
        </div>
    </div>
</c:forEach>

<script>
    function submitReviewForm() {
        // フォーム送信
        document.getElementById('review_form').submit();
        // モーダルを手動で閉じる
        closeModal();
    }
 
    function initializeRating() {
        var initialRating = 1;
        document.getElementById('evaluation').value = initialRating;
        updateStarRating(initialRating);
    }

    function toggleModal(modalType, riceId) {
        var modal = document.getElementById(modalType + '_modal');
        modal.style.display = (modal.style.display === 'flex') ? 'none' : 'flex';

        // rice_idを表示してみる
        console.log("rice_id: " + riceId);

        // rice_idをhidden inputに設定
        document.getElementById('rice_id_input').value = riceId;
    }

    function closeModal() {
        var modal = document.getElementById('review_modal');
        modal.style.display = 'none';
    }

    function setRating(rating) {
        document.getElementById('evaluation').value = rating;
        updateStarRating(rating);
    }

    function updateStarRating(rating) {
        var buttons = document.querySelectorAll('.rating-buttons button');
        buttons.forEach(function(button, index) {
            button.classList.toggle('selected', index + 1 <= rating);
        });
    }

    window.addEventListener('load', initializeRating);
</script>

<%@include file="../../assets/template/footer.jsp" %>
