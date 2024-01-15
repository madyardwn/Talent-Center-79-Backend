package com.tujuhsembilan.app.repository;

import java.util.List;
import java.util.UUID;

import org.springframework.data.repository.CrudRepository;

import com.tujuhsembilan.app.model.User;

public interface UserRepository extends CrudRepository<User, UUID> {

    List<User> findByEmail(String email);
}
