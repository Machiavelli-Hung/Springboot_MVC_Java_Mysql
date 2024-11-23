package spring.example.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import spring.example.exception.UserException;
import spring.example.model.User;
import spring.example.service.UserService;

@Controller
@RequestMapping("")
public class RegisterController {

    @Autowired
    private UserService userService;

    // @Autowired
    // private PasswordEncoder passwordEncoder;

    // tao trang dang ky
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
            userService.saveUser(user,x); // lưu user nếu không có trùng lặp
            session.setAttribute("user", user);
            return "redirect:/success";
        } catch (UserException e) {
            model.addAttribute("errorMessage", e.getMessage());
            return "register"; // tên của trang đăng ký
        }

    }

    // tra ve trang success
    @GetMapping("/success")
    public String getSuccess(Model model, HttpSession session) {
        User user = (User) session.getAttribute("user"); // lay user tu phien dang nhap truoc
        model.addAttribute("user", user);
        return "success";
    }

    @PostMapping("/success")
    public String postSuccess(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session != null) {
            // session.invalidate();
            session.removeAttribute("user");
        }
        return "redirect:/login";
    }

}