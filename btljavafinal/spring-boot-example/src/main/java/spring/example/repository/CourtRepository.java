package spring.example.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import spring.example.model.Court;
import java.util.List;

@Repository
public interface CourtRepository extends JpaRepository<Court, Long> {
    List<Court> findByNameContainingIgnoreCaseOrAddressContainingIgnoreCase(String name, String address);
}