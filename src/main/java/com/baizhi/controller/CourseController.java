package com.baizhi.controller;

import com.baizhi.entity.Course;
import com.baizhi.service.CourseService;
import org.apache.ibatis.annotations.Results;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/course")
public class CourseController {
    @Autowired
    private CourseService courseService;

    @RequestMapping("add")
    public @ResponseBody
    Map<String,Object> add(Course course){
        Map<String, Object> result = new HashMap<>();
        try {
            courseService.add(course);
            result.put("success",true);
            result.put("message","添加成功！！");
        }catch (Exception e){
            e.printStackTrace();
            result.put("success",false);
            result.put("message","添加失败！！");
        }
        return result;
    }

    @RequestMapping("remove")
    public @ResponseBody Map<String,Object> remove(String id,String[] ids){
        Map<String,Object> result=new HashMap<String,Object>();
        System.out.println(id);
        try {
            if (ids==null){
                courseService.remove(id);
            }else{
                for (String s : ids) {
                    courseService.remove(s);
                }
            }
            result.put("success",true);
            result.put("message","删除成功");
        }catch (Exception e){
            e.printStackTrace();
            result.put("success",false);
            result.put("message","删除失败");
        }
        return result;
    }

    @RequestMapping("motify")
    public @ResponseBody Map<String,Object> motify(Course course){
        Map<String, Object> result = new HashMap<>();
        try {
            courseService.motify(course);
            result.put("success",true);
            result.put("message","修改成功");
        }catch (Exception e){
            e.printStackTrace();
            result.put("success",false);
            result.put("message","修改失败");
        }
        return result;
    }

    @RequestMapping("/findPage")
    public @ResponseBody Map<String,Object> findPage(Integer page,Integer rows){
        Map<String, Object> result = new HashMap<>();
        List<Course> courses = courseService.findByPage(page, rows);
        Long totals = courseService.findTotal();
        result.put("total",totals);
        result.put("rows",courses);
        return result;
    }

    @RequestMapping("/findOne")
    public @ResponseBody Course findOne(String id){
        return courseService.findOne(id);
    }

}
