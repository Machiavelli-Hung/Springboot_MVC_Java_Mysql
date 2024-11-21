package spring.example.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import spring.example.model.Court;

@Repository
public interface CourtRepository extends JpaRepository<Court, Long> {
    List<Court> findByNameContainingIgnoreCaseOrAddressContainingIgnoreCase(String name, String address);

    List<Court> findByOwnerId(Long ownerId);
}