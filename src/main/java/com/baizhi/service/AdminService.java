package com.baizhi.service;

import com.baizhi.entity.Admin;

public interface AdminService {
    Admin findByUsername(Admin admin);
    void motify(Admin admin);

}
