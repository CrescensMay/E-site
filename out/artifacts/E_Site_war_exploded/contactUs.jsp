<%@ page import="java.util.Objects" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="css/normalize.css">
    <link rel="stylesheet" href="css/style.css">
    <script src="js/jquery-3.2.0.min.js"></script>
    <link rel="stylesheet" href="css/jquery.fancybox.min.css" media="screen">
    <script src="js/jquery.fancybox.min.js"></script>
    <title>Contact Us</title>

    <style>
        @import url(https://fonts.googleapis.com/css?family=Roboto:400,300,600,400italic);

        /*body {*/
        /*font-family: "Roboto", Helvetica, Arial, sans-serif;*/
        /*font-weight: 100;*/
        /*font-size: 12px;*/
        /*line-height: 30px;*/
        /*color: #777;*/
        /*background: #4CAF50;*/
        /*}*/

        #contact input[type="text"],
        #contact input[type="email"],
            /*#contact input[type="tel"],*/
        #contact textarea,
        #contact button[type="submit"] {
            font: 400 12px/16px "Roboto", Helvetica, Arial, sans-serif;
        }

        #contact {
            position: absolute;
            left: 32%;
            margin-top: 1%;
            width: 400px;
            height: 480px;
            background: #f7f6ff;/*#F9F9F9*/;
            padding: 25px;
            border-radius: 5px;
            box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0 rgba(0, 0, 0, 0.24);
        }

        #contact h3 {
            display: block;
            font-size: 30px;
            font-weight: 300;
            margin-bottom: 20px;
            text-align: center;
            color: #000000;
        }

        #contact h4 {
            margin: 5px 0 15px;
            display: block;
            font-size: 13px;
            font-weight: 400;
            text-align: center;
            color: #000000;
        }

        fieldset {
            border: medium none !important;
            margin: 0 0 10px;
            min-width: 100%;
            padding: 0;
            width: 100%;
        }

        #contact input[type="text"],
        #contact input[type="email"],
            /*#contact input[type="tel"],*/
            /*#contact input[type="url"],*/
        #contact textarea {
            width: 100%;
            border: 1px solid #ccc;
            background: #FFF;
            margin: 0 0 5px;
            padding: 10px;
        }

        #contact input[type="text"]:hover,
        #contact input[type="email"]:hover,
            /*#contact input[type="tel"]:hover,*/
            /*#contact input[type="url"]:hover,*/
        #contact textarea:hover {
            -webkit-transition: border-color 0.3s ease-in-out;
            -moz-transition: border-color 0.3s ease-in-out;
            transition: border-color 0.3s ease-in-out;
            border: 1px solid #aaa;
        }

        #contact textarea {
            height: 100px;
            max-width: 100%;
            resize: none;
        }

        #contact button[type="submit"] {
            cursor: pointer;
            width: 100%;
            border: none;
            background: #4CAF50;
            color: #FFF;
            margin: 0 0 5px;
            padding: 10px;
            font-size: 15px;
        }
        #contact button[type="reset"] {
            cursor: pointer;
            width: 100%;
            border: none;
            background: #ff7770;
            color: #FFF;
            margin: 0 0 5px;
            padding: 10px;
            font-size: 15px;
        }
        #contact button[type="reset"]:hover {
            background: #ffa6a0;
            -webkit-transition: background 0.3s ease-in-out;
            -moz-transition: background 0.3s ease-in-out;
            transition: background-color 0.3s ease-in-out;
        }
        #contact button[type="submit"]:hover {
            background: #b6e6b7;
            -webkit-transition: background 0.3s ease-in-out;
            -moz-transition: background 0.3s ease-in-out;
            transition: background-color 0.3s ease-in-out;
        }

        #contact button[type="submit"]:active {
            box-shadow: inset 0 1px 3px rgba(0, 0, 0, 0.5);
        }

        .copyright {
            text-align: center;
        }

        #contact input:focus,
        #contact textarea:focus {
            outline: 0;
            border: 1px solid #aaa;
        }

        ::-webkit-input-placeholder {
            color: #888;
        }

        :-moz-placeholder {
            color: #888;
        }

        ::-moz-placeholder {
            color: #888;
        }

        :-ms-input-placeholder {
            color: #888;
        }
        .error{
            position: fixed;
            width: 380px;
            background: #ffa6a0;
            padding: 10px;
            text-align: center;
            z-index: 1;
        }
        .success{
            position: fixed;
            width: 380px;
            background: #48e0a4;
            padding: 10px;
            text-align: center;
            z-index: 1;
        }
        .status{
            display: none;
        }
    </style>
</head>
<body onload="slide()">
<jsp:include page="html/header.html"/>
<jsp:include page="html/uploads.html"/>
<jsp:include page="html/apps.html"/>
<jsp:include page="html/nav.html"/>

<section id="video-container">
    <form id="contact" name="sendEmailForm" action="mailDispatcher" method="post">
        <%
            String message = (String) request.getAttribute("success");
            String status = (String) request.getAttribute("status");
            if (message != null){
                out.println("<div class='" + status + "'>" + message + "</div>");
            }
        %>
        <h3>Contact us FAQ</h3>
        <fieldset>
            <input placeholder="Your name" name="name" type="text" tabindex="1" required autofocus>
        </fieldset>
        <fieldset>
            <input placeholder="Your Email Address" name="email" type="email" tabindex="2" required>
        </fieldset>
        <fieldset>
            <input placeholder="Subject" type="text" name="subject" tabindex="4" required>
        </fieldset>
        <fieldset>
            <textarea placeholder="Type your message here...." name="message" tabindex="5" required></textarea>
        </fieldset>
        <fieldset>
            <input type="hidden" id="email-sent" name="hidden" value="<%request.getAttribute("result");%>">
        </fieldset>
        <fieldset>
            <button name="clear" type="reset" id="contact-clear">Clear</button>
        </fieldset>
        <fieldset>
            <button name="submit" type="submit" id="contact-submit" data-submit="...Sending">Send</button>
        </fieldset>
        <!--<p class="copyright">Designed by <a href="https://colorlib.com" target="_blank" title="Colorlib">Colorlib</a></p>-->
    </form>
</section>
<script>
    //MAKE sent status div slide down and then up
    function slide() {
        setTimeout(function () {
            $('.error').fadeOut('slow');
            $('.success').fadeOut('slow');
        },5000);
    }
</script>

<script type="text/javascript" src="js/jquery.js"></script>
</body>
</html>
