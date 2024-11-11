package spring.example.service;

import org.springframework.beans.factory.annotation.Autowired;

import spring.example.model.User;
import spring.example.repository.UserRepository;

public class UserService {
    @Autowired
    private UserRepository repo;

    public void saveUser(User user) {
        repo.save(user);
    }
}
