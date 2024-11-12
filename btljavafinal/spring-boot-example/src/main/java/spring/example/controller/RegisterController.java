package spring.example.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import spring.example.exception.userException;
import spring.example.model.User;
import spring.example.repository.UserRepository;
import spring.example.service.UserService;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/user")
public class RegisterController {

    @Autowired
     private UserService userService;

    // tao trang dang ky
    @GetMapping("/register")
    public String register(Model model) {
        User user = new User();
        model.addAttribute("user", user);
        return "register";
    }

    // day thong tin len server va check
    @PostMapping("/register")
    public String registerUser(@ModelAttribute("user") User user, HttpSession session, Model model) {
        User existingUser = new User();
        existingUser.setUsername(user.getUsername());
        existingUser.setPassword(user.getPassword());
        existingUser.setEmail(user.getEmail());
        existingUser.setPhoneNumber(user.getPhoneNumber());
        existingUser.setRole(user.getRole());


        try {
            userService.saveUser(user); // lưu user nếu không có trùng lặp
            session.setAttribute("user", user);
            return "redirect:/user/success";
        } catch (userException e) {
            model.addAttribute("errorMessage", e.getMessage());
            return "register"; // tên của trang đăng ký
        }

    }

    // tra ve trang success
    @GetMapping("/success")
    public String success(Model model, HttpSession session) {
        User user = (User) session.getAttribute("user"); // lay user tu phien dang nhap truoc 
        model.addAttribute("user", user);
        return "success";
    }

}