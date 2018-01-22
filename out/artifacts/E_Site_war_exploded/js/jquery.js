var $navFooter = $('#nav-footer');
var $section = $('#video-container');
var $loadBtn = $('#load-btn');
var $btnSize = $('.pagingLoad-btn');
var $upload = $('#ebook-div');
var $uploadIcon = $('#upload-icon');
//hiding all children except the child link
$('#upload-children').hide();

//hiding menu at the beginning(nav)
$('nav').hide();

//hiding the apps menu
$('#apps-links').hide();

//hiding upload box
$upload.hide();

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

    //reduce video container size when menu icon is clicked
    $section.toggleClass('toggleContainer');
    //marge left upload box when menu opened
    $upload.toggleClass('toggleUploadBox');
});

//toggle apps menu on click
$('#apps-icon').click(function () {
    $(this).toggleClass('rotateEffect');
    $('#apps-links').toggle();
});

//trying to pop upload window
$uploadIcon.mouseenter(function () {
    $(this).css('cursor','pointer');
});
$uploadIcon.click(function () {
    $(this).toggleClass('rotateEffect');
    $upload.slideToggle();
});

