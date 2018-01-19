var $navFooter = $('#nav-footer');
var $section = $('#video-container');
var $loadBtn = $('#load-btn');
var $btnSize = $('.pagingLoad-btn');
//hiding all children except the child link
$('#upload-children').hide();

//hiding menu at the beginning(nav)
$('nav').hide();

//hiding the apps menu
$('#apps-links').hide();

//showing children on mouseover and hiding on mouseleave
$("#upload-links").mouseenter(function () {
    $('#upload-children').show();
}).mouseleave(function () {
    $('#upload-children').hide();
});

//on mouseover change menu-item background color
$('.menu-item').mouseenter(function () {
    $(this).css('background-color','#fff');
    $(this).css('cursor','pointer');
}).mouseleave(function () {
    $(this).css('background-color','#f7f6ff');
});

//on mouseover change apps-item background color
$('.app-item').mouseenter(function () {
    $(this).css('background-color','#fff');
    $(this).css('cursor','pointer');
}).mouseleave(function () {
    $(this).css('background-color','#f7f6ff');
});

//toggle menu when menu button clicked and handle rotation of menu icon
$('#menu-icon').click(function () {
    $(this).toggleClass('rotateEffect');
    $navFooter.toggle();

    //toggle video container size when menu icon is clicked
    $section.toggleClass('toggleContainer');
});

//toggle apps menu on click
$('#apps-icon').click(function () {
    $(this).toggleClass('rotateEffect');
    $('#apps-links').toggle();
});

