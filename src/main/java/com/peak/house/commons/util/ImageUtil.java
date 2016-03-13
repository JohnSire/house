package com.peak.house.commons.util;

import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

/**
 * 图片工具类
 */
public class ImageUtil {

    public static String rootPathString = "";
    public static String filePackage="";


    public static String saveImage(String path,MultipartFile pictureFile) throws IOException {

        rootPathString = path;
        //原始名称
        String originalFilename = pictureFile.getOriginalFilename();
        //新的图片名称
        String newFileName = "";
        //上传图片
        if(pictureFile!=null && originalFilename!=null && originalFilename.length()>0){

            newFileName = UUID.randomUUID() + originalFilename.substring(originalFilename.lastIndexOf("."));
            //存储图片路径+新的文件名
            String saveName = findFilePathByFileName(path,newFileName);
            //新图片
            File newFile = new File(saveName);

            //将内存中的数据写入磁盘
            pictureFile.transferTo(newFile);

            return filePackage+"/"+newFileName;
        }
        return newFileName;
    }

    public static String findFilePathByFileName(String path,String fileName) {
        rootPathString = path;

        if(fileName == null || fileName.trim().isEmpty()){
            return "/default.png";
        }
        int hashcode = fileName.hashCode();
        int dir1 = hashcode&0xf;  //0--15
        int dir2 = (hashcode&0xf0)>>4;  //0-15

        filePackage = "/" + dir1 + "/" + dir2 ;

        String dir = rootPathString + filePackage;  //upload\2\3  upload\3\5
        File file = new File(dir);
        if(!file.exists()){
            //创建目录
            file.mkdirs();
        }
        return dir+"/"+fileName;
    }
}
