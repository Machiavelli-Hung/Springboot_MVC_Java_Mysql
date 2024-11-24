package spring.example.service;

import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpSession;

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

    public void saveUser(User user, String confirmpassword) {
        if (userRepository.existsByUsername(user.getUsername())) {
            throw new UserException("Username đã tồn tại.");
        }
        if (userRepository.existsByEmail(user.getEmail())) {
            throw new UserException("Email đã tồn tại.");
        }
        if (userRepository.existsByPhoneNumber(user.getPhoneNumber())) {
            throw new UserException("Số điện thoại đã tồn tại.");
        }

        // phan nay them vao de check mat khau chuan hon khong xoa
        if (user.getUsername().length() < 6 || containsSpecialChar(user.getUsername())) {
            throw new UserException("Tên người dùng phải có 6 ký tự trở lên và không được chứa kí tự đặc biệt nào");
        }
        if (user.getPassword().compareTo(confirmpassword) != 0) {
            throw new UserException("Mật khẩu không nhập chính xác với mật khẩu ! nhập lại");
        }
        if (user.getPassword().length() < 6) {
            throw new UserException("Mật khẩu người dùng phải có 6 ký tự trở lên ");
        }
        if (!isValidPhoneNumber(user.getPhoneNumber())) {
            throw new UserException("Số điện thoại không được chứa ký tự đặc biệt và phải có đủ 10 số hoặc 11 số ");
        }

        userRepository.save(user);
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

    public void deleteCustomer(Long id) {
        userRepository.deleteById(id);
    }

    public User getCustomerById(Long id) {
        return userRepository.findById(id).orElse(null);
    }

    public void updateCustomer(User customer) {
        userRepository.save(customer);
    }

    private static boolean containsSpecialChar(String password) {
        String specialCharPattern = "[!@#$%^&*(),.?\":{}|<>]";
        Pattern pattern = Pattern.compile(specialCharPattern);
        Matcher matcher = pattern.matcher(password);
        return matcher.find();
    }

    private static boolean strongPassword(String password) {
        // du chu hoa, chu thuong,so ,ky tu dac biet
        String passwordPattern = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[!@#$%^&*(),.?\":{}|<>]).{8,}$";

        Pattern pattern = Pattern.compile(passwordPattern);
        Matcher matcher = pattern.matcher(password);
        return matcher.matches();
    }

    // kiem tra so dien thoai
    private static boolean isValidPhoneNumber(String phoneNumber) {
        // so dien thoai phai co 10 so hoac 11 so va khong chua chu cai
        String phonePattern = "^[0-9]{10,11}$";
        return Pattern.matches(phonePattern, phoneNumber);
    }

    public boolean checkAdmin(HttpSession session) {
        User userLoginCheck = (User) session.getAttribute("userLogin");
        if (userLoginCheck.getRole().compareTo("admin") == 0) {
            return true;
        } else {
            return false;
        }
    }

    // check user
    public boolean checkUser(HttpSession session) {
        User userLoginCheck = (User) session.getAttribute("userLogin");
        if (userLoginCheck.getRole().compareTo("user") == 0) {
            return true;
        } else {
            return false;
        }
    }

    // check owner
    public boolean checkOwner(HttpSession session) {
        User userLoginCheck = (User) session.getAttribute("userLogin");
        if (userLoginCheck.getRole().compareTo("owner") == 0) {
            return true;
        } else {
            return false;
        }
    }

    public Long getCurrentUserId(HttpSession session) {
        // Lấy đối tượng User từ session
        User currentUser = (User) session.getAttribute("userLogin");

        if (currentUser == null) {
            throw new IllegalStateException("Người dùng chưa đăng nhập");
        }

        return currentUser.getId(); // Trả về ID của người dùng
    }

    public String getPassword(String email) {
        User check = userRepository.findByEmail(email);
        return check.getPassword();
    }

    public boolean checkEmail(String email) {
        return userRepository.existsByEmail(email);
    }
}
