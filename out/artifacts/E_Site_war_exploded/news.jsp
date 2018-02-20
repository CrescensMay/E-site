<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="css/normalize.css">
    <link rel="stylesheet" href="css/style.css">
    <script src="js/jquery-3.2.0.min.js"></script>
    <link rel="stylesheet" href="css/jquery.fancybox.min.css" media="screen">
    <script src="js/jquery.fancybox.min.js"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
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
    setTimeout(function () {
        swal('Notification', 'You Can Search Headlines News');
//        alert('You Can Go to main page for search by clicking the logo or menu icon!').fadeIn(3000).fadeOut(3000);
    },20000);
</script>
<script type="text/javascript" src="js/bbc.js"></script>
<script type="text/javascript" src="js/jquery.js"></script>
<%--<script type="text/javascript" src="js/videoSearch.js"></script>--%>
</body>
</html>
