package com.baizhi.test1;

import com.baizhi.dao.ChapterDao;
import com.baizhi.entity.Admin;
import com.baizhi.entity.Chapter;
import com.baizhi.service.AdminService;
import com.baizhi.service.ChapterService;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.Date;

public class ChapterServiceTest extends BaseTest {
    @Autowired
    private ChapterService chapterService;
    @Test
    public void test1(){
        Chapter chapter = new Chapter();
        chapter.setTitle("尊者传2");
        chapter.setDuration("3:00");
        chapter.setUploadTime(new Date());
        chapter.setDownPath("1.jpg");
        chapter.setSize("3M");
        chapter.setAlbum_id("2");
        chapterService.add(chapter);
    }

    /* private String id;
    private String title;
    private String size;
    private String duration;
    private String downPath;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @JSONField(format = "yyyy-MM-dd")
    private Date uploadTime;
    private Album album;*/

}
