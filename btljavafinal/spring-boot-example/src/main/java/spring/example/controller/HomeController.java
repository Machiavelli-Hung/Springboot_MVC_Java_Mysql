package spring.example.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import spring.example.model.User;
import spring.example.service.UserService;


@Controller
@RequestMapping("/home")

public class HomeController {

    @Autowired
    private UserService userService;

    @GetMapping({"" ,"/"})
    public String home(Model model,HttpSession session){
        User userLogin = (User) session.getAttribute("userLogin");
        model.addAttribute("user", userLogin);
        return "home";
    }
    
}
