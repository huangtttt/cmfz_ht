package com.baizhi.controller;

import com.baizhi.entity.Banner;
import com.baizhi.entity.Menu;
import com.baizhi.service.BannerService;
import com.baizhi.util.UploadUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jmx.export.annotation.ManagedResource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import java.net.FileNameMap;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/banner")
public class BannerController {
    @Autowired
    private BannerService bannerService;


    @RequestMapping("/findAll")
    public @ResponseBody
    List<Banner> findAll(){
        List<Banner> serviceAll = bannerService.findAll();
        return serviceAll;
    }


    @RequestMapping("/add")
    public @ResponseBody
    Map<String,Object> add(Banner banner, HttpServletRequest request, MultipartFile imgPathbb){
        Map<String,Object> result=new HashMap<String,Object>();
        try{
            String fileName = UploadUtil.upload(imgPathbb, request, "guruImg");
            banner.setImgPath(fileName);
            bannerService.add(banner);
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
            bannerService.remove(id);
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
                bannerService.remove(s);
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

    @RequestMapping("/motify")
    public @ResponseBody
    Map<String,Object> motify(Banner banner, HttpServletRequest request, MultipartFile imgPathbb){
        Map<String,Object> result=new HashMap<String,Object>();
        try{
            String fileName = UploadUtil.upload(imgPathbb, request, "guruImg");
            banner.setImgPath(fileName);
            bannerService.motify(banner);
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
    public @ResponseBody Banner findOne(String id){
        Banner serviceOne = bannerService.findOne(id);
        return serviceOne;
    }




}
