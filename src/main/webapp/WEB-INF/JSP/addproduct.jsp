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
    
    .cp_iptxt {
        position: relative;
        width: 80%;
        margin: 40px 3%;
    }
    
    .cp_iptxt input[type='text'] {
        font: 15px/24px sans-serif;
        box-sizing: border-box;
        width: 50%; /* テキストボックスの幅を小さくする */
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
}

a.btn-radius-solid:hover {
  background: -webkit-gradient(linear, left bottom, left top, from(#fdfbfb), to(#ebedee));
  background: -webkit-linear-gradient(bottom, #fdfbfb 0%, #ebedee 100%);
  background: linear-gradient(to top, #fdfbfb 0%, #ebedee 100%);
}


</style>
<h1>商品登録</h1>

<form action ="<%= request.getContextPath() %>/come/addproduct">
    
    <table>
        <tr>
            <td>米の名前</td>
            <td class="cp_iptxt"><input type="text" name="rice_name"></td>
        </tr>
        <tr>
            <td>米の種類</td>
            <td class="cp_iptxt"><input type="text" name="rice_genre"></td>
        </tr>
        <tr>
            <td>重さ</td>
            <td class="cp_iptxt"><input type="text" name="rice_weight"></td>
        </tr>
        <tr>
            <td>産地</td>
            <td class="cp_iptxt"><input type="text" name="rice_made"></td>
        </tr>
        <tr>
            <td>パス</td>
            <td class="cp_iptxt"><input type="text" name="rice_image_path"></td>
        </tr>
        <tr>
            <td>精米日</td>
            <td class="cp_iptxt"><input type="text" name="rice_since"></td>
        </tr>
        <tr>
            <td>在庫</td>
            <td class="cp_iptxt"><input type="text" name="rice_stock"></td>
        </tr>
        <tr>
            <td>値段</td>
            <td class="cp_iptxt"><input type="text" name="rice_price"></td>
        </tr>
    </table>
    
    
    <a href="" class="btn btn-radius-solid">登録<i class="fas fa-angle-right fa-position-right"></i></a>
    
</form>

<a href="<%=request.getContextPath() %>/admin">管理者トップへ戻る</a>

<!-- いじるな -->
