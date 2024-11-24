package spring.example.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import spring.example.model.User;
import spring.example.service.UserService;

@Controller
// @RequestMapping("/admin")
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserService userService;

    @GetMapping("/details/{id}")
    public String getUserDetails(@PathVariable Long id, Model model, HttpSession session) {
        User userLogin = (User) session.getAttribute("userLogin");
        if (userLogin == null) {
            // Chuyển hướng hoặc thông báo nếu người dùng không có quyền
            return "redirect:/auth/login";
        }

        model.addAttribute("user", userLogin);

        User userDetails = userService.getUserById(id);
        model.addAttribute("userDetails", userDetails);

        return "details-user";
    }

}