package spring.example.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
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
        SimpleDateFormat dateFormat = new SimpleDateFormat("MMM d yyyy : HH:mm:ss:SSS z");
        Date now = new Date();
        String dateStr = dateFormat.format(now);
        model.addAttribute("time", dateStr);
        return "index";
    }

}
