package bean;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class SMTAuthenticator extends Authenticator {
    public PasswordAuthentication getPasswordAuthentication(){
        String username = "testprogramming@gmail.com";
        String password = "@programmingtest90";
        return new PasswordAuthentication(username, password);
    }
}
