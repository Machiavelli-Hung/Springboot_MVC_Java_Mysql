package spring.example.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import spring.example.model.User;
import spring.example.service.UserService;


@Controller
@RequestMapping("/home")

public class HomeController {

    @Autowired
    private UserService userService;

    // trang chu cua home
    @GetMapping({"" ,"/"})
    public String home(Model model,HttpSession session){
        User userLogin = (User) session.getAttribute("userLogin");
        model.addAttribute("user", userLogin);
        return "home2";
    }

    @GetMapping("/logout")
    public String logout(HttpSession session, RedirectAttributes redirectAttributes) 
    throws ServletException, IOException {

        // Hủy session hiện tại
        if (session != null) {
            session.invalidate(); 
           // redirectAttributes.addFlashAttribute("message", "Bạn đã đăng xuất thành công!");
        }
        redirectAttributes.addFlashAttribute("message", "Bạn đã đăng xuất thành công!");

        return "redirect:/user/login"; 
    }

     // Hiển thị trang Đổi mật khẩu
     @GetMapping("/changePassword")
     public String showChangePasswordForm(Model model, HttpSession session) {
         User userLogin = (User) session.getAttribute("userLogin");
         if (userLogin == null) {
             return "redirect:/user/login"; 
         }
         model.addAttribute("user", userLogin);
         return "changePassword2"; 
     }

    @PostMapping("/changePassword")
    public String changePassword(HttpSession session, String oldPassword, String newPassword, RedirectAttributes redirectAttributes) {
        User userLogin = (User) session.getAttribute("userLogin");
        if (userLogin == null) {
            return "redirect:/user/login";
        }

        // Kiểm tra mật khẩu cũ
        if (!userService.checkPassword(userLogin, oldPassword)) {
            redirectAttributes.addFlashAttribute("error", "Mật khẩu cũ không đúng.");
            return "redirect:/home/changePassword"; 
        }

        // Cập nhật mật khẩu mới
        userService.updatePassword(userLogin, newPassword);
        redirectAttributes.addFlashAttribute("message", "Đổi mật khẩu thành công!");

        if ("admin".equals(userLogin.getRole())) {
            return "redirect:/admin"; // Redirect to admin page
        }
        return "redirect:/home"; // Redirect to home page for regular users
        

    }


}
