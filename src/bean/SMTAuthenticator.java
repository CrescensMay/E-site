package bean;


import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class SMTAuthenticator extends Authenticator {
    public PasswordAuthentication getPasswordAuthentication(){
        String username = "testprogramming@gmail.com";
        String password = "@programmingtest90";
//        char[] password = new char[]{'p','r','o','g','r','a','m','m','i','n','g','t','e','s','t','9','0'};
        return new PasswordAuthentication(username, password);
    }
}
