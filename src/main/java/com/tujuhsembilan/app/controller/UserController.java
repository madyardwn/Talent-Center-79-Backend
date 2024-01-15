package com.tujuhsembilan.app.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.tujuhsembilan.app.model.User;
import com.tujuhsembilan.app.service.UserService;
import org.springframework.web.bind.annotation.GetMapping;

@RestController // Anotasi ini menandakan bahwa kelas ini adalah controller REST.
@RequestMapping("/api/users") // Menentukan base path untuk semua endpoint di controller ini.
public class UserController {

    @Autowired
    private UserService userService;

    @GetMapping
    public Iterable<User> findAll() {
        return userService.findAll();
    }

}
