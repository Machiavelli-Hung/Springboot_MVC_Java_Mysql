package spring.example.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.example.model.User;
import spring.example.repository.AdminRepository;

@Service
public class AdminService {

    @Autowired
    private AdminRepository adminRepository;

    public List<User> getAllCustomers() {
        return adminRepository.findAll();
    }
    
}
