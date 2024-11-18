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

import spring.example.model.User;
import spring.example.service.ChusanService;

@Controller
// @RequestMapping("/admin")
@RequestMapping("/chusan")
public class ChusanController {

    @Autowired
    private ChusanService ChusanService;

    @GetMapping({ "", "/" })
    public String admin(Model model, HttpSession session) {
        User userLogin = (User) session.getAttribute("userLogin");
        model.addAttribute("user", userLogin);

        return "chusan";
    }

    @GetMapping("/showuser")
    public String getCustomers(Model model) {
        List<User> customers = ChusanService.getAllCustomers();
        model.addAttribute("customers", customers);
        return "showuser2"; // Tên của file HTML trong thư mục templates
    }

    @PostMapping("/delete/{id}")
    public String deleteCustomer(@PathVariable Long id) {
        ChusanService.deleteCustomer(id); // Giả sử bạn đã định nghĩa phương thức này trong AdminService
        return "redirect:/chusan/showuser"; // Chuyển hướng về trang danh sách khách hàng
    }

    @GetMapping("/edit/{id}")
    public String editCustomer(@PathVariable Long id, Model model) {
        User customer = ChusanService.getCustomerById(id); // Lấy thông tin khách hàng theo ID
        model.addAttribute("customer", customer);
        return "editCustomer2"; // Tên file JSP cho chỉnh sửa
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

        ChusanService.updateCustomer(customer); // Cập nhật thông tin khách hàng
        return "redirect:/chusan/showuser";
    }

}