package spring.example.service;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.Map;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletContext;

import org.apache.commons.text.StringSubstitutor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

@Service
public class EmailService {
    @Autowired
    private JavaMailSender mailSender;

    @Autowired
    private ServletContext servletContext;

    public void sendSimpleEmail(String toEmail, String subject, String body) {
        SimpleMailMessage message = new SimpleMailMessage();
        message.setFrom("pthanhlong303@gmail.com");
        message.setTo(toEmail);
        message.setSubject(subject);
        message.setText(body);

        mailSender.send(message);
    }

    public void sendEmailWithHtmlFromJsp(String toEmail, String subject, String jspFilePath,
            Map<String, String> variables) throws MessagingException, IOException {
        MimeMessage message = mailSender.createMimeMessage();
        MimeMessageHelper helper = new MimeMessageHelper(message, true);

        String htmlContent = readHtmlFromJsp(jspFilePath);
        StringSubstitutor sub = new StringSubstitutor(variables);
        String resolvedHtmlContent = sub.replace(htmlContent);

        helper.setTo(toEmail);
        helper.setSubject(subject);
        helper.setText(resolvedHtmlContent, true);

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