//package com.yourpackage.repository;
package spring.example.repository;

import spring.example.model.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import java.util.List;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {
    // Bạn có thể thêm các truy vấn tùy chỉnh ở đây nếu cần
    boolean existsByUsername(String username);

    boolean existsByEmail(String email);

    boolean existsByPhoneNumber(String phoneNumber);

    User findByUsername(String username);

    List<User> findByRole(String role);

    boolean existsByPassword(String password);

    User findByEmail(String email);
}