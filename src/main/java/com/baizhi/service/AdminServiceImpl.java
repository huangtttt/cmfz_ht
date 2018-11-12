package com.baizhi.service;

import com.baizhi.dao.AdminDao;
import com.baizhi.entity.Admin;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class AdminServiceImpl implements AdminService {

    @Autowired
    private AdminDao adminDao;


    @Transactional(propagation = Propagation.SUPPORTS)
    public Admin findByUsername(Admin admin) {
        Admin adminList = adminDao.queryByUsername(admin);
        return adminList;
    }

    @Override
    public void motify(Admin admin) {
        adminDao.update(admin);
    }

}
