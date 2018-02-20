<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="icon" href="images/logo1.png">
    <link rel="stylesheet" href="css/normalize.css">
    <link rel="stylesheet" href="css/style.css">
    <script src="js/jquery-3.2.0.min.js"></script>
    <link rel="stylesheet" href="css/jquery.fancybox.min.css" media="screen">
    <script src="js/jquery.fancybox.min.js"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <title>About Us</title>
</head>
<body>
<jsp:include page="html/header.html"/>
<jsp:include page="html/uploads.html"/>
<jsp:include page="html/apps.html"/>
<jsp:include page="html/nav.html"/>
<jsp:include page="html/aboutUs.html"/>

<script>
    var $searbtn = $('#searchSubmit');
    var $searchBar = $('#searchField');
    $searchBar.prop('disabled', true);
    $searbtn.prop('disabled', true);
    setTimeout(function () {
        swal('Notification', 'You Can Go to Homepage for Video Search by Clicking the Logo or Menu Icon!');
    },20000);
</script>
<script type="text/javascript" src="js/jquery.js"></script>
<%--<script type="text/javascript" src="js/videoSearch.js"></script>--%>
</body>
</html>

