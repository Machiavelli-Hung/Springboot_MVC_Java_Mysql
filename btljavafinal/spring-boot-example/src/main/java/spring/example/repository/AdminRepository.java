//package com.yourpackage.repository;
package spring.example.repository;
import spring.example.model.User;

import org.springframework.boot.autoconfigure.data.web.SpringDataWebProperties.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;



@Repository
public interface AdminRepository extends JpaRepository<User, Long> {
    
}
