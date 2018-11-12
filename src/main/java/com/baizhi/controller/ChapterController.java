package com.baizhi.controller;

import com.baizhi.entity.Chapter;
import com.baizhi.service.ChapterService;
import com.baizhi.util.ReadMp3;
import com.baizhi.util.UploadUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/chapter")
public class ChapterController {
    @Autowired
    private ChapterService chapterService;

    @RequestMapping("/remove")
    public @ResponseBody
    Map<String,Object> remove(String id){
        Map<String,Object> result=new HashMap<String,Object>();
        try{
            chapterService.remove(id);
            result.put("success",true);
            result.put("message","删除成功");
        }catch (Exception e){
            e.printStackTrace();
            result.put("success",false);
            result.put("message","删除失败");
        }
        return result;
    }

    @RequestMapping("/motifyguru")
    public @ResponseBody
    Map<String,Object> motifyguru(Chapter chapter, HttpServletRequest request, MultipartFile downPathaa){
        Map<String,Object> result=new HashMap<String,Object>();
        System.out.println(chapter);
        try{
            String fileName = UploadUtil.upload(downPathaa, request, "chapter");
            String fileName1 = fileName.substring(fileName.lastIndexOf("/")+1);

            chapter.setDownPath(fileName1);
            chapterService.motify(chapter);
            result.put("success",true);
            result.put("message","修改成功");
        }catch (Exception e){
            e.printStackTrace();
            result.put("success",false);
            result.put("message","修改失败");
        }
        return result;
    }

    @RequestMapping("/add")
    public @ResponseBody
    Map<String,Object> add(Chapter chapter, HttpServletRequest request, MultipartFile downPathaa){
        System.out.println(chapter);
        Map<String,Object> result=new HashMap<String,Object>();
        System.out.println(chapter);
        try{
            String fileName = UploadUtil.upload(downPathaa, request, "chapter");
            String fileName1 = fileName.substring(fileName.lastIndexOf("/")+1);
            String abc="D:\\ideacode\\cmfz_ht\\target\\easyui_tabl\\back\\chapter\\" + fileName1;
            String size = ReadMp3.size(abc);
            chapter.setSize(size);
            synchronized (ReadMp3.read(abc)) {
                String read = ReadMp3.read(abc);
                chapter.setDuration(read);
            }
            System.out.println(chapter);
            chapter.setDownPath(fileName1);
            System.out.println("文件路径："+fileName);
            chapterService.add(chapter);
            result.put("success",true);
            result.put("message","添加成功");
        }catch (Exception e){
            e.printStackTrace();
            result.put("success",false);
            result.put("message","添加失败");
        }
        return result;
    }




}
