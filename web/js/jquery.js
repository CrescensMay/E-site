$('#logo').click(function () {
    $(this).hide();
});

//hiding all children except the child link
$('#upload-children').hide();

//showing children on mouseover and hiding on mouseleave
$("#upload-links").mouseenter(function () {
    $('#upload-children').show();
}).mouseleave(function () {
    $('#upload-children').hide();
});
