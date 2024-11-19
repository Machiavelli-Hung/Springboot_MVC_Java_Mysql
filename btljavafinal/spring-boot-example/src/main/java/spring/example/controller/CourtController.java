package spring.example.controller;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import spring.example.model.Court;
import spring.example.model.Image;
import spring.example.model.Schedule;
import spring.example.service.CourtService;

@Controller
@RequestMapping("/courts")
public class CourtController {

    @Autowired
    private CourtService courtService;

    @GetMapping("/details/{id}")
    public String showCourtDetails(@PathVariable("id") Long id, Model model) {
        Court court = courtService.getCourtById(id);
        if (court == null) {
            model.addAttribute("message", "Court not found");
            return "error"; // Hiển thị trang lỗi nếu không tìm thấy sân
        }
        List<Image> images = courtService.getImagesByCourtId(id); // Lấy hình ảnh của sân
        List<Schedule> schedules = courtService.getSchedulesByCourtId(id); // Lấy lịch của sân

        model.addAttribute("court", court);
        model.addAttribute("images", images);
        model.addAttribute("schedules", schedules);

        return "court/details"; // Chuyển tới JSP hiển thị chi tiết sân
    }

    @GetMapping("/search")
    public String listCourts(@RequestParam(value = "keyword", required = false) String keyword, Model model) {
        List<Court> courts = courtService.search(keyword);
        model.addAttribute("courts", courts);
        model.addAttribute("keyword", keyword);
        return "court/list";
    }

    @GetMapping("/add")
    public String showAddForm(Model model) {
        model.addAttribute("court", new Court());
        return "court/add";
    }

    @PostMapping("/add")
    public String addCourt(@Valid @ModelAttribute("court") Court court, BindingResult result, Model model,
            RedirectAttributes redirectAttributes) {
        if (result.hasErrors()) {
            return "court/add";
        }
        courtService.saveCourt(court);
        redirectAttributes.addFlashAttribute("message", "Court added successfully!");
        return "redirect:/courts";
    }

    // Xử lý việc tải lên ảnh cho sân
    @GetMapping("/add-images/{id}")
    public String showAddImagesForm(@PathVariable("id") Long id, Model model) {
        Court court = courtService.getCourtById(id);
        model.addAttribute("court", court);
        return "court/add-images";
    }

    @PostMapping("/add-images/{id}")
    public String uploadImages(
            @PathVariable("id") Long id,
            @RequestParam("files") MultipartFile[] files,
            RedirectAttributes redirectAttributes) {
        // Logic to handle file saving, e.g., saving file names to DB
        courtService.saveImages(id, files); // Ensure CourtService has a method to handle the image storage

        redirectAttributes.addFlashAttribute("message", "Images uploaded successfully!");
        return "redirect:/courts"; // Redirect after upload is complete
    }

    @GetMapping("/add-schedules/{id}")
    public String showAddSchedulesForm(@PathVariable("id") Long id, Model model) {
        Court court = courtService.getCourtById(id);
        List<Schedule> schedules = courtService.getAllSchedulesForCourt(id);
        model.addAttribute("court", court);
        model.addAttribute("schedules", schedules);
        model.addAttribute("schedule", new Schedule());
        return "court/add-schedules"; // Create a new JSP page for adding schedules
    }

    @PostMapping("/add-schedules/{id}")
    public String addSchedules(@PathVariable("id") Long id, @RequestParam("times") List<String> times,
            @RequestParam("prices") List<Double> prices, RedirectAttributes redirectAttributes) {
        courtService.addSchedules(id, times, prices);
        redirectAttributes.addFlashAttribute("message", "Schedules added successfully!");
        return "redirect:/courts/add-schedules/" + id; // Redirect to the court list after adding schedules
    }

    @GetMapping("/edit-schedule/{scheduleId}")
    public String showEditScheduleForm(@PathVariable("scheduleId") Long scheduleId, Model model) {
        Schedule schedule = courtService.getScheduleById(scheduleId);
        model.addAttribute("schedule", schedule);
        return "court/edit-schedule"; // Create this JSP page for editing schedules
    }

    @PostMapping("/edit-schedule/{scheduleId}")
    public String updateSchedule(@PathVariable("scheduleId") Long scheduleId,
            @RequestParam("time") String time,
            @RequestParam("price") double price,
            @RequestParam("rented") boolean rented,
            RedirectAttributes redirectAttributes) {
        courtService.updateSchedule(scheduleId, time, price, rented);
        redirectAttributes.addFlashAttribute("message", "Schedule updated successfully!");
        return "redirect:/courts/add-schedules/" + courtService.getCourtIdByScheduleId(scheduleId); // Redirect back to
                                                                                                    // schedule list
    }

    @GetMapping("/delete-schedule/{scheduleId}")
    public String deleteSchedule(@PathVariable("scheduleId") Long scheduleId, RedirectAttributes redirectAttributes) {
        Long courtId = courtService.getCourtIdByScheduleId(scheduleId); // Retrieve court ID for redirection
        courtService.deleteSchedule(scheduleId);
        redirectAttributes.addFlashAttribute("message", "Schedule deleted successfully!");
        return "redirect:/courts/add-schedules/" + courtId;
    }

    @GetMapping("/edit/{id}")
    public String showEditForm(@PathVariable("id") Long id, Model model) {
        Court court = courtService.getCourtById(id);
        model.addAttribute("court", court);
        return "court/edit";
    }

    @PostMapping("/edit/{id}")
    public String updateCourt(@PathVariable("id") Long id, @Valid @ModelAttribute("court") Court court,
            BindingResult result, RedirectAttributes redirectAttributes) {
        if (result.hasErrors()) {
            return "court/edit";
        }
        courtService.saveCourt(court);
        redirectAttributes.addFlashAttribute("message", "Court updated successfully!");
        return "redirect:/courts";
    }

    @GetMapping("/delete-image/{imageId}")
    public String deleteImage(@PathVariable("imageId") Long imageId, RedirectAttributes redirectAttributes) {
        Long courtId = courtService.getCourtIdByImageId(imageId); // Retrieve court ID for redirection
        courtService.deleteImage(imageId);
        redirectAttributes.addFlashAttribute("message", "image deleted successfully!");
        return "redirect:/courts/add-images/" + courtId;
    }

    @GetMapping("/delete/{id}")
    public String deleteCourt(@PathVariable("id") Long id, RedirectAttributes redirectAttributes) {
        courtService.deleteCourt(id);
        redirectAttributes.addFlashAttribute("message", "Court deleted successfully!");
        return "redirect:/courts";
    }

    @GetMapping
    public String listCourts(Model model) {
        model.addAttribute("courts", courtService.getAllCourts());
        System.out.println(courtService.getAllCourts());
        return "court/list";
    }
}
