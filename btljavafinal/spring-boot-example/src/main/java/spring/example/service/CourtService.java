package spring.example.service;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
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

import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.nio.file.Path;

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

    @Value("${upload.directory}")
    private String uploadDir;

    public Court getCourtById(Long id) {
        return courtRepository.findById(id)
                .orElseThrow(() -> new IllegalArgumentException("Court not found"));
    }

    // Phương thức để lấy tất cả hình ảnh của sân
    public List<Image> getImagesByCourtId(Long courtId) {
        return imageRepository.findByCourtId(courtId);
    }

    // Phương thức để lấy tất cả lịch của sân
    public List<Schedule> getSchedulesByCourtId(Long courtId) {
        return scheduleRepository.findByCourtId(courtId);
    }

    public List<Court> search(String keyword) {
        if (keyword == null || keyword.trim().isEmpty()) {
            return courtRepository.findAll(); // Nếu không có từ khóa, trả về tất cả
        }
        return courtRepository.findByNameContainingIgnoreCaseOrAddressContainingIgnoreCase(keyword, keyword);
    }

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
                    // Tạo thư mục nếu chưa có
                    File directory = new File(uploadDir);
                    if (!directory.exists()) {
                        directory.mkdirs();
                    }

                    // Lưu file vào thư mục tĩnh (static/images)
                    String fileName = file.getOriginalFilename();
                    File targetFile = new File(directory, fileName);
                    Files.copy(file.getInputStream(), targetFile.toPath(), StandardCopyOption.REPLACE_EXISTING);

                    // Tạo đối tượng Image và lưu tên file vào cơ sở dữ liệu
                    Image image = new Image();
                    image.setName(fileName); // Lưu tên file vào DB
                    image.setCourt(court); // Gắn ảnh với sân

                    images.add(image); // Thêm ảnh vào danh sách
                } catch (IOException e) {
                    System.err.println("Failed to save image: " + e.getMessage());
                }
            }
        }

        // Lưu các ảnh vào cơ sở dữ liệu
        if (!images.isEmpty()) {
            imageRepository.saveAll(images); // Lưu tất cả ảnh vào DB
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
        // Tìm ảnh trong cơ sở dữ liệu
        Image image = imageRepository.findById(imageId)
                .orElseThrow(() -> new IllegalArgumentException("Image not found"));

        // Xoá ảnh khỏi cơ sở dữ liệu
        imageRepository.deleteById(imageId);

        // Xoá ảnh khỏi thư mục static/images
        String fileName = image.getName(); // Lấy tên ảnh từ cơ sở dữ liệu
        Path imagePath = Paths.get("src/main/resources/static/images", fileName);

        try {
            // Kiểm tra xem tệp có tồn tại không trước khi xoá
            if (Files.exists(imagePath)) {
                Files.delete(imagePath); // Xoá tệp ảnh khỏi hệ thống
                System.out.println("Image deleted from file system: " + fileName);
            } else {
                System.out.println("Image file not found: " + fileName);
            }
        } catch (IOException e) {
            System.err.println("Failed to delete image from file system: " + e.getMessage());
        }
    }

    public List<Court> getCourtsByOwnerId(Long ownerId) {
        return courtRepository.findByOwnerId(ownerId);
    }

}
