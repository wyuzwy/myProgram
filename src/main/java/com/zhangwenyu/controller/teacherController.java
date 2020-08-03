package com.zhangwenyu.controller;

import com.zhangwenyu.bean.Teacher;
import com.zhangwenyu.service.TeacherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/teacher")
public class teacherController {

    @Autowired
    private TeacherService teacherService;

    @RequestMapping("/insertOrUpdate")
    @ResponseBody
    public Map insertOrUpdate(Teacher teacher){
        System.out.println(teacher.toString());
        Map<String,Object> map= new HashMap<>();
        if(teacher!=null) {
            Teacher teacher1 = teacherService.findById(teacher.getTeacherId());
            if (teacher1 == null) {
                map = teacherService.insertTeacher(teacher);
            } else {
                map = teacherService.updateTeacher(teacher);
            }
        }else {
            map.put("flag","500");
        }
        return map;
    }

    @RequestMapping("/searchInfoById")
    @ResponseBody
    public Map searchInfoById(String teacherId){
        Map<String,Object> map= new HashMap<>();
        Teacher teacher = teacherService.findById(teacherId);
        if(teacher==null){
            map.put("flag","100");
        }else{
            map.put("flag","200");
            map.put("teacher",teacher);
        }
        return map;
    }
}
