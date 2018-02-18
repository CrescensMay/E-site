<%@ page import="java.util.Properties" %>
<%@ page import="bean.SMTAuthenticator" %>
<%@ page import="javax.mail.Session" %>
<%@ page import="javax.mail.internet.MimeMessage" %>
<%@ page import="javax.mail.internet.InternetAddress" %>
<%@ page import="javax.mail.Message" %>
<%@ page import="javax.mail.Transport" %>
<%@ page import="javax.mail.MessagingException" %>
<%@ page import="java.util.Calendar" %>
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
    </style>
</head>
<body onload="displayResult()">
<jsp:include page="html/header.html"/>
<jsp:include page="html/uploads.html"/>
<jsp:include page="html/apps.html"/>
<jsp:include page="html/nav.html"/>
<%
    //get values from form
    int result = 0;
    Calendar calendar = Calendar.getInstance();
    int year = calendar.get(Calendar.YEAR);

    if (request.getParameter("submit") != null){
        //properties to be read from external file or database
        String username = "programmingtest90@gmail.com";
        String password = "@programmingtest90";
        String host = "smtp.gmail.com";
        int port = 465;

        String from = "programmingtest90@gmail.com" ;
        String to = "programmingtest90@gmail.com";
        String subject = null;
        String message = null;

        if (request.getParameter("subject") != null){
            subject = request.getParameter("subject");
        }
        if (request.getParameter("message") != null && request.getParameter("name") != null && request.getParameter("email") != null){
            message = "<html>";
            message += "<body>";
            message += "<div class=\"contact-message\" style=\"width: 450px;margin-left:25%;\n" +
                    "  background-color: #f7f6ff;\">\n" +
                    "      <h2 style=\"text-align: center;\n" +
                    "  background-color: #b6e6b7;\n" +
                    "  height: 50px;\n" +
                    "  padding-top: 20px;\">Mysite</h2>\n" +
                    "      <h4 style=\"padding: 10px;\"><b>Name:</b> " + request.getParameter("name") + "</h4>\n" +
                    "      <hr>\n" +
                    "      <h4 style=\"padding: 10px;\"><b>From:</b> " + request.getParameter("email") + "</h4>\n" +
                    "      <hr>\n" +
                    "      <h4 style=\"padding: 10px;\"><b>Subject:</b> " + request.getParameter("subject") + "</h4>\n" +
                    "      <hr>\n" +
                    "      <h3 style=\"padding: 10px;\"><b>Message:</b></h3>\n" +
                    "      <p style=\"padding: 10px;\n" +
                    "  line-height: 25px;\n" +
                    "  height: 150px;\n" +
                    "  overflow-y: scroll;\n" +
                    "  margin-bottom: 30px;\n" +
                    "  background-color: #b6e6b7\">" + request.getParameter("message") + "</p>\n" +
                    "        <footer><p style=\"text-align:center;background-color: #b6e6b7;padding:10px;\">&copy; " + year + " MySite by <b>Crescens.K</b></p></footer>\n" +
                    "    </div>";
            message += "</body>";
            message += "</html>";
        }
        //Create properties object
        Properties properties = new Properties();
        //create SMTPAuth
        SMTAuthenticator authenticator = new SMTAuthenticator();
        //create mail session object
        Session instance = Session.getInstance(properties, authenticator);
        //Create MIME style email object(extend format of email like  html email)
        MimeMessage mimeMessage = new MimeMessage(instance);
        try {
            mimeMessage.setContent(message, "text/html");
            mimeMessage.setSubject(subject);
            mimeMessage.setFrom(new InternetAddress(from));
            mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(to));
            //connect to smtp server
            Transport transport = instance.getTransport("smtps");
            transport.connect(host, port, username, password);
            transport.sendMessage(mimeMessage, mimeMessage.getAllRecipients());
            transport.close();

            result = 1;
        } catch (MessagingException e) {
            e.printStackTrace();
        }
    }
%>
<section id="video-container">
    <form id="contact" action="contactUs.jsp" method="post">
        <h3>Contact Form</h3>
        <h4>Contact us FAQ</h4>
        <fieldset>
            <input placeholder="Your name" name="name" type="text" tabindex="1" required autofocus>
        </fieldset>
        <fieldset>
            <input placeholder="Your Email Address" name="email" type="email" tabindex="2" required>
        </fieldset>
        <!--<fieldset>-->
        <!--<input placeholder="Your Phone Number (optional)" name="tel" type="tel" tabindex="3" required>-->
        <!--</fieldset>-->
        <fieldset>
            <input placeholder="Subject" type="text" name="subject" tabindex="4" required>
        </fieldset>
        <fieldset>
            <textarea placeholder="Type your message here...." name="message" tabindex="5" required></textarea>
        </fieldset>
        <fieldset>
            <input name="hidden" type="hidden" id="email-sent" value="<%=result%>">
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
<%--<jsp:include page="html/ContactUs.html"/>--%>

<script type="text/javascript" src="js/jquery.js"></script>
</body>
</html>
