package spring.example.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.example.exception.userException;
import spring.example.model.User;
import spring.example.repository.UserRepository;

@Service
public class UserService {
    @Autowired
    private UserRepository userRepository;

    public void saveUser(User user) {
        if (userRepository.existsByUsername(user.getUsername())) {
            throw new userException("Username đã tồn tại.");
        }
        if (userRepository.existsByEmail(user.getEmail())) {
            throw new userException("Email đã tồn tại.");
        }
        if (userRepository.existsByPhoneNumber(user.getPhoneNumber())) {
            throw new userException("Số điện thoại đã tồn tại.");
        }
        userRepository.save(user);
    }

}
