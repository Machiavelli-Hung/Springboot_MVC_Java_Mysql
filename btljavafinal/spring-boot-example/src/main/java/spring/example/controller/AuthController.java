package spring.example.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;


import spring.example.service.VerificationService;

@Controller
@RequestMapping("/auth")
public class AuthController {

    @Autowired
    private VerificationService verificationService;


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
        return "enter-pin";
    }

    // Hiển thị form nhập mã PIN
    @GetMapping("/verify-pin")
    public String showVerifyPinForm(@RequestParam String email, Model model) {
        model.addAttribute("email", email);
        return "enter-pin";
    }

    // Xử lý xác thực mã PIN
    @PostMapping("/verify-pin")
    public String verifyPin(@RequestParam String email, @RequestParam String pin, Model model) {
        boolean isValid = verificationService.verifyPin(email, pin);
        if (isValid) {
            model.addAttribute("message", "Xác thực thành công. Vui lòng thay đổi mật khẩu.");
            return "change-password";
        }
        model.addAttribute("error", "Mã PIN không hợp lệ. Vui lòng thử lại.");
        model.addAttribute("email", email);
        return "enter-pin";
    }
}

