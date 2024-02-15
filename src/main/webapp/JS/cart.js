/**
 * 
 */

document.addEventListener('DOMContentLoaded', function () {
    // ページ読み込み時に合計を計算して表示する
    calculateTotal();
});

// 数量が変更されたときに小計を計算して表示する関数
function calculateSubtotal(select) {
    var quantity = parseInt(select.value, 10);
    var priceElement = select.closest('.card').querySelector('.card-text .rice-price #rice-price-num');
    var price = priceElement ? parseInt(priceElement.innerHTML, 10) : 0;
    var subtotal = quantity * price;

    console.log(subtotal);
    // 小計を表示するspan要素を取得して更新する
    select.nextElementSibling.innerHTML = subtotal;
    // 合計を計算して表示する関数を呼び出す
    calculateTotal();
}

// 合計を計算して表示する関数
function calculateTotal() {
    var subtotals = document.querySelectorAll('.subtotal');
    var total = 0;
    subtotals.forEach(function (subtotal) {
        total += parseInt(subtotal.innerHTML, 10);
    });

    document.getElementById('total').innerHTML = total;
}
// 個数が選択された時に呼び出される
// quantitySelect : 選択された個数
// riceId : rice_id
async function selectPullDown(quantitySelect, riceId) {
    
    var rice_quantity = quantitySelect.value;
    
    var params = new URLSearchParams();
    params.append("rice_id", riceId);
    params.append("absolute_cart_quantity", rice_quantity);
    params.append("ajax", "true");
    
    var response = await fetch('/comecomeshop/come/changequantity', {
        method: 'POST',
        headers: {
            'content-type': 'application/x-www-form-urlencoded',
            'credentials': 'include',
        },
        body: params
    });

    
    var newCart = document.createElement("div");
    newCart.setAttribute("id","cart");
    newCart.innerHTML = await response.text();
    document.querySelector("#cart").replaceWith(newCart);
}