package com.dacm.taskManager.service;

import com.dacm.taskManager.entity.User;
import org.springframework.http.ResponseEntity;

import java.util.List;

public interface UserService {

    List<User> getAllUsers();


    ResponseEntity<List<User>> save(User[] users);

}
