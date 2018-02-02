<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="css/normalize.css">
    <link rel="stylesheet" href="css/style.css">
    <script src="js/jquery-3.2.0.min.js"></script>
    <link rel="stylesheet" href="css/jquery.fancybox.min.css" media="screen">
    <script src="js/jquery.fancybox.min.js"></script>

    <title>News</title>
</head>
<body onload="loadNews()">
<jsp:include page="html/header.html"/>
<jsp:include page="html/uploads.html"/>
<jsp:include page="html/apps.html"/>
<jsp:include page="html/newNav.html"/>
<jsp:include page="html/nav.html"/>
<jsp:include page="html/newsResults.html"/>

<script>
    var $results = $('#result-video');
    var $search = $('#searchField');
    var $form = $('#search-form');
    var $heading = $('.video-heading p');
    //check input
    $form.submit(function (e) {
        e.preventDefault();
        //if input null
        if($search.val() === ''){
            alert('Cannot remain empty');
        }else {
            searchNews();
        }

    });

    //search any topic
    function searchNews() {
        $results.html('');
        $heading.html('');
        var $query = $search.val();
        $.get(
            'https://newsapi.org/v2/everything?q=' + $query + '&apiKey=2c8ae97c6dc547c18620257074aa7d60',
            function (data) {
                $.each(data.articles, function (i, article) {
                    console.log(data);
                    var output = getMainNewsView(article);
                    $results.append(output);
//                    $heading.append(article.totalResults);
                });
            }
        );
    }
    //get output for the main view news
    function getMainNewsView(article) {
        var id = article.source.id;
        var author = article.author;
        var title = article.title;
        var description = article.description;
        var url = article.url;
        var thumbnail = article.urlToImage;
        var date = article.publishedAt;

        var output;
        output = '<li class="list-item-news" data-fancybox data-type="iframe" data-src="'+ url + '">' +
        '<section style="position: absolute;cursor: pointer;"><h4>' + title + '</h4>' +
        '<p style="background: #1a2431;">'+ description + '</p></section>' +
//        '<section><small class="channel-date-news">*<span class="cTitle">' + author + ' </span>' + date + '</small></section>' +
        '<a data-fancybox data-type="iframe" data-src="' + url + '">' +
        '<img src="' + thumbnail + '" title="' + title + '\n\n' + description + '">' +
        '</a>' +
        '</li>' +
        '';
        return output;
    }
    //looad news on main page load
    function loadMainNews() {
        $results.html('');
        $.get(
            'https://newsapi.org/v2/top-headlines?country=us&apiKey=2c8ae97c6dc547c18620257074aa7d60',
            function (data) {
                $.each(data.articles, function (i, article) {
                    console.log(data);

                    var outPut = getMainNewsView(article);
                    $results.append(outPut);
                });
            }
        );
    }
    //looad news on page load
    function loadNews() {
        $results.html('');
        $.get(
            'https://newsapi.org/v2/top-headlines?sources=bbc-news&apiKey=2c8ae97c6dc547c18620257074aa7d60',
            function (data) {
                $.each(data.articles, function (i, article) {
                    console.log(data);

                    var outPut = getMainNewsView(article);
                    $results.append(outPut);
                });
            }
        );
    }
    //load sport articles on sport link clicked
    function loadSport() {
        $results.html('');
        $.get(
            'https://newsapi.org/v2/top-headlines?sources=bbc-sport&apiKey=2c8ae97c6dc547c18620257074aa7d60',
            function (data) {
                $.each(data.articles, function (i, article) {
                    console.log(data);
                    var outPut = getMainNewsView(article);
                    $results.append(outPut);
                });
            }
        );
    }
    //using ajax to avoid reload page for sport articles
    function loadSportAjax() {
        var xhttp = new XMLHttpRequest();
        xhttp.onreadystatechange = function () {
            if (this.readyState === 4 && this.status === 200){
                $('#result-video').innerHTML = this.responseText;
            }
        };
        xhttp.open('GET', loadSport(), true);
        xhttp.send();
    }
    //load financial
    function loadFinance() {
        $results.html('');
        $.get(
            'https://newsapi.org/v2/top-headlines?sources=financial-times&apiKey=2c8ae97c6dc547c18620257074aa7d60',
            function (data) {
                $.each(data.articles, function (i, article) {
                    console.log(data);
                    var outPut = getMainNewsView(article);
                    $results.append(outPut);
                });
            }
        );
    }
    //load fiance ajax
    function loadFinanceAjax() {
        var xhttp = new XMLHttpRequest();
        xhttp.onreadystatechange = function () {
            if(this.readyState === 4 && this.status === 200){
                $('#result-video').innerHTML = this.responseText;
            }
        };
        xhttp.open('GET', loadFinance(), true);
        xhttp.send();
    }
    //load geography
    function loadGeography() {
        $results.html('');
        $.get(
            'https://newsapi.org/v2/top-headlines?sources=national-geographic&apiKey=2c8ae97c6dc547c18620257074aa7d60',
            function (data) {
                $.each(data.articles, function (i, article) {
                    console.log(data);
                    var outPut = getMainNewsView(article);
                    $results.append(outPut);
                });
            }
        );
    }
    //load geography ajax
    function loadGeographyAjax() {
        var xhttp = new XMLHttpRequest();
        xhttp.onreadystatechange = function () {
            if(this.readyState === 4 && this.status === 200){
                $('#result-video').innerHTML = this.responseText;
            }
        };
        xhttp.open('GET', loadGeography(), true);
        xhttp.send();
    }
    //load future data
    function loadFuture() {
        $results.html('');
        $.get(
            'https://newsapi.org/v2/top-headlines?sources=next-big-future&apiKey=2c8ae97c6dc547c18620257074aa7d60',
            function (data) {
                $.each(data.articles, function (i, article) {
                    console.log(data);
                    var outPut = getMainNewsView(article);
                    $results.append(outPut);
                });
            }
        );
    }
    function loadFutureAjax() {
        var xhttp = new XMLHttpRequest();
        xhttp.onreadystatechange = function () {
            if (this.readyState === 4 && this.status === 200){
                $('#result-video').innerHTML = this.responseText;
            }
        };
        xhttp.open('GET', loadFuture(), true);
        xhttp.send();
    }
</script>
<%--<script type="text/javascript" src="js/bbc.js"></script>--%>
<script type="text/javascript" src="js/jquery.js"></script>
<%--<script type="text/javascript" src="js/videoSearch.js"></script>--%>
</body>
</html>
