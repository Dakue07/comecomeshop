package commands;

import java.security.GeneralSecurityException;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import com.sun.mail.util.MailSSLSocketFactory;

import context.RequestContext;
import context.ResponseContext;
import dao.UserDao;

public class BuyMailCommand extends AbstractCommand{
	public ResponseContext execute(ResponseContext resc) {
		
		RequestContext reqc = getRequestContext();
		
		int user_id = reqc.getUserBeanInSession().getUser_id();
		String order_id = reqc.getParameter("order_id")[0];
		
		UserDao userdao = new UserDao();
		
		String user_Email = userdao.SelectUserEmail(user_id);
		
		System.out.println("buyMailまで来たよ");
		// Googleアカウントログイン情報
        String username = "hy22304024@ga.ttc.ac.jp";
        String password = "gv4WHUj9";

        // To
        String to = "ki22304002@ga.ttc.ac.jp";

        // From
        String from = "user_Email";

        // Set the host and port for the Gmail SMTP server
        String host = "smtp.gmail.com";
        int port = 587;

        // Properties
        Properties props = new Properties();
        MailSSLSocketFactory sf;
		try {
			sf = new MailSSLSocketFactory();
			sf.setTrustAllHosts(true); 
	        props.put("mail.smtp.ssl.socketFactory", sf);

		} catch (GeneralSecurityException e1) {
			// TODO 自動生成された catch ブロック
			e1.printStackTrace();
		}
        
        props.put("mail.smtp.ssl.trust", "*");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", host);
        props.put("mail.smtp.port", port);

        // Create a Session object with authentication
        Session session = Session.getInstance(props, new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(username, password);
            }
        });

        try {
            // Create a MimeMessage object
            Message message = new MimeMessage(session);

            // Set the sender and recipient addresses
            message.setFrom(new InternetAddress(from));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));

            // メール件名
            message.setSubject("購入完了のお知らせ");
            
            // メール内容
            message.setText("This is the message body.");

            // メールを送る
            Transport.send(message);

            System.out.println("Email sent successfully!");

        } catch (MessagingException e) {
            throw new RuntimeException(e);
        }
		
		resc.setTarget("productlist");
		
		
		return resc;
	}
}
