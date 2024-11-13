package spring.example.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import spring.example.model.User;
 import spring.example.service.AdminService;
import spring.example.service.UserService;;


@Controller
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    private AdminService  adminService;

    @GetMapping({"" ,"/"})
    public String admin(Model model,HttpSession session){
        User userLogin = (User) session.getAttribute("userLogin");
        model.addAttribute("user", userLogin);
        return "admin";
    }

    @GetMapping("/showuser")
    public String getCustomers(Model model) {
        List<User> customers = adminService.getAllCustomers();
        model.addAttribute("customers", customers);
        return "showuser"; // Tên của file HTML trong thư mục templates
    }

    

    

    
}
