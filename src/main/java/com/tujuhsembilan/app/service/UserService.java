package com.tujuhsembilan.app.service;

import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tujuhsembilan.app.model.User;
import com.tujuhsembilan.app.repository.UserRepository;

import jakarta.transaction.Transactional;

@Service
@Transactional
public class UserService {

    @Autowired
    private UserRepository repo;

    public User create(User user) {
        return repo.save(user);
    }

    public User update(User user) {
        return repo.save(user);
    }

    public void delete(UUID id) {
        repo.deleteById(id);
    }

    public User findById(UUID id) {
        return repo.findById(id).orElse(null);
    }

    public Iterable<User> findAll() {
        return repo.findAll();
    }

    public List<User> findByEmail(String email) {
        return repo.findByEmail(email);
    }

}
