package spring.example.controller;

import java.io.IOException;
import java.nio.file.Paths;
import java.util.HashMap;
import java.util.Map;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

// import javax.mail.MessagingException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailSendException;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
// import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import spring.example.model.User;
import spring.example.service.EmailService;

// @RestController
@Controller
public class EmailController {

    @Autowired
    private EmailService emailService;

    // private final EmailService emailService;

    public EmailController(EmailService emailService) {
        this.emailService = emailService;
    }

  

    @GetMapping("/show-inf")
    public String show (HttpSession session,Model model){  
        User userLogin = (User) session.getAttribute("userLogin");
        model.addAttribute("user", userLogin);
        return "getinfor";
    }



    @GetMapping("/send-email")
    public String sendEmail(@RequestParam String to, @RequestParam String subject, @RequestParam String text) {
        emailService.sendSimpleEmail(to, subject, text);
        return "ok";
    }

     
    @PostMapping("/send-html")
public String sendEmailWithHtmlFromJsp(
        @RequestParam String toEmail,
        HttpSession session) {
    try {
        User userLogin = (User) session.getAttribute("userLogin");
        //lay them cai cour 
        Map<String, String> variables = new HashMap<>();
        variables.put("user.username", userLogin.getUsername());
        variables.put("user.phoneNumber", userLogin.getPhoneNumber());
        variables.put("user.email",userLogin.getEmail());
        // Add other variables as needed
        String subject = "XÁC NHẬN ĐẶT SÂN";

        emailService.sendEmailWithHtmlFromJsp(toEmail, subject, "getinfor", variables);
        return "ok";
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
