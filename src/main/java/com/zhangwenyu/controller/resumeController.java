package com.zhangwenyu.controller;

import com.zhangwenyu.bean.Resume;
import com.zhangwenyu.service.ResumeService;
import com.zhangwenyu.utils.Utils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/resume")
public class resumeController {

    @Autowired
    private ResumeService resumeService;


    @RequestMapping("/searchById")
    @ResponseBody
    public Map searchById(String studentId){
        Map<String,Object> map = new HashMap<>();
        Resume resume = resumeService.searchById(studentId);
        if(resume!=null){
            map.put("flag","200");
            map.put("resume",resume);
        }else{
            map.put("flag","100");
        }
        return map;
    }

    @RequestMapping("/insertOrUpdate")
    @ResponseBody
    public Map insertOrUpdate(Resume resume){
        System.out.println(resume.toString());
        Map<String,Object> map = new HashMap<>();
        if(resume!=null) {
            Resume resume1 = resumeService.searchById(resume.getStudentId());
            resume.setCreateTime(new Utils().DateToString(new Date()));
            if(resume1==null){
                map=resumeService.insertResume(resume);
            }else{
                map = resumeService.updateResume(resume);
            }
        }else {
            map.put("flag","100");
        }
        return map;
    }




}
