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

    public boolean checkLogin(String username, String password) {
        User user = userRepository.findByUsername(username);
        return user != null && (user.getPassword().equals(password) == true ) && (user.getUsername().equals(username) == true);
    }

    public User getUserByUsername(String username) {
        return userRepository.findByUsername(username);
    }

    public boolean checkPassword(User user, String oldPassword) {
        // Giả sử mật khẩu được mã hóa (có thể dùng BCrypt hoặc SHA-256)
        return user.getPassword().equals(oldPassword); // Cần mã hóa mật khẩu thực tế
    }

    // Cập nhật mật khẩu mới
    public void updatePassword(User user, String newPassword) {
        user.setPassword(newPassword); // Giả sử bạn đã mã hóa mật khẩu
        userRepository.save(user); // Lưu lại người dùng với mật khẩu mới
    }


}
