package spring.example.controller;

import java.io.IOException;
import java.nio.file.Paths;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

// import javax.mail.MessagingException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailSendException;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
// import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import spring.example.service.EmailService;

// @RestController
@Controller
public class EmailController {

    @Autowired
    private EmailService emailService;

    @Autowired
    private JavaMailSender mailSender;

    @GetMapping("/show-inf")
    public String show (){  
        return "getinfor";
    }



    @GetMapping("/send-email")
    public String sendEmail(@RequestParam String to, @RequestParam String subject, @RequestParam String text) {
        emailService.sendSimpleEmail(to, subject, text);
        return "ok";
    }


    // phan gui file jsp 
    @PostMapping("/send-html")
    public String sendEmailWithHtmlFromJsp(
            @RequestParam String toEmail,
            @RequestParam String subject) {
        try {
            // jspFilePath = "file";
            emailService.sendEmailWithHtmlFromJsp(toEmail, subject,"file");
            return "ok"; // doi trang nay nha 
        } catch (MessagingException | IOException e) {
            return "Failed to send email with HTML content from JSP: " + e.getMessage();
        }
    }

}



    // @PostMapping("/send")
    // public String sendEmail(
    //         @RequestParam String toEmail, 
    //         @RequestParam String subject, 
    //         @RequestParam String body, 
    //         @RequestParam String username) {
        
    //     // Gọi dịch vụ để gửi email
    //     emailService.sendEmail(toEmail, subject, body, username);
    //     return "Email đã được gửi thành công!";
    // }
