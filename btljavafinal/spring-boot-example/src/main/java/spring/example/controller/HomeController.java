package spring.example.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
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

import spring.example.model.Court;
import spring.example.model.User;
import spring.example.service.CourtService;
import spring.example.service.UserService;

@Controller
@RequestMapping("/home")

public class HomeController {

    @Autowired
    private UserService userService;

    @Autowired
    private CourtService courtService;

    // trang chu cua home
    @GetMapping({ "", "/" })
    public String home(Model model, HttpSession session) {
        User userLogin = (User) session.getAttribute("userLogin");
        model.addAttribute("user", userLogin);
        List<Court> courts = courtService.getAllCourts();
        model.addAttribute("courts", courts);
        return "home";
    }

    @GetMapping("/logout")
    public String logout(HttpSession session, RedirectAttributes redirectAttributes)
            throws ServletException, IOException {

        // Hủy session hiện tại
        if (session != null) {
            session.invalidate();
            // redirectAttributes.addFlashAttribute("message", "Bạn đã đăng xuất thành
            // công!");
        }
        redirectAttributes.addFlashAttribute("message", "Bạn đã đăng xuất thành công!");

        return "redirect:/auth/login";
    }

    // Hiển thị trang Đổi mật khẩu
    @GetMapping("/change-password")
    public String showChangePasswordForm(Model model, HttpSession session) {
        User userLogin = (User) session.getAttribute("userLogin");
        if (userLogin == null) {
            return "redirect:/auth/login";
        }
        model.addAttribute("user", userLogin);
        return "change-password";
    }

    @PostMapping("/change-password")
    public String changePassword(HttpSession session, String oldPassword, String newPassword,
            RedirectAttributes redirectAttributes) {
        User userLogin = (User) session.getAttribute("userLogin");
        if (userLogin == null) {
            return "redirect:/auth/login";
        }

        // Kiểm tra mật khẩu cũ
        if (!userService.checkPassword(userLogin, oldPassword)) {
            redirectAttributes.addFlashAttribute("error", "Mật khẩu cũ không đúng.");
            return "redirect:/home/change-password";
        }

        // Cập nhật mật khẩu mới
        userService.updatePassword(userLogin, newPassword);
        redirectAttributes.addFlashAttribute("message", "Đổi mật khẩu thành công!");
        return "redirect:/home";
    }

    @GetMapping("/manage-users")
    public String getCustomers(Model model, HttpSession session) {
        // phan nay khong xoa la phan chan quyen
        User userLogin = (User) session.getAttribute("userLogin");
        if (userLogin == null) {
            return "redirect:/auth/login";
        }
        model.addAttribute("user", userLogin);
        if (userService.checkAdmin(session)) {
            List<User> customers = userService.getAllCustomers();
            model.addAttribute("customers", customers);
            return "manage-users"; // Tên của file HTML trong thư mục templates
        }
        return "redirect:/home";
        // chan quyen ket thuc
    }

    @PostMapping("/delete/{id}")
    public String deleteCustomer(@PathVariable Long id, HttpSession session) {
        // check admin khong xoa
        if (userService.checkAdmin(session)) {
            userService.deleteCustomer(id);
            return "redirect:/home/manage-users";
        }
        return "redirect:/home";
    }

    @GetMapping("/edit/{id}")
    public String editCustomer(@PathVariable Long id, Model model, HttpSession session) {
        // check admin khong xoa
        if (userService.checkAdmin(session)) {
            User customer = userService.getCustomerById(id); // Lấy thông tin khách hàng theo ID
            model.addAttribute("customer", customer);
            return "edit-user"; // Tên file JSP cho chỉnh sửa
        }
        return "redirect:/home";
    }

    @PostMapping("/edit/{id}")
    public String updateCustomer(@RequestParam Long id,
            @RequestParam String username,
            @RequestParam String password,
            @RequestParam String email,
            @RequestParam String phone,
            @RequestParam String role,
            HttpSession session) {
        User customer = new User();
        customer.setId(id);
        customer.setUsername(username);
        customer.setPassword(password);
        customer.setEmail(email);
        customer.setRole(role);
        customer.setPhoneNumber(phone);

        if (userService.checkAdmin(session)) {
            userService.updateCustomer(customer); // Cập nhật thông tin khách hàng
            return "redirect:/home/manage-users";
        }
        return "redirect:/home";
    }

    @GetMapping("/search-court")
    public String listCourts(@RequestParam(value = "keyword", required = false) String keyword, Model model,
            HttpSession session) {
        User userLogin = (User) session.getAttribute("userLogin");
        if (userLogin == null)
            return "redirect:/auth/login";
        model.addAttribute("user", userLogin);
        List<Court> courts = courtService.search(keyword);
        model.addAttribute("courts", courts);
        model.addAttribute("keyword", keyword);
        return "search-court";
    }
}