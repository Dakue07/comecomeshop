window.addEventListener("load",()=>{
    chooseAddress();
    choosePayment();
});

function openAddressModal(){
    document.querySelector(".address-modal").style.display = "block";
}
function closeAddressModal(){
    document.querySelector(".address-modal").style.display = "none";
}

function chooseAddress() {
    addressNo = document.querySelector(".address-list").querySelector("[name='addressOption']:checked").value;
    document.querySelector("#address-id").value = addressNo;
}


function openPaymentModal(){
    document.querySelector(".payment-modal").style.display = "block";
}
function closePaymentModal(){
    document.querySelector(".payment-modal").style.display = "none";
}

function choosePayment() {
    paymentNo = document.querySelector(".payment-list").querySelector("[name='paymentOption']:checked").value;
    document.querySelector("#payment-id").value = paymentNo;
}