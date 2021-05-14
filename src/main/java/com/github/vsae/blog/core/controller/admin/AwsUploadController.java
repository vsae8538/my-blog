package com.github.vsae.blog.core.controller.admin;

import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.model.CannedAccessControlList;
import com.amazonaws.services.s3.model.GeneratePresignedUrlRequest;
import com.amazonaws.services.s3.model.PutObjectRequest;
import com.amazonaws.services.s3.model.PutObjectResult;
import com.github.vsae.blog.core.config.Constants;
import com.github.vsae.blog.core.util.CommonResult;
import com.github.vsae.blog.core.util.MyBlogUtils;
import com.github.vsae.blog.core.util.ResultGenerator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URI;
import java.net.URISyntaxException;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

@Controller
@RequestMapping("/admin")
public class AwsUploadController {

    @Value("${application.bucket.name}")
    private String bucketName;

    @Autowired
    private AmazonS3 s3Client;

    @PostMapping("/blogs/md/uploadfile")
    public void uploadFileByEditormd(HttpServletRequest request,
                                     HttpServletResponse response,
                                     @RequestParam(name = "editormd-image-file", required = true)
                                             MultipartFile file) throws IOException, URISyntaxException {
        File fileObj =  convertMultiPartFileToFile(file);
        String fileName = createFileName(file);

        String bucketPath = bucketName + "/upload" ;
        CommonResult commonResultSuccess = ResultGenerator.genSuccessResult();
        try {
            file.transferTo(fileObj);
            //創建文件
            s3Client.putObject(new PutObjectRequest(bucketPath , fileName, fileObj)
                                .withCannedAcl(CannedAccessControlList.PublicRead));//設置為讀取公開

            URL url = s3Client.getUrl(bucketPath, fileName);

            request.setCharacterEncoding("utf-8");
            response.setHeader("Content-Type", "text/html");
            response.getWriter().write("{\"success\": 1, \"message\":\"success\",\"url\":\""
                    + url.toExternalForm() + "\"}");
        } catch (IOException e) {
            response.getWriter().write("{\"success\":0}");
        }

    }

    @PostMapping({"/upload/file"})
    @ResponseBody
    public CommonResult upload(HttpServletRequest httpServletRequest, @RequestParam("file") MultipartFile file) {


//        File fileObj = new File(newFileName);

        File fileObj =  convertMultiPartFileToFile(file);
        String newFileName = createFileName(file);

        String bucketPath = bucketName + "/upload" ;
        CommonResult commonResultSuccess = ResultGenerator.genSuccessResult();
        try {
            file.transferTo(fileObj);
            //創建文件
            s3Client.putObject(new PutObjectRequest(bucketPath , newFileName, fileObj)
                    .withCannedAcl(CannedAccessControlList.PublicRead));//設置為讀取公開
            //fileObj.delete();
            URL url = s3Client.getUrl(bucketPath, newFileName);

            commonResultSuccess.setData(url.toExternalForm());
        } catch (IOException e) {
            e.printStackTrace();
        }

        return commonResultSuccess;
    }

    public String createFileName(MultipartFile file){
        String fileName = file.getOriginalFilename();
        String suffixName = fileName.substring(fileName.lastIndexOf("."));
        //生成文件名稱通用方法
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HHmmss");
        Random r = new Random();
        StringBuilder tempName = new StringBuilder();
        tempName.append(sdf.format(new Date())).append(r.nextInt(100)).append(suffixName);
        String newFileName = tempName.toString();

        return newFileName;
    }

    private File convertMultiPartFileToFile(MultipartFile file) {
        File convertedFile = new File(file.getOriginalFilename());
        try (FileOutputStream fos = new FileOutputStream(convertedFile)) {
            fos.write(file.getBytes());
        } catch (IOException e) {
//            log.error("Error converting multipartFile to file", e);
        }
        return convertedFile;
    }
}
