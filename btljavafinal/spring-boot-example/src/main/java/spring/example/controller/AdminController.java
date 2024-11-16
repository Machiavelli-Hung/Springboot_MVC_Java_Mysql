package spring.example.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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

    @PostMapping("/delete/{id}")
    public String deleteCustomer(@PathVariable Long id) {
        adminService.deleteCustomer(id); // Giả sử bạn đã định nghĩa phương thức này trong AdminService
        return "redirect:/admin/showuser"; // Chuyển hướng về trang danh sách khách hàng
    }

    @GetMapping("/edit/{id}")
    public String editCustomer(@PathVariable Long id, Model model) {
        User customer = adminService.getCustomerById(id); // Lấy thông tin khách hàng theo ID
        model.addAttribute("customer", customer);
        return "editCustomer"; // Tên file JSP cho chỉnh sửa
    }

    @PostMapping("/update")
    public String updateCustomer(@RequestParam Long id, 
                              @RequestParam String username, 
                              @RequestParam String password, 
                              @RequestParam String email, 
                              @RequestParam String phone,
                              @RequestParam String role) {
    User customer = new User();
    customer.setId(id);
    customer.setUsername(username);
    customer.setPassword(password);
    customer.setEmail(email);
    customer.setRole(role);
    customer.setPhoneNumber(phone);
    
    adminService.updateCustomer(customer); // Cập nhật thông tin khách hàng
    return "redirect:/admin/showuser"; 
}

    
}
