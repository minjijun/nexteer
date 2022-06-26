package kr.co.nexteer.service;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.stereotype.Service;

@Service
public class EmailService {
	
	public void sendEmail1() throws MessagingException {
		Transport transport = null;
		try {
			// smtp server value setting
			String smtpAddress = "smtp.office365.com";
			String smtpUserName = "user@test.com"; // smt server 계정
			String smtpPassword = "1234"; // 패스워드
			int smtpPort = 587; // 포트

			// mail send value setting
			String mailFrom = "from@test.com";
			String mailTo = "t1@test.com,t2@test.com,t3@test.com";
			String[] mailTOList = mailTo.split(",");
			String Subject = "This is Test Mail";
			String MessageContents = "Hello This is Test Mail Thank you";
			String mailCc = "cc@test.com";

			Properties props = System.getProperties();
			props.put("mail.transport.protocol", "smtp");
			props.put("mail.smtp.port", smtpPort);
			props.put("mail.smtp.auth", "true");
			props.put("mail.smtp.starttls.enable", "true");
			props.put("mail.smtp.starttls.required", "true");
			props.put("line.separator", "\r\n");
			props.put("mail.smtp.ssl.protocols", "TLSv1.2");

			Session session = Session.getDefaultInstance(props);
			MimeMessage msg = new MimeMessage(session);
			msg.setFrom(new InternetAddress(mailFrom));

			InternetAddress[] address = new InternetAddress[mailTOList.length];
			for (int i = 0; i < mailTOList.length; i++) {
				address[i] = new InternetAddress(mailTOList[i]);
			}
			msg.setRecipients(Message.RecipientType.TO, address);
			msg.setRecipients(Message.RecipientType.CC, mailCc);
			msg.setSubject(Subject, "UTF-8");
			msg.setContent(MessageContents, "text/html; charset=UTF-8");

			// transport
			transport = session.getTransport();
			transport.connect(smtpAddress, smtpUserName, smtpPassword);
			transport.sendMessage(msg, msg.getAllRecipients());

		} catch (Exception e) {
			System.out.println(e.toString());
		} finally {
			if (transport != null)
				transport.close();
		}
	}
}
