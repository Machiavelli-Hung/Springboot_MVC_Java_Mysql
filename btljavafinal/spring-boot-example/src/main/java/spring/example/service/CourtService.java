package spring.example.service;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import spring.example.model.Court;
import spring.example.model.Image;
import spring.example.model.Schedule;
import spring.example.repository.CourtRepository;
import spring.example.repository.ImageRepository;
import spring.example.repository.ScheduleRepository;
import spring.example.repository.UserRepository;

@Service
public class CourtService {

    @Autowired
    private CourtRepository courtRepository;

    @Autowired
    private ImageRepository imageRepository;

    @Autowired
    private ScheduleRepository scheduleRepository;

    @Autowired
    private UserRepository userRepository;

    public Court saveCourt(Court court) {
        // Save the owner (User) first if it's new
        if (court.getOwner() != null && court.getOwner().getId() == null) {
            userRepository.save(court.getOwner());
        }
        // Kiểm tra lại việc gán Owner (User) cho Court
        if (court.getOwner() == null) {
            throw new IllegalArgumentException("Court must have an owner");
        }
        return courtRepository.save(court);
    }

    public Court getCourtById(Long id) {
        return courtRepository.findById(id).orElse(null);
    }

    public List<Court> getAllCourts() {
        return courtRepository.findAll();
    }

    public void deleteCourt(Long id) {
        courtRepository.deleteById(id);
    }

    public void saveImages(Long courtId, MultipartFile[] files) {
        Court court = courtRepository.findById(courtId)
                .orElseThrow(() -> new IllegalArgumentException("Court not found"));

        List<Image> images = new ArrayList<>();

        // Lấy tên của các file mà không cần lưu file vào thư mục
        for (MultipartFile file : files) {
            if (!file.isEmpty()) {
                try {
                    // Lấy tên file (giữ nguyên tên file gốc)
                    String fileName = file.getOriginalFilename();

                    // Tạo đối tượng Image và lưu tên file vào cơ sở dữ liệu
                    Image image = new Image();
                    image.setName(fileName); // Lưu tên file vào DB
                    image.setCourt(court); // Gắn ảnh với sân

                    images.add(image); // Thêm ảnh vào danh sách
                } catch (Exception e) {
                    // Log lỗi nếu có
                    System.err.println("Failed to save image: " + e.getMessage());
                }
            }
        }

        // Lưu các ảnh vào cơ sở dữ liệu
        if (!images.isEmpty()) {
            imageRepository.saveAll(images); // Lưu tất cả ảnh vào DB
            System.out.println("Images saved to DB");
        } else {
            System.out.println("No images to save");
        }
    }

    public boolean deleteImage(Long courtId, Long imageId) {
        // Tìm ảnh trong cơ sở dữ liệu và xóa nó
        Optional<Image> image = imageRepository.findById(imageId);
        if (image.isPresent()) {
            // Xóa ảnh từ hệ thống tệp (nếu cần)
            File imageFile = new File("uploads/" + image.get().getName());
            if (imageFile.exists()) {
                imageFile.delete();
            }

            // Xóa ảnh khỏi cơ sở dữ liệu
            imageRepository.delete(image.get());
            return true;
        }
        return false;
    }

    public List<Schedule> getAllSchedulesForCourt(Long courtId) {
        Court court = courtRepository.findById(courtId).orElse(null);
        return court != null ? court.getSchedules() : null;
    }

    @Transactional
    public void addSchedules(Long courtId, List<String> times, List<Double> prices) {
        Court court = courtRepository.findById(courtId)
                .orElseThrow(() -> new IllegalArgumentException("Court not found"));

        for (int i = 0; i < times.size(); i++) {
            Schedule schedule = new Schedule();
            schedule.setTime(times.get(i));
            schedule.setPrice(prices.get(i));
            schedule.setCourt(court);
            schedule.setRented(false); // By default, set as not rented
            scheduleRepository.save(schedule);
        }
    }

    public Schedule getScheduleById(Long scheduleId) {
        return scheduleRepository.findById(scheduleId)
                .orElseThrow(() -> new IllegalArgumentException("Schedule not found"));
    }

    public Image getImageById(Long imageId) {
        return imageRepository.findById(imageId)
                .orElseThrow(() -> new IllegalArgumentException("Image not found"));
    }

    @Transactional
    public void updateSchedule(Long scheduleId, String time, double price, boolean rented) {
        Schedule schedule = scheduleRepository.findById(scheduleId)
                .orElseThrow(() -> new IllegalArgumentException("Schedule not found"));
        schedule.setTime(time);
        schedule.setPrice(price);
        schedule.setRented(rented);
        scheduleRepository.save(schedule);
    }

    public void deleteSchedule(Long scheduleId) {
        scheduleRepository.deleteById(scheduleId);
    }

    public Long getCourtIdByScheduleId(Long scheduleId) {
        Schedule schedule = getScheduleById(scheduleId);
        return schedule.getCourt().getId();
    }

    public Long getCourtIdByImageId(Long imageId) {
        Image image = getImageById(imageId);
        return image.getCourt().getId();
    }

    public void deleteImage(Long imageId) {
        imageRepository.deleteById(imageId);
    }

}
