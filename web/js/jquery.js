var $navFooter = $('#nav-footer');
var $section = $('#video-container');
var $loadBtn = $('#load-btn');
var $btnSize = $('.pagingLoad-btn');
var $upload = $('#ebook-div');
var $uploadIcon = $('#upload-icon');
var $tabBtn = $('.tab');
var $tabContent = $('.tab-content');
var $uploadLink = $('#uploads-links');
var $close = $('.close');
var $modal = $('#myModal');
var $detailBtn = $('.detail-btn');
var $detailsBox = $('#details');
var $forum = $('#forum-form');
var $textarea = $('#user-comment');
// var $news = $('#list-news');
//hiding all children except the child link
$('#upload-children').hide();

//hiding menu at the beginning(nav)
$('nav').hide();

//hiding the apps menu
$('#apps-links').hide();

//hiding upload box
// $upload.hide();
$uploadLink.hide();

//hiding details box
$modal.hide();

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
//on mouseover change upload-item background color
$('.upload-item').mouseenter(function () {
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
    //marge left forum form
    // $forum.toggleClass('marginFormOnToggle');
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
    $uploadLink.toggle();
});

//make news menu active on click
$('#list-news').find('a').click(function () {
    $('.selected').removeClass('selected');
    $(this).addClass('selected');
});

//make textarea auto resizable
// $textarea.on('onkeydown', function () {
//     $(this).style.cssText = 'height:' + $(this).scrollHeight + 'px';
// });

function postComment() {
    var request;
    var comment = document.commentForm.userComment.value;
    var url = "forum.jsp?userComment=" + comment;

    request = new XMLHttpRequest();
    request.onreadystatechange = function () {
        if (request.readyState === 4){
            $('#commentLocation').innerHTML = request.responseText;
        }
    };
    request.open('GET', url, true);
    request.send();
}

//check if result for email is equal to 1
function displayResult() {
    if ($('#email-sent').val() === 1){
        alert("Mail sent");
    }
}
