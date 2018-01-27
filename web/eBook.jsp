<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="css/normalize.css">
    <link rel="stylesheet" href="css/style.css">
    <script src="js/jquery-3.2.0.min.js"></script>
    <link rel="stylesheet" href="css/jquery.fancybox.min.css" media="screen">
    <script src="js/jquery.fancybox.min.js"></script>
    <title>E-Book</title>
</head>
<body onload="hideOnLoad()">
    <jsp:include page="html/header.html"/>
    <jsp:include page="html/uploads.html"/>
    <jsp:include page="html/apps.html"/>
    <jsp:include page="html/nav.html"/>
    <jsp:include page="resultEbook.jsp"/>
    <jsp:include page="description.jsp"/>

    <script type="text/javascript" src="js/jquery.js"></script>
</body>
</html>
