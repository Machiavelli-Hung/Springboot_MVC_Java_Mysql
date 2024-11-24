package spring.example.controller;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import spring.example.model.User;
import spring.example.service.EmailService;
import spring.example.service.UserService;
import spring.example.service.VerificationService;

@Controller
@RequestMapping("/auth")
public class AuthController {

    @Autowired
    private VerificationService verificationService;

    // thêm cái này không xóa 
    @Autowired
    private JavaMailSender mailSender;
    //  cai nay khong xoa
    @Autowired
    private UserService userService;


    // Hiển thị form nhập email
    @GetMapping("/reset-password")
    public String showResetPasswordForm() {
        return "reset-password";
    }

    // Xử lý yêu cầu gửi mã PIN
    @PostMapping("/reset-password")
    public String sendPin(@RequestParam String email, Model model) {
        verificationService.sendPin(email);
        model.addAttribute("message", "Mã PIN đã được gửi đến email của bạn.");
        model.addAttribute("email", email);
        if(userService.checkEmail(email)){
            return "enter-pin";
        }else{
            model.addAttribute("message", "Vui lòng nhập lại chính xác  email của bạn.");
            return "reset-password";
        }
    }

    // Hiển thị form nhập mã PIN
    @GetMapping("/verify-pin")
    public String showVerifyPinForm(@RequestParam String email, Model model) {
        model.addAttribute("email", email);
        return "enter-pin";
    }

    // Xử lý xác thực mã PIN
    @PostMapping("/verify-pin")
    public String verifyPin(@RequestParam String email, @RequestParam String pin, Model model,HttpSession session) {
        boolean isValid = verificationService.verifyPin(email, pin);
        // phuc vu ca doi mat khau 
        if (isValid) {
             User userLogin = (User) session.getAttribute("userLogin");
            if (userLogin == null) {
                SimpleMailMessage message = new SimpleMailMessage();
                message.setTo(email);

                String password = userService.getPassword(email);

                message.setSubject("Yêu cầu lấy lại mật khẩu");
                message.setText("Mã mật khẩu của bạn là: " + password);
                mailSender.send(message);
                model.addAttribute("message", "Xác thực thành công. Vui lòng kiểm tra email để đăng nhập");
                return "login";
            }else{
                model.addAttribute("message", "Xác thực thành công. Vui lòng thay đổi mật khẩu.");
                return "change-password";
            }
         }
        model.addAttribute("error", "Mã PIN không hợp lệ. Vui lòng thử lại.");
        model.addAttribute("email", email);
        return "enter-pin";
    }

    // phan nay viet them doan lay lai mat khau 

    @GetMapping("/get-password")
    public String getPassword(){    
        return "get-password";
    }

    @PostMapping("/get-password")
    public String sendPassWord(@RequestParam String email, Model model) {
        if(userService.checkEmail(email)){
            verificationService.sendPassword(email);
            model.addAttribute("message", "Mã PIN đã được gửi đến email của bạn.");
            model.addAttribute("email", email);
            return "enter-pin";
        }else{
            model.addAttribute("message", "Vui lòng nhập lại chính xác  email của bạn.");
            return "get-password";
        }
    }

    // end lay lai mat khau 
}

