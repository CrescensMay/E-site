package servlet;

import bean.SMTAuthenticator;

import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Calendar;
import java.util.Properties;


@WebServlet(name = "SendEmailServlet")
public class SendEmailServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");
        //get values from form
        String status = null;
        String success = null;
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
                message += "<link>";
                message += "<body>";
                message += "<div class=\"contact-message\" style=\"width: 450px;margin-left:25%;\n" +
                        "  background-color: #f7f6ff;\">\n" +
                        "      <h2 style=\"text-align: center;\n" +
                        "  background-color: #b6e6b7;\n" +
                        "  height: 50px;\n" +
                        "  padding-top: 20px;\">Mysite</h2>\n" +
                        "      <h4 style=\"padding: 10px;\"><i>Name:</i> " + request.getParameter("name") + "</h4>\n" +
                        "      <hr>\n" +
                        "      <h4 style=\"padding: 10px;\"><i>From:</i> " + request.getParameter("email") + "</h4>\n" +
                        "      <hr>\n" +
                        "      <h4 style=\"padding: 10px;\"><i>Subject:</i> " + subject+ "</h4>\n" +
                        "      <hr>\n" +
                        "      <h3 style=\"padding: 10px;\"><i>Message:</i></h3>\n" +
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
                mimeMessage.setSubject(subject + " (From Mysite WebSite)");
                mimeMessage.setFrom(new InternetAddress(from));
                mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(to));
                //connect to smtp server
                Transport transport = instance.getTransport("smtps");
                transport.connect(host, port, username, password);
                transport.sendMessage(mimeMessage, mimeMessage.getAllRecipients());
                transport.close();

                status = "success";
                success = "Email Successfully Sent!";

                request.setAttribute("status", status);
                request.setAttribute("success", success);
            } catch (javax.mail.MessagingException e) {
                e.printStackTrace();
                status = "error";
                success = "Error Connection, Email not Sent! ";

                request.setAttribute("status", status);
                request.setAttribute("success", success);
            }
//            request.getRequestDispatcher("contactUs.jsp").include(request, response);
            request.getRequestDispatcher("contactUs.jsp").forward(request, response);
        }
    }


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
