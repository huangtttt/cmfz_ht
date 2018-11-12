package com.baizhi.service;

import com.baizhi.entity.User;

import java.util.List;

public interface UserService {
    void add(User user);
    void remove(String id);
    void motify(User user);
    List<User> findAll();
    User findOne(String id);
    User findByUsername(User user);
    User findSalt(User user);
}
