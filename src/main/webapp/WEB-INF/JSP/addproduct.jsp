<!DOCTYPE html>
<html lang="ja">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>商品登録</title>
    <style>
        body {
            text-align: center;
            background-color: #dcdcdc;
        }

        form {
            display: inline-block;
            text-align: left;
            max-width: 1000px;
            width: 100%;
            margin: 70px auto;
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
            width: 50%;
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
            display: inline-block;
            padding: 8px 20px;
            margin: 20px 0;
            text-align: center;
            text-decoration: none;
            color: #333;
            font-size: 16px;
            cursor: pointer;
        }

        a.btn-radius-solid:hover {
            background: -webkit-gradient(linear, left bottom, left top, from(#fdfbfb), to(#ebedee));
            background: -webkit-linear-gradient(bottom, #fdfbfb 0%, #ebedee 100%);
            background: linear-gradient(to top, #fdfbfb 0%, #ebedee 100%);
        }
        
    </style>
</head>

<body>
    <h1>商品登録</h1>

    <form action="<%= request.getContextPath() %>/come/addproduct" method="post">

        <table>
        	   <tr>
            <td><b>米の名前</b></td>
            <td class="cp_iptxt"><input type="text" name="rice_name"></td>
        </tr>
        <tr>
            <td><b>米の種類</b></td>
            <td class="cp_iptxt"><input type="text" name="rice_genre"></td>
        </tr>
        <tr>
            <td><b>重さ</b></td>
            <td class="cp_iptxt"><input type="text" name="rice_weight"></td>
        </tr>
        <tr>
            <td><b>産地</b></td>
            <td class="cp_iptxt"><input type="text" name="rice_made"></td>
        </tr>
        <tr>
            <td><b>パス</b></td>
            <td class="cp_iptxt"><input type="text" name="rice_image_path"></td>
        </tr>
        <tr>
            <td><b>精米日</b></td>
            <td class="cp_iptxt"><input type="text" name="rice_since"></td>
        </tr>
        <tr>
            <td><b>在庫</b></td>
            <td class="cp_iptxt"><input type="text" name="rice_stock"></td>
        </tr>
        <tr>
            <td><b>値段</b></td>
            <td class="cp_iptxt"><input type="text" name="rice_price"></td>
        </tr>
        </table>

        <button class="btn btn-radius-solid">登録<i class="fas fa-angle-right fa-position-right"></i></button>

    </form>

	
    	<a href="<%=request.getContextPath() %>/admin">管理者トップへ戻る</a>
	
</body>

</html>
