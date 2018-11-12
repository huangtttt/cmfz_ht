package com.baizhi.test1;

import com.baizhi.entity.Banner;

import com.baizhi.entity.Course;
import com.baizhi.service.CourseService;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.Date;
import java.util.List;
import java.util.UUID;

public class CourseServiceTest extends BaseTest {
    @Autowired
    private CourseService courseService;

    @Test
    public void test1(){
        Course course = new Course();
        course.setMarking("很帅！！！");
        course.setTitle("吃斋念佛");
        courseService.add(course);
    }

    @Test
    public void test2(){
        List<Course> all = courseService.findByPage(1,10);
        for (Course course : all) {
            System.out.println(course);
        }

    }


}
