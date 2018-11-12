package com.baizhi.controller;


import com.baizhi.entity.Admin;
import com.baizhi.entity.Menu;
import com.baizhi.service.AdminService;
import com.baizhi.service.MenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.List;


@Controller
@RequestMapping("/admin")
public class AdminController {
    @Autowired
    private AdminService adminService;

    @RequestMapping("/findAllByUsername")
    public String findByUsername(Admin admin,HttpServletRequest request,String code){
        String validationCode1 = (String)request.getSession().getAttribute("validationCode");
        System.out.println(validationCode1);
        System.out.println(code);

        System.out.println(admin);
        if(validationCode1.equals(code)){
            Admin adminList = adminService.findByUsername(admin);

            if(adminList!=null&&adminList.getUsername().length()>0&&adminList.getPassword().length()>0){
                request.getSession().setAttribute("Login","Login");
                request.getSession().setAttribute("admin",adminList);
                System.out.println("登陆成功");
                return "redirect:/back/main/main1.jsp";
            }else{
                System.out.println("登录失败");
                return "redirect:/back/login/login.jsp";
            }
        }else{
            return "redirect:/back/login/login.jsp";
        }
    }
    @RequestMapping("/remove")
    public String remove(HttpServletRequest request){
        request.getSession().setAttribute("admin",null);
        request.getSession().setAttribute("Login",null);
        return "redirect:/back/login/login.jsp";
    }
    @RequestMapping("/updatapassword")
    public String remove(Admin admin) {
        try {
            System.out.println(admin);
            adminService.motify(admin);
            System.out.println("修改成功");
            return "redirect:/back/login/login.jsp";
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("修改失败");
            return "redirect:/back/login/login.jsp";
        }


    }

}
