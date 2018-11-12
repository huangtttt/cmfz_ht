package com.baizhi.service;

import com.baizhi.dao.UserDao;
import com.baizhi.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;
import java.util.UUID;

@Service
@Transactional
public class UserServiceImpl implements UserService {
    @Autowired
    private UserDao userDao;
    @Override
    public void add(User user) {
        user.setId(UUID.randomUUID().toString());
        user.setPublishDate(new Date());
        userDao.insert(user);
    }

    @Override
    public void remove(String id) {
        userDao.delete(id);
    }

    @Override
    public void motify(User user) {
        userDao.update(user);
    }

    @Override
    public List<User> findAll() {
        List<User> users = userDao.queryAll();
        return users;
    }

    @Override
    public User findOne(String id) {
        User user = userDao.queryOne(id);
        return user;
    }

    @Override
    public User findByUsername(User user) {
        return userDao.queryByUsername(user);
    }

    @Override
    public User findSalt(User user) {
        return userDao.querySalt(user);
    }
}
