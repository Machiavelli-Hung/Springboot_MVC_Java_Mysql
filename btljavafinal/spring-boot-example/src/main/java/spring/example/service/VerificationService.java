package spring.example.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;
import spring.example.model.Verification;
import spring.example.repository.VerificationRepository;

import java.util.Optional;
import java.util.Random;

@Service
public class VerificationService {

    @Autowired
    private JavaMailSender mailSender;

    @Autowired
    private VerificationRepository repository;

    public void sendPin(String email) {
        String pin = generatePin();

        // Lưu mã PIN vào database
        Verification verification = repository.findByEmail(email)
                .orElse(new Verification());
        verification.setEmail(email);
        verification.setPin(pin);
        repository.save(verification);


        // Gửi mã PIN qua email
        SimpleMailMessage message = new SimpleMailMessage();
        message.setTo(email);

        // System.out.println(email); cai này để check có thể xóa đi nếu cần 

        message.setSubject("Yêu cầu thay đổi mật khẩu");
        message.setText("Mã PIN của bạn là: " + pin);
        mailSender.send(message);
    }

    public boolean verifyPin(String email, String pin) {
        Optional<Verification> verification = repository.findByEmail(email);
        return verification.map(value -> value.getPin().equals(pin)).orElse(false);
    }

    private String generatePin() {
        return String.valueOf(new Random().nextInt(900000) + 100000); // Tạo mã PIN 6 chữ số
    }

    // phan nay gui len tren de xac nhan quyen mat khau 

    public void sendPassword(String email) {
        String pin = generatePin();

        // Lưu mã PIN vào database
        Verification verification = repository.findByEmail(email)
                .orElse(new Verification());
        verification.setEmail(email);
        verification.setPin(pin);
        repository.save(verification);


        // Gửi mã PIN qua email
        SimpleMailMessage message = new SimpleMailMessage();
        message.setTo(email);

        // System.out.println(email); cai này để check có thể xóa đi nếu cần 

        message.setSubject("Yêu cầu lấy lại mật khẩu");
        message.setText("Mã PIN của bạn là: " + pin);
        mailSender.send(message);
    }
}
