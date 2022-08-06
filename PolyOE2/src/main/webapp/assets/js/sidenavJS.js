let btn = document.querySelector("#btn");
var sidebar = document.querySelector(".sidebar");

btn.onclick = function () {
    sidebar.classList.toggle("myactive");
}