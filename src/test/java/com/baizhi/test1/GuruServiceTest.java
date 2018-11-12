package com.baizhi.test1;

import com.baizhi.entity.Banner;
import com.baizhi.entity.Guru;
import com.baizhi.service.BannerService;
import com.baizhi.service.GuruService;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.Date;
import java.util.List;
import java.util.UUID;

public class GuruServiceTest extends BaseTest {
    @Autowired
    private GuruService guruService;

    @Test
    public void test1(){
        Guru guru = new Guru();
        guru.setName("袁多仁波切");
        guru.setHeadPic("back/main/images/6.jpg");
        guru.setSex("y");
        guruService.add(guru);
    }




}
