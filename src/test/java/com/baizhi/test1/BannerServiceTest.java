package com.baizhi.test1;

import com.baizhi.dao.BannerDao;
import com.baizhi.entity.Admin;
import com.baizhi.entity.Banner;
import com.baizhi.service.AdminService;
import com.baizhi.service.BannerService;
import jdk.nashorn.internal.runtime.arrays.IteratorAction;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.Date;
import java.util.List;
import java.util.UUID;

public class BannerServiceTest extends BaseTest {
    @Autowired
    private BannerService bannerService;

    @Test
    public void test1(){
        Banner banner = new Banner();
        banner.setId(UUID.randomUUID().toString());
        banner.setTitle("经院正殿");
        banner.setImgPath("${pageContext.request.contextPath}/back/main/image/1.jpg");
        banner.setDescA("经院正殿");
        banner.setStatus("y");
        banner.setCreationdate(new Date());
        bannerService.add(banner);
    }

    @Test
    public void test2(){
        List<Banner> bannerServiceAll = bannerService.findAll();
        for (Banner banner : bannerServiceAll) {
            System.out.println(banner);
        }

    }


}
