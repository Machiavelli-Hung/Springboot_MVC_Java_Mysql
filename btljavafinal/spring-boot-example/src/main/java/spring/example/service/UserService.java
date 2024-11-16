package spring.example.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import spring.example.model.User;
import spring.example.repository.UserRepository;

import java.util.List;
import java.util.Optional;

@Service
public class UserService {

    @Autowired
    private UserRepository userRepository;

    /**
     * Retrieves all users from the database.
     * @return List of users.
     */
    public List<User> getAllUsers() {
        return userRepository.findAll();
    }

    /**
     * Retrieves a user by their ID.
     * @param id The ID of the user.
     * @return The user with the given ID, or null if not found.
     */
    public User getUserById(Long id) {
        Optional<User> user = userRepository.findById(id);
        return user.orElse(null); // Return null if user not found
    }

    /**
     * Saves a new or existing user to the database.
     * @param user The user to save.
     */
    public void saveUser(User user) {
        userRepository.save(user);
    }

    /**
     * Deletes a user by their ID.
     * @param id The ID of the user to delete.
     */
    public void deleteUser(Long id) {
        userRepository.deleteById(id);
    }

    /**
     * Retrieves a user by their username.
     * @param username The username of the user.
     * @return The user with the given username, or null if not found.
     */
    public User getUserByUsername(String username) {
        return userRepository.findByUsername(username);
    }
}
