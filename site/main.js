function openModal(src) {
    var modal = document.getElementById("myModal");
    var img = document.getElementById("img01");
    modal.style.display = "block";
    img.src = src;
}


var modal = document.getElementById("myModal");
var img = document.getElementById("img01");


var span = document.getElementsByClassName("close")[0];
span.onclick = function () {
    var modal = document.getElementById("myModal");
    modal.style.display = "none";
}


window.onclick = function (event) {
    if (event.target == modal || event.target == img) {
        modal.style.display = "none";
    }
}