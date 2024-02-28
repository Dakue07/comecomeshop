package mail;

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

import dao.OrderTableDao;
import dao.UserDao;
import dto.UserAddressOrderDto;

public class SendMail {
	//購入完了用
	public static void sendMail(int user_id, int order_id) {
	    UserDao userdao = new UserDao();

	    String user_Email = userdao.SelectUserEmail(user_id);

	    UserAddressOrderDto useraddressorderdto = new OrderTableDao().selectOrderDetails(user_id);

	    System.out.println(user_Email);
	    // Googleアカウントログイン情報
	    String username = "ki22304002@ga.ttc.ac.jp";
	    String password = "kazu20010926";

	    // To
	    String to = user_Email;

	    // From
	    String from = "ki22304002@ga.ttc.ac.jp";

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
	        message.setText("注文番号:" +order_id + "\n" + "注文日時:" + useraddressorderdto.getOrder_time() + "\n" + "郵便番号:" + useraddressorderdto.getUseraddress_postcode() + "\n" + "住所:" + useraddressorderdto.getUseraddress_street() + useraddressorderdto.getUseraddress_state_city() );

	        // メールを送る
	        Transport.send(message);

	        System.out.println("Email sent successfully!");

	    } catch (MessagingException e) {
	        throw new RuntimeException(e);
	    }

	}
	
	
	
	//マイページ用
	public static void sendMail(int user_id, String user_name, String content) {
		UserDao userdao = new UserDao();
		
		String user_Email = userdao.SelectUserEmail(user_id);

	    // Googleアカウントログイン情報
	    String username = "ki22304002@ga.ttc.ac.jp";
	    String password = "kazu20010926";

	    // To
	    String to = "ki22304002@ga.ttc.ac.jp";

	    // From
	    String from = user_Email;

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
	        message.setSubject("お問い合わせ");

	        // メール内容
	        message.setText("ユーザーid:" +user_id + "\n" + "名前:" + user_name + "\n" + "お問い合わせ内容:" + content + "\n");

	        // メールを送る
	        Transport.send(message);

	        System.out.println("Email sent successfully!");

	    } catch (MessagingException e) {
	        throw new RuntimeException(e);
	    }

	}
}
