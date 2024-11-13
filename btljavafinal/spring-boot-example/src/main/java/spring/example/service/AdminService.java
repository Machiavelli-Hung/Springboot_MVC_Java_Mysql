package spring.example.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import spring.example.repository.AdminRepository;

@Service
public class AdminService {
    @Autowired
    private AdminRepository AdminRepository;
    
}
