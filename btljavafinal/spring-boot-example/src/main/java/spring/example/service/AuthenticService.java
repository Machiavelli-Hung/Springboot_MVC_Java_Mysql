package spring.example.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.example.exception.UserException;
import spring.example.model.User;
import spring.example.repository.UserRepository;
import java.util.regex.Pattern;

import javax.servlet.http.HttpSession;

import java.util.regex.Matcher;

@Service
public class AuthenticService {
    @Autowired
    private UserRepository userRepository;

    // kiem tra ky tu dac biet
    private static boolean containsSpecialChar(String password) {
        String specialCharPattern = "[!@#$%^&*(),.?\":{}|<>]";
        Pattern pattern = Pattern.compile(specialCharPattern);
        Matcher matcher = pattern.matcher(password);
        return matcher.find();
    }
        private static boolean strongPassword(String password) {
        // du chu  hoa, chu thuong,so ,ky tu dac biet 
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

    public void saveUser(User user) {
        if (userRepository.existsByUsername(user.getUsername())) {
            throw new UserException("Username đã tồn tại.");
        }
        if (userRepository.existsByEmail(user.getEmail())) {
            throw new UserException("Email đã tồn tại.");
        }
        if (userRepository.existsByPhoneNumber(user.getPhoneNumber())) {
            throw new UserException("Số điện thoại đã tồn tại.");
        }
        
        if(user.getUsername().length() < 6 || containsSpecialChar(user.getUsername())){    
            throw new UserException("Tên người dùng phải có 6 ký tự trở lên và không được chứa kí tự đặc biệt nào");
        }
        if(user.getPassword().length() < 6){    
            throw new UserException("Mật khẩu người dùng phải có 6 ký tự trở lên ");
        }
        if(!strongPassword(user.getPassword())){   
            throw new UserException("Mật khẩu phải chứa chữ hoa, chữ thường, số và ký tự đặc biệt");
        }
        if(!isValidPhoneNumber(user.getPhoneNumber())) {
            throw new UserException("Số điện thoại không được chứa ký tự đặc biệt và phải có đủ 10 số hoặc 11 số ");
        }
        userRepository.save(user);
    }

    public boolean checkAdmin(HttpSession session){ 
        User userLoginCheck = (User) session.getAttribute("userLogin");
        if(userLoginCheck.getRole().compareTo("admin") == 0){    
            return true;
        }else{
            return false;
        }
    }
    
}
