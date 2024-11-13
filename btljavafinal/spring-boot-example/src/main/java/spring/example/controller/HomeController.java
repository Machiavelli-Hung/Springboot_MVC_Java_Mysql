package spring.example.controller;

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
        return "home";
    }

    @PostMapping("/logout")
    public String logout(HttpSession session, RedirectAttributes redirectAttributes) {
        // Hủy session hiện tại
        if (session != null) {
            session.invalidate(); // Xóa toàn bộ dữ liệu session
        }

        // Thêm thông báo vào RedirectAttributes
        redirectAttributes.addFlashAttribute("message", "Bạn đã đăng xuất thành công!");

        // Chuyển hướng người dùng về trang đăng nhập và hiển thị thông báo
        return "redirect:/user/login"; // Chuyển hướng đến trang login
    }

     // Hiển thị trang Đổi mật khẩu
     @GetMapping("/changePassword")
     public String showChangePasswordForm(Model model, HttpSession session) {
         User userLogin = (User) session.getAttribute("userLogin");
         if (userLogin == null) {
             return "redirect:/user/login"; // Nếu chưa đăng nhập thì chuyển hướng đến trang login
         }
         model.addAttribute("user", userLogin);
         return "changePassword"; // Trả về trang thay đổi mật khẩu
     }

    @PostMapping("/changePassword")
    public String changePassword(HttpSession session, String oldPassword, String newPassword, RedirectAttributes redirectAttributes) {
        User userLogin = (User) session.getAttribute("userLogin");
        if (userLogin == null) {
            return "redirect:/user/login"; // Nếu chưa đăng nhập thì chuyển hướng đến trang login
        }

        // Kiểm tra mật khẩu cũ
        if (!userService.checkPassword(userLogin, oldPassword)) {
            redirectAttributes.addFlashAttribute("error", "Mật khẩu cũ không đúng.");
            return "redirect:/home/changePassword"; // Nếu mật khẩu cũ sai, quay lại trang đổi mật khẩu
        }

        // Cập nhật mật khẩu mới
        userService.updatePassword(userLogin, newPassword);
        redirectAttributes.addFlashAttribute("message", "Đổi mật khẩu thành công!");
        return "redirect:/home"; // Quay lại trang chủ sau khi đổi mật khẩu thành công
    }




    



    
}
