package com.baizhi.controller;


import com.baizhi.entity.Guru;
import com.baizhi.service.GuruService;
import com.baizhi.util.UploadUtil;
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
@RequestMapping("/guru")
public class GuruController {
    @Autowired
    private GuruService guruService;


    @RequestMapping("/findAll")
    public @ResponseBody
    List<Guru> findAll(){
        List<Guru> serviceAll = guruService.findAll();
        return serviceAll;
    }


    @RequestMapping("/add")
    public @ResponseBody
    Map<String,Object> add(Guru guru, HttpServletRequest request, MultipartFile headPiccc){
        System.out.println(guru);
        Map<String,Object> result=new HashMap<String,Object>();
        try{
            String fileName = UploadUtil.upload(headPiccc, request, "bannerImg");
            guru.setHeadPic(fileName);
            guruService.add(guru);
            result.put("success",true);
            result.put("message","添加成功");
        }catch (Exception e){
            e.printStackTrace();
            result.put("success",false);
            result.put("message","添加失败");
        }
        return result;
    }

    @RequestMapping("/remove")
    public @ResponseBody
    Map<String,Object> remove(String id){
        Map<String,Object> result=new HashMap<String,Object>();
        try{
            guruService.remove(id);
            result.put("success",true);
            result.put("message","删除成功");
        }catch (Exception e){
            e.printStackTrace();
            result.put("success",false);
            result.put("message","删除失败");
        }
        return result;
    }

    @RequestMapping("/removeAll")
    public @ResponseBody
    Map<String,Object> removeAll(String[] id){
        Map<String,Object> result=new HashMap<String,Object>();
        try{
            for (int i = 0; i < id.length; i++) {
                String s = id[i];
                guruService.remove(s);
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

    @RequestMapping("/motifyguru")
    public @ResponseBody
    Map<String,Object> motifyguru(Guru guru,HttpServletRequest request, MultipartFile headPiccc){
        Map<String,Object> result=new HashMap<String,Object>();
        System.out.println(guru);
        try{
            String fileName = UploadUtil.upload(headPiccc, request, "bannerImg");
            guru.setHeadPic(fileName);
            guruService.motify(guru);
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
    public @ResponseBody Guru findOne(String id){
        Guru serviceOne = guruService.findOne(id);
        return serviceOne;
    }




}
