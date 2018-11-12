package com.baizhi.test1;

import com.baizhi.dao.BaseDao;
import com.baizhi.entity.Admin;
import com.baizhi.service.AdminService;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

public class AdminServiceTest  extends BaseTest {
    @Autowired
    private AdminService adminService;
    @Test
    public void test1(){
        Admin admin = new Admin();
        admin.setUsername("root");
        admin.setPassword("root");
        Admin all = adminService.findByUsername(admin);
        System.out.println(all);
    }

}
