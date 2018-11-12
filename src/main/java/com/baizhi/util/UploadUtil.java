package com.baizhi.util;


import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;

public class UploadUtil {
    public static String upload(MultipartFile imgPath, HttpServletRequest request,String fileName) {
        try {
            /*System.out.println("原始文件名: " + imgPath.getOriginalFilename());*/
            //获取上传路径  相对路径 files    获取绝对路径
            request.setCharacterEncoding("UTF-8");
            String realPath = request.getSession().getServletContext().getRealPath("back/" + fileName);
            System.out.println(realPath);
            //上传
            imgPath.transferTo(new File(realPath, imgPath.getOriginalFilename()));
            return "back/" + fileName + "/" + imgPath.getOriginalFilename();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }

    }
}
