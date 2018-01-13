$('#logo').click(function () {
    $(this).hide();
});

//hiding the search box and button inside it at the page loading
$('#searchBox').hide();
$('#searchBtn').hide();

//showing the search box and hiding span when label span clicked
$('#searchSymbol').click(function () {
    $(this).hide(500);
    $('#searchBox').show(600);
    $('#searchBtn').show(600);
});
