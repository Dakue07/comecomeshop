/**
 * 
 */

document.addEventListener('DOMContentLoaded', function () {
    // ページ読み込み時に合計を計算して表示する
    calculateTotal();
});


// 合計を計算して表示する関数
function calculateTotal() {
    var subtotals = document.querySelectorAll('.subtotal');
    var total = 0;
    subtotals.forEach(function (subtotal) {
        total += parseInt(subtotal.innerHTML, 10);
    });

    document.getElementById('total').innerText = total;
}
// 個数が選択された時に呼び出される
// quantitySelect : 選択された個数
// riceId : rice_id
async function selectPullDown(quantitySelect, riceId) {
    
    var rice_quantity = 0;
    
    rice_quantity = quantitySelect.value
    
    var params = new URLSearchParams();
    params.append("rice_id", riceId);
    params.append("absolute_cart_quantity", rice_quantity);
    
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
    newCart.setAttribute("class","cart");
    newCart.innerHTML = await response.text();

    var prices = newCart.querySelectorAll(".subtotal");

    var total = 0;
    for(var price of prices) {
        total += parseInt(price.innerHTML, 10);
    }

    document.querySelector("#total").innerText = total;


    document.querySelector("#cart").replaceWith(newCart);
}