
//hiding all children except the child link
$('#upload-children').hide();
//hiding menu at the beginning(nav)
$('nav').hide();

//showing children on mouseover and hiding on mouseleave
$("#upload-links").mouseenter(function () {
    $('#upload-children').show();
}).mouseleave(function () {
    $('#upload-children').hide();
});

//on mouseover change menu-item background color
$('.menu-item').mouseenter(function () {
    $(this).css('background-color','#dfdee6');
}).mouseleave(function () {
    $(this).css('background-color','#f7f6ff');
});

//toggle menu when menu button clicked and handle rotation of menu icon
$('#menu-icon').click(function () {
    $(this).toggleClass('rotateEffect');
    $('nav').toggle(200);
});



