package spring.example.repository;
import spring.example.model.Court;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;


public interface CourtRepository extends JpaRepository<Court, Long> {

}
