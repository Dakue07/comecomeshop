<!-- いじるな -->
<HTML><%@ page language="java" pageEncoding="UTF-8"
    contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>



<!-- ここから下に書いてね -->
<a href="<%=request.getContextPath() %>/admin">管理者トップへ戻る</a><br>

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
        <tr>
            <input type="submit" value="登録">
        </tr>
    </table>
</form>





<!-- いじるな -->
<%@include file="../../assets/template/footer.jsp" %>
