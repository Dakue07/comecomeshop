<!-- いじるな -->
<HTML><%@ page language="java" pageEncoding="UTF-8"
    contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>



<!-- ここから下に書いてね -->
<style>
    body {
        text-align: center;
    }

    form {
        display: inline-block;
        text-align: left;
        max-width: 1000px; /* フォームの最大幅を設定 */
        width: 100%; /* 幅が最大幅より小さい場合、親要素の幅いっぱいに広がるように */
        margin: 70px auto; /* 上下に余白を追加し、水平方向に中央揃え */
        padding-left: 400px;
    }

    table {
        width: 100%;
    }
    
    .center-align {
        text-align: center;
    }
</style>
<h1>商品登録</h1>

<form action ="<%= request.getContextPath() %>/come/addproduct">
    <table>
        <tr>
            <td>米の名前</td>
            <td><input type="text" name="rice_name"></td>
        </tr>
        <tr>
            <td>米の種類</td>
            <td><input type="text" name="rice_genre"></td>
        </tr>
        <tr>
            <td>重さ</td>
            <td><input type="text" name="rice_weight"></td>
        </tr>
        <tr>
            <td>産地</td>
            <td><input type="text" name="rice_made"></td>
        </tr>
        <tr>
            <td>パス</td>
            <td><input type="text" name="rice_image_path"></td>
        </tr>
        <tr>
            <td>精米日</td>
            <td><input type="text" name="rice_since"></td>
        </tr>
        <tr>
            <td>在庫</td>
            <td><input type="text" name="rice_stock"></td>
        </tr>
        <tr>
            <td>値段</td>
            <td><input type="text" name="rice_price"></td>
        </tr>
         
    </table>
    <div class="center-align">
        	<input type="submit" value="登録">
    	 </div>
</form>

<a href="<%=request.getContextPath() %>/admin">管理者トップへ戻る</a>





<!-- いじるな -->

