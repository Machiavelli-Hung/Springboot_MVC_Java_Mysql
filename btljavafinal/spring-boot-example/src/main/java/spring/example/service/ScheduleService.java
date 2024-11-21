package spring.example.service;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;

import spring.example.model.Schedule;
import spring.example.repository.ScheduleRepository;

@Service
public class ScheduleService {
    @Autowired
    private ScheduleRepository scheduleRepository;

    public Schedule findById(Long id) {
        return scheduleRepository.findById(id).orElse(null);
    }

    public void save(Schedule schedule) {
        scheduleRepository.save(schedule);
    }
}
