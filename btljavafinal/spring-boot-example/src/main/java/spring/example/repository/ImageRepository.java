package spring.example.repository;

import spring.example.model.Image;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.List;

public interface ImageRepository extends JpaRepository<Image, Long> {
    List<Image> findByCourtId(Long courtId); // Tìm hình ảnh của sân theo courtId
}