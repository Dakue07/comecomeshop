var showPasswordButton = document.getElementById("showPasswordButton");
if (showPasswordButton) {
  showPasswordButton.addEventListener("click", togglePasswordVisibility);
}

function togglePasswordVisibility() {
  var passwordInput = document.getElementById("passwordInput");
  if (passwordInput) {
    if (passwordInput.type === "password") {
      passwordInput.type = "text";
      showPasswordButton.textContent = "非表示";
    } else {
      passwordInput.type = "password";
      showPasswordButton.textContent = "表示";
    }
  }
}
