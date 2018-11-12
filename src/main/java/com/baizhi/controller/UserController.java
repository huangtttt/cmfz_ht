package com.baizhi.controller;


import com.baizhi.entity.User;
import com.baizhi.service.UserService;
import com.baizhi.util.SaltUtils;
import com.baizhi.util.UploadUtil;
import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/user")
public class UserController {
    @Autowired
    private UserService userService;


    @RequestMapping("/findAll")
    public @ResponseBody
    List<User> findAll(){
        List<User> serviceAll = userService.findAll();
        return serviceAll;
    }


    @RequestMapping("/add")
    public @ResponseBody
    Map<String,Object> add(User user, HttpServletRequest request, MultipartFile headPicdd){
        System.out.println(user);
        Map<String,Object> result=new HashMap<String,Object>();
        try{
            String salt = SaltUtils.getSalt(4);
            String md2Hex = DigestUtils.md2Hex(user.getPassword() + salt);
            user.setSalt(salt);
            user.setPassword(md2Hex);
            String fileName = UploadUtil.upload(headPicdd, request, "userImg");
            user.setHeadPic(fileName);
            userService.add(user);
            result.put("success",true);
            result.put("message","添加成功");
        }catch (Exception e){
            e.printStackTrace();
            result.put("success",false);
            result.put("message","添加失败");
        }
        return result;
    }



    @RequestMapping("/removeAll")
    public @ResponseBody
    Map<String,Object> removeAll(String[] ids,String id){
        Map<String,Object> result=new HashMap<String,Object>();
        try{
            if (ids==null){
                userService.remove(id);
            }else{
                for (String s : ids) {
                    userService.remove(s);
                }
            }
            result.put("success",true);
            result.put("message","删除多行成功");
        }catch (Exception e){
            e.printStackTrace();
            result.put("success",false);
            result.put("message","删除多行失败");
        }
        return result;
    }

    @RequestMapping("/motifyuser")
    public @ResponseBody
    Map<String,Object> motifyuser(User user,HttpServletRequest request, MultipartFile headPicdd){
        Map<String,Object> result=new HashMap<String,Object>();
        try{
            String fileName = UploadUtil.upload(headPicdd, request, "userImg");
            user.setHeadPic(fileName);
            System.out.println(user);
            userService.motify(user);
            result.put("success",true);
            result.put("message","修改成功");
        }catch (Exception e){
            e.printStackTrace();
            result.put("success",false);
            result.put("message","修改失败");
        }
        return result;
    }


    @RequestMapping("/findOne")
    public @ResponseBody User findOne(String id){
        User serviceOne = userService.findOne(id);
        return serviceOne;
    }


    @RequestMapping("/findByName")
    public @ResponseBody Map<String,Object> findByName(User user){
        Map<String, Object> map = new HashMap<>();
        System.out.println("88888888888"+user);
        try {
            User salt = userService.findSalt(user);
            String s = DigestUtils.md2Hex(user.getPassword() + salt);
            user.setPassword(s);
            User byUsername = userService.findByUsername(user);
            System.out.println(byUsername);
            if (byUsername==null){
                map.put("success",false);
                map.put("message","测试登录失败！！！");
            }else {
                map.put("success",true);
                map.put("message","测试登陆成功！！！");
            }
        }catch (Exception e){
            e.printStackTrace();
            map.put("success",false);
            map.put("message","测试登录失败！！！");
        }
        return map;
    }



}
