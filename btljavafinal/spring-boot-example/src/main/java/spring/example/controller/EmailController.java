package spring.example.controller;

import java.io.IOException;

import javax.mail.MessagingException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
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

    // phan gui file jsp
    @PostMapping("/send-html")
    public String sendEmailWithHtmlFromJsp(
            @RequestParam String toEmail,
            @RequestParam String subject,
            @RequestParam String name,
            @RequestParam String email,
            @RequestParam String phone,
            @RequestParam String field,
            @RequestParam String schedule) {
        try {
            // Gọi dịch vụ để gửi email với thông tin từ JSP
            emailService.sendEmailWithHtmlFromJsp(toEmail, subject, "getinfor", name, email, phone, field, schedule);
            return "redirect:/manage-courts?success=true"; // Điều hướng tới trang danh sách sân sau khi gửi email
        } catch (MessagingException | IOException e) {
            e.printStackTrace();
            return "redirect:/manage-courts?error=true"; // Nếu gửi email thất bại, chuyển hướng về trang có lỗi
        }
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
