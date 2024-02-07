function openModal(src) {
    var modal = document.getElementById("myModal");
    var img = document.getElementById("img01");
    modal.style.display = "block";
    img.src = src;
}


var modal = document.getElementById("myModal");

var span = document.getElementsByClassName("close")[0];
span.onclick = function () {
    var modal = document.getElementById("myModal");
    modal.style.display = "none";
}


window.onclick = function (event) {
    if (event.target == modal) {
        modal.style.display = "none";
    }
}