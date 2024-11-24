package spring.example.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;

import spring.example.model.User;
import spring.example.service.EmailService;
import spring.example.service.UserService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import spring.example.exception.UserException;
import spring.example.model.User;
import spring.example.service.UserService;
import spring.example.service.VerificationService;

@Controller
@RequestMapping("/auth")
public class AuthController {

    @Autowired
    private UserService userService;

    @Autowired
    private VerificationService verificationService;

    @Autowired
    private JavaMailSender mailSender;

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
        if (userService.checkEmail(email)) {
            return "enter-pin";
        } else {
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
    public String verifyPin(@RequestParam String email, @RequestParam String pin, Model model, HttpSession session) {
        boolean isValid = verificationService.verifyPin(email, pin);
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
            } else {
                model.addAttribute("message", "Xác thực thành công. Vui lòng thay đổi mật khẩu.");
                return "change-password";
            }
        }
        model.addAttribute("error", "Mã PIN không hợp lệ. Vui lòng thử lại.");
        model.addAttribute("email", email);
        return "enter-pin";
    }

    @GetMapping("/login")
    public String login(Model model) {
        // model.addAttribute("UserLogin", new User());
        return "login";
    }

    @PostMapping("/login")
    public String loginUser(Model model, HttpSession session, @ModelAttribute("UserLogin") User userLogin) {
        String username = userLogin.getUsername();
        String password = userLogin.getPassword();
        if (userService.checkLogin(username, password)) {
            User userCheck = userService.getUserByUsername(username);
            session.setAttribute("userLogin", userCheck);
            return "redirect:/home";
        } else {
            model.addAttribute("errorMessage", "Mật khẩu hoặc tên đăng nhập chưa đúng");
            return "login";
        }
    }

    @GetMapping("/register")
    public String register(Model model) {
        // User user = new User();
        // model.addAttribute("user", user);
        return "register";
    }

    // day thong tin len server va check
    @PostMapping("/register")
    public String registerUser(@ModelAttribute("user") User user,
            HttpSession session,
            Model model,
            @RequestParam String confirmpassword) {
        User existingUser = new User();
        existingUser.setUsername(user.getUsername());
        existingUser.setPassword(user.getPassword());
        existingUser.setEmail(user.getEmail());
        existingUser.setPhoneNumber(user.getPhoneNumber());
        existingUser.setRole(user.getRole());
        String x = confirmpassword;

        // user.setPassword(passwordEncoder.encode(user.getPassword()));

        try {
            userService.saveUser(user, x);
            session.setAttribute("user", user);
            return "redirect:/auth/login";
        } catch (UserException e) {
            model.addAttribute("errorMessage", e.getMessage());
            return "register";
        }
    }

    @GetMapping("/get-password")
    public String getPassword() {
        return "get-password";
    }

    @PostMapping("/get-password")
    public String sendPassWord(@RequestParam String email, Model model) {
        if (userService.checkEmail(email)) {
            verificationService.sendPassword(email);
            model.addAttribute("message", "Mã PIN đã được gửi đến email của bạn.");
            model.addAttribute("email", email);
            return "enter-pin";
        } else {
            model.addAttribute("message", "Vui lòng nhập lại chính xác  email của bạn.");
            return "get-password";
        }
    }
}
