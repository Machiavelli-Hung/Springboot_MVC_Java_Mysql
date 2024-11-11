package spring.example.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import spring.example.model.User;
import spring.example.repository.UserRepository;
import spring.example.service.UserService;

import javax.servlet.http.HttpSession;

@Controller
// @RequestMapping("/user")
public class RegisterController {

    @Autowired
     private UserService userService;

    @GetMapping("/register")
    public String register(Model model) {
        User user = new User();
        model.addAttribute("user", user);
        return "register";
    }


    @PostMapping("/register")
    public String registerUser(@ModelAttribute("user") User user, HttpSession session) {
        //userService.saveUser(user);
        session.setAttribute("user", user);
        return "redirect:/success";
    }

    @GetMapping("/success")
    public String success(Model model, HttpSession session) {
        User user = (User) session.getAttribute("user");
        model.addAttribute("user", user);
        return "success";
    }

}