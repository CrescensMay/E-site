<%--
  Created by IntelliJ IDEA.
  User: Crescens
  Date: 13/01/2018
  Time: 6:42 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <link rel="stylesheet" href="css/normalize.css">
    <link rel="stylesheet" href="css/style.css">
    <script src="js/jquery-3.2.0.min.js"></script>
    <link rel="stylesheet" href="css/jquery.fancybox.min.css" media="screen">
    <script src="js/jquery.fancybox.min.js"></script>

    <title>Home</title>
  </head>
  <body onload="loadVideo()">
  <jsp:include page="html/header.html"/>
  <jsp:include page="html/uploads.html"/>
  <jsp:include page="html/apps.html"/>
  <jsp:include page="html/nav.html"/>
  <jsp:include page="html/mainResults.html"/>

  <script type="text/javascript" src="js/jquery.js"></script>
  <script type="text/javascript" src="js/videoSearch.js"></script>
  </body>
</html>
