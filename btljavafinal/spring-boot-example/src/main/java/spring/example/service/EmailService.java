package spring.example.service;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

 import java.io.File;
 import java.io.IOException;
 import javax.servlet.ServletContext;
import java.io.BufferedReader;
import java.io.FileReader;


// import javax.mail.MessagingException;
// import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
// import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
// import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;


@Service
public class EmailService {
    @Autowired
    private JavaMailSender mailSender;

    @Autowired
    private ServletContext servletContext;


    // @Value("${spring.mail.username1}")
    // private String username1;

    // @Value("${spring.mail.password1}")
    // private String password1;

    // @Value("${spring.mail.username2}")
    // private String username2;

    // @Value("${spring.mail.password2}")
    // private String password2;

    public void sendSimpleEmail(String toEmail, String subject, String body) {
        SimpleMailMessage message = new SimpleMailMessage();
        message.setFrom("pthanhlong303@gmail.com");
        message.setTo(toEmail);
        message.setSubject(subject);
        message.setText(body);

        mailSender.send(message);
    }


    public void sendEmailWithAttachment(String to, String subject, String body, String filePath) throws MessagingException {
        MimeMessage message = mailSender.createMimeMessage();
        MimeMessageHelper helper = new MimeMessageHelper(message, true);

        helper.setTo(to);
        helper.setSubject(subject);
        helper.setText(body, true);

        FileSystemResource file = new FileSystemResource(new File(filePath));
        helper.addAttachment(file.getFilename(), file);

        mailSender.send(message);
    }

    public void sendEmailWithHtmlFromJsp(String to, String subject, String jspFilePath) throws MessagingException, IOException {
        MimeMessage message = mailSender.createMimeMessage();
        MimeMessageHelper helper = new MimeMessageHelper(message, true);

        String htmlContent = readHtmlFromJsp(jspFilePath);
        helper.setTo(to);
        helper.setSubject(subject);
        helper.setText(htmlContent, true);

        mailSender.send(message);
    }


    private String readHtmlFromJsp(String jspFilePath) throws IOException {
        String realPath = servletContext.getRealPath("/WEB-INF/views/" + jspFilePath + ".jsp");
        StringBuilder contentBuilder = new StringBuilder();
        try (BufferedReader br = new BufferedReader(new FileReader(realPath))) {
            String line;
            while ((line = br.readLine()) != null) {
                // Bỏ qua dòng JSP directive
                if (!line.trim().startsWith("<%@")) {
                    contentBuilder.append(line).append("\n");
                }
            }
        }
        return contentBuilder.toString();
    }

}
