package servlet;

import bean.SMTAuthenticator;
import com.sun.xml.internal.messaging.saaj.packaging.mime.MessagingException;

import javax.mail.Message;
import javax.mail.NoSuchProviderException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Properties;


@WebServlet(name = "SendEmailServlet")
public class SendEmailServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");

//        String to = "programmingtest90@gmail.com";
//        String subject = request.getParameter("subject");
//        String message  = request.getParameter("message");
//
//        String from = "programmingtest90@gmail.com";
//        String username = "test programming";
//        String password = "@programmingtest90";

        //get values from form
        int result = 0;
//
        if (request.getParameter("submit") != null) {
//            properties to be read from external file or database
            String username = "test programming";
            String password = "@programmingtest90";
            String host = "smtp.gmail.com";
            int port = 465;

            String from = "";
            String to = "programmingtest90@gmail.com";
            String subject = "";
            String message = "";

//            if (request.getParameter("name") != null){
//                 name = request.getParameter("name");
//            }
//            if (request.getParameter("email") != null){
//                 from = request.getParameter("email");
//            }
            if (request.getParameter("subject") != null) {
                subject = request.getParameter("subject");
            }
            if (request.getParameter("message") != null && request.getAttribute("name") != null && request.getAttribute("email") != null) {
                message = "<h1>From MySite</h1><br>" +
                        "<h3>From: " + request.getAttribute("name") + "</h3><br>" +
                        "<p>Email: " + request.getAttribute("email") + "</p>" +
                        request.getParameter("message") +
                        "<br><h3>Enjoy your day</h2>";
            }
//            Create properties object
            Properties properties = new Properties();
//            create SMTPAuth
            SMTAuthenticator authenticator = new SMTAuthenticator();
//            create mail session object
            Session session = Session.getInstance(properties, authenticator);
//            Create MIME style email object(extend format of email like  html email)
            MimeMessage mimeMessage = new MimeMessage(session);
            try {
                mimeMessage.setContent(message, "text/html");
                mimeMessage.setSubject(subject);
                mimeMessage.setFrom(new InternetAddress(from));
                mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(to));
//                connect to smtp server
                Transport transport = session.getTransport("smtp");
                transport.connect(host, port, username, password);
                transport.sendMessage(mimeMessage, mimeMessage.getAllRecipients());

                result = 1;
                request.setAttribute("result", result);
            } catch (javax.mail.MessagingException e) {
                e.printStackTrace();
            }
        }
    }


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
