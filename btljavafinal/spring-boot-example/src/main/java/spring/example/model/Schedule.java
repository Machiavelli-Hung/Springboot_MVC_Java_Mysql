//Schedule.java
package spring.example.model;
 
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
 
@Entity
public class Schedule {
 
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
 
    private String time; // Buổi sáng hoặc buổi chiều
    private double price; // Giá thuê
    private boolean isRented; // Trạng thái thuê (true: đã thuê, false: chưa thuê)
 
    // Nhiều buổi (Schedule) có thể thuộc về một sân (Court)
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "court_id", nullable = false)
    private Court court;
 
    // Getters và Setters
    public Long getId() {
        return id;
    }
 
    public void setId(Long id) {
        this.id = id;
    }
 
    public String getTime() {
        return time;
    }
 
    public void setTime(String time) {
        this.time = time;
    }
 
    public double getPrice() {
        return price;
    }
 
    public void setPrice(double price) {
        this.price = price;
    }
 
    public boolean isRented() {
        return isRented;
    }
 
    public void setRented(boolean rented) {
        isRented = rented;
    }
 
    public Court getCourt() {
        return court;
    }
 
    public void setCourt(Court court) {
        this.court = court;
    }
}