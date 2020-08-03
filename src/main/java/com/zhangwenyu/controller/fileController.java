package com.zhangwenyu.controller;

import com.zhangwenyu.bean.Job;
import com.zhangwenyu.bean.Resume;
import com.zhangwenyu.bean.Send;
import com.zhangwenyu.bean.User;
import com.zhangwenyu.service.FileService;
import com.zhangwenyu.service.JobService;
import com.zhangwenyu.service.ResumeService;
import com.zhangwenyu.service.SendService;
import com.zhangwenyu.utils.ResponseToHtml;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/file")
public class fileController {

    @Autowired
    private FileService fileService;

    @Autowired
    private ResumeService resumeService;

    @Autowired
    private JobService jobService;

    @Autowired
    private SendService sendService;

    @RequestMapping("/addImage")
    @ResponseBody
    public Map addImage(@RequestParam(value="img",required = false) MultipartFile img, HttpServletRequest request){
        Map<String ,Object> map = new HashMap<>();
        if(img==null){
            map.put("flag","100");
        }else{
            map = fileService.addImg(img,request);
        }
        return  map;
    }

    @RequestMapping("/addResume")
    @ResponseBody
    public Map addResume(@RequestParam(value="resumeFile",required = false) MultipartFile resumeFile, HttpServletRequest request){
        Map<String ,Object> map = new HashMap<>();
        if(resumeFile==null){
            map.put("flag","100");
        }else{
            map = fileService.addResume(resumeFile,request);
        }
        return map;
    }


    @RequestMapping(value = "/addNewsFile",method = RequestMethod.POST)
    @ResponseBody
    public Map addNewsFile(@RequestParam(value = "file",required = false) MultipartFile[] newFile, HttpServletRequest request){
        Map<String ,Object> map = new HashMap<>();
        System.out.println(newFile.length);
        if(newFile.length==0){
            map.put("flag","100");
        }else{
            map = fileService.addNewsFile(newFile, request);
        }
        return map;
    }

    @RequestMapping(value = "/downFile",method = RequestMethod.GET)
    public void downFile(@RequestParam("url")String url, HttpServletRequest request, HttpServletResponse response) throws IOException {
        String s[] =url.split("/");
        if(!"".equals(url)&&s.length>1){
            if("resumes".equals(s[1])){
                ResponseToHtml toHtml = new ResponseToHtml();
                 User user = (User) request.getSession().getAttribute("currentUser");
                 if(user!=null){
                     Resume resume = resumeService.searchById(user.getId());
                     if(resume!=null){
                         if(!url.equals(resume.getResumeUrl())){
                             toHtml.sendExceptionToHtml(response,"非法下载，请登录后再试!");
                             return;
                         }
                     }else {
                         toHtml.sendExceptionToHtml(response,"非法下载，请登录后再试!");
                         return;
                     }
                 }else{
                     toHtml.sendExceptionToHtml(response,"非法下载，请登录后再试！");
                     return;
                 }
            }
        }

        fileService.downFile(url, request, response);
    }

    @RequestMapping(value = "/downLoadResume",method = RequestMethod.GET)
    public void downLoadResume(@RequestParam("id")Integer id, HttpServletRequest request, HttpServletResponse response) throws IOException {
        if(id!=null){
            User user = (User) request.getSession().getAttribute("currentUser");
            if(user!=null){
                Job job = jobService.searchById(id);
                if(job!=null&&job.getCompanyId()!=null){
                    if(user.getId().equals(job.getCompanyId())){
                        List<Send> sends=sendService.searchByJobId(id);
                        List<String> studentId = new ArrayList<>();
                        for(Send send : sends){
                            studentId.add(send.getStudentId());
                        }
                        List<Resume> resumes = resumeService.getResume(studentId);
                        List<String> urls = new ArrayList<>();
                        for (Resume resume : resumes){
                            urls.add(resume.getResumeUrl().substring(1));
                        }
                        fileService.downResume(urls,request,response);
                        return;
                    }
                }
            }
        }
        ResponseToHtml toHtml = new ResponseToHtml();
        toHtml.sendExceptionToHtml(response,"非法下载！！！");
    }



}
