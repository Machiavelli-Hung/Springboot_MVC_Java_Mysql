package spring.example.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import spring.example.service.EmailService;

// @RestController
@Controller
public class EmailController {

    @Autowired
    private EmailService emailService;

    @GetMapping("/send-email")
    public String sendEmail(@RequestParam String to, @RequestParam String subject, @RequestParam String text) {
        emailService.sendSimpleEmail(to, subject, text);
        return "ok";
    }

}

// @PostMapping("/send")
// public String sendEmail(
// @RequestParam String toEmail,
// @RequestParam String subject,
// @RequestParam String body,
// @RequestParam String username) {

// // Gọi dịch vụ để gửi email
// emailService.sendEmail(toEmail, subject, body, username);
// return "Email đã được gửi thành công!";
// }
