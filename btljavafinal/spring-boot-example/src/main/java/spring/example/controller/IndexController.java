package spring.example.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller // Chỉnh sửa ở đây
public class IndexController {

    /**
     * Controller function for the index HTML page.
     */
    @RequestMapping("/")
    public String index(Model model) {
        return "login";
    }

}
