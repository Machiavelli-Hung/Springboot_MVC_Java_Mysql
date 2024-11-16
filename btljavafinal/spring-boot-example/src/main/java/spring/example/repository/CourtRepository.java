package spring.example.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import spring.example.model.Court;

@Repository
public interface CourtRepository extends JpaRepository<Court, Long> {
}
