package spring.example.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
// import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import spring.example.model.User;
import spring.example.service.UserService;

@Controller
@RequestMapping("/user")
public class LoginController {

    @Autowired
    private UserService userService;

    @GetMapping("/login")
    public String login(Model model) {
       //model.addAttribute("UserLogin", new User());
       return "login";
    }

    @PostMapping("/login")
    public String loginUser(Model model, HttpSession session, @ModelAttribute("UserLogin") User userLogin) {

        String username = userLogin.getUsername();
        String password = userLogin.getPassword();

        if (userService.checkLogin(username, password)) {
            User userCheck = userService.getUserByUsername(username);
            session.setAttribute("userLogin", userCheck);
            
            if(userCheck.getRole().equals("admin")|| userCheck.getRole().equals("chu san")){   
                return "redirect:/admin";
            }else{
                 return "redirect:/home";
            }
            
        } else {
            model.addAttribute("errorMessage", "mật khẩu hoặc tên đăng nhập chưa đúng");
            return "login";
        }

    }

   

}
