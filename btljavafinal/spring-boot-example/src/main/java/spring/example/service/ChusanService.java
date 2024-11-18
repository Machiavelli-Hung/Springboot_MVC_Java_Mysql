package spring.example.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import spring.example.model.User;
import spring.example.repository.ChuSanRepository;

@Service
public class ChusanService {

    @Autowired
    private ChuSanRepository ChusanRepository;

    public List<User> getAllCustomers() {
        return ChusanRepository.findAll();
    }

    public void deleteCustomer(Long id) {
        ChusanRepository.deleteById(id);
    }

    public User getCustomerById(Long id) {
        return ChusanRepository.findById(id).orElse(null);
    }

    public void updateCustomer(User customer) {
        ChusanRepository.save(customer);
    }

    public Page<User> getAllCustomers(int page, int size) {
        return ChusanRepository.findAll(PageRequest.of(page, size));
    }

}