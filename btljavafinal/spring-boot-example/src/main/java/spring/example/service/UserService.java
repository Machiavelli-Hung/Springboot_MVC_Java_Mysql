package spring.example.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;

import spring.example.exception.UserException;
import spring.example.model.User;
import spring.example.repository.UserRepository;

@Service
public class UserService {
    @Autowired
    private UserRepository userRepository;

    public List<User> getOwners() {
        return userRepository.findByRole("owner");
    }

    public User getUserById(Long id) {
        return userRepository.findById(id)
                .orElseThrow(() -> new UserException("Không tìm thấy người dùng với id: " + id));
    }

    public boolean checkLogin(String username, String password) {
        User user = userRepository.findByUsername(username);
        return user != null && (user.getPassword().equals(password) == true)
                && (user.getUsername().equals(username) == true);
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

    public List<User> getAllCustomers() {
        return userRepository.findAll();
    }

}
