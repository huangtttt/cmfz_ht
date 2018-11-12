package com.baizhi.controller;

import com.baizhi.entity.Album;
import com.baizhi.entity.Banner;
import com.baizhi.service.AlbumService;
import com.baizhi.util.DownloadUtil;
import com.baizhi.util.UploadUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.net.URLDecoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/album")
public class AlbumController {

    @Autowired
    private AlbumService albumService;

    @RequestMapping("/findAll")
    @ResponseBody
    public List<Album> findAll(){

        List<Album> all = albumService.findAll();

        return all;

    }

    @RequestMapping("/add")
    public @ResponseBody
    Map<String,Object> add(Album album, HttpServletRequest request, MultipartFile coverImgaa){
        System.out.println(album);
        Map<String,Object> result=new HashMap<String,Object>();
        try{
            String fileName = UploadUtil.upload(coverImgaa, request, "albumImg");
            album.setCoverImg(fileName);
            albumService.add(album);
            result.put("success",true);
            result.put("message","添加成功");
        }catch (Exception e){
            e.printStackTrace();
            result.put("success",false);
            result.put("message","添加失败");
        }
        return result;
    }


    @RequestMapping("/findOne")
    public @ResponseBody
    Album findOne(String id){
        Album one = albumService.findOne(id);
        return one;
    }

    @RequestMapping("/download")
    public void download(String fileName, String openStyle, HttpServletRequest request, HttpServletResponse response) throws Exception{
        String subHeader = URLDecoder.decode(request.getParameter("fileName"),"utf-8");
        DownloadUtil.download(subHeader,openStyle,request,response,"chapter");
    }

    @RequestMapping("/motify")
    public void motify(String id){
        System.out.println(id);
        albumService.motify(id);
    }

}




