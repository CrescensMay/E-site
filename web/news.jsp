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
    $results = $('#result-video');

    function getMainNewsView(article) {
        var id = article.source.id;
        var author = article.author;
        var title = article.title;
        var description = article.description;
        var url = article.url;
        var thumbnail = article.urlToImage;
        var date = article.publishedAt;

        var output;
        output = '<li class="list-item-news">' +
        '<section data-fancybox data-type="iframe" data-src="'+ url + '" style="position: absolute;cursor: pointer;"><h4>' + title + '</h4>' +
        '<p>'+ description + '</p></section>' +
//        '<section><small class="channel-date-news">*<span class="cTitle">' + author + ' </span>' + date + '</small></section>' +
        '<a data-fancybox data-type="iframe" data-src="' + url + '">' +
        '<img src="' + thumbnail + '" title="' + title + '\n\n' + description + '">' +
        '</a>' +
        '</li>' +
        '';
        return output;
    }

    function loadNews() {
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
</script>
<%--<script type="text/javascript" src="js/bbc.js"></script>--%>
<script type="text/javascript" src="js/jquery.js"></script>
<%--<script type="text/javascript" src="js/videoSearch.js"></script>--%>
</body>
</html>
