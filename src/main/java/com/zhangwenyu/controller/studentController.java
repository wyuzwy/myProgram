package com.zhangwenyu.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zhangwenyu.bean.Student;
import com.zhangwenyu.service.FileService;
import com.zhangwenyu.service.StudentService;
import com.zhangwenyu.utils.Utils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.activation.FileDataSource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


@Controller
@RequestMapping("/student")
public class studentController {

    @Autowired
    private StudentService studentService;

    @Autowired
    private FileService fileService;

    @RequestMapping("/insertOrUpdate")
    @ResponseBody
    public Map studentInfo(Student student){
        Map<String,Object> map = new HashMap<>();
        if(student!=null) {
            Student student1 = studentService.findStudentById(student.getXh());
            if (student1 == null) {
                student.setCreateTime(new Utils().DateToString2(new Date()));
                if(student.getStatus()==null){
                    student.setStatus(0);
                }
                map = studentService.insertStudent(student);
            } else {
                student.setStatus(0);
                map = studentService.updateStudent(student);
            }
        }else{
            map.put("flag","500");
        }
        return map;
    }

    @RequestMapping("/searchInfoById")
    @ResponseBody
    public Map searchInfoById(String xh){
        Map<String ,Object> map = new HashMap<>();
        Student student = studentService.findStudentById(xh);
        if(student==null){
            map.put("flag","100");
            return map;
        }else{
            map.put("flag","200");
            map.put("student",student);
            return map;
        }

    }


    @RequestMapping("/searchByCondition")
    @ResponseBody
    public Map searchByCondition(@RequestParam(value = "xh",required = false)String xh,
                                 @RequestParam(value = "xm",required = false)String xm,
                                 @RequestParam(value = "xy",required = false)String xy,
                                 @RequestParam(value = "status",defaultValue = "-1")Integer status,
                                 @RequestParam("rows")Integer rows,@RequestParam("page")Integer page){
        Map<String,Object> map = new HashMap<>();
        Student student = new Student();
        if(xh!=null&&!xh.equals("")){
            student.setXh(xh);
        }
        if(xm!=null&&!xm.equals("")){
            student.setXm(xm);
        }
        if(xy!=null&&!xy.equals("")){
            student.setXy(xy);
        }
        student.setStatus(status);
        PageHelper.startPage(page,rows);
        List<Student> students = studentService.searchByCondition(student);
        map.put("rows",students);
        if(students.size()>0){
            map.put("flag","200");
            PageInfo pages = new PageInfo(students,rows);
            map.put("pageInfo",pages);
            map.put("total",pages.getTotal());
        }else{
            map.put("total",0);
            map.put("flag","100");

        }
        return map;
    }


    @RequestMapping("/teacherCheck")
    @ResponseBody
    public Map teacherCheck(Student student){
        Map<String,Object> map = new HashMap<>();
        System.out.println(student.toString());
        student.setEnsureTime(new Utils().DateToString2(new Date()));
        if(student.getRemark().equals("")){
            student.setRemark(null);
        }
        map=studentService.updateStudent(student);
        return map;
    }

    @RequestMapping("/getStudentExcel")
    public void getStudentExcel(@RequestParam(value = "xh",required = false)String xh,
                                  @RequestParam(value = "xm",required = false)String xm,
                                  @RequestParam(value = "xy",required = false)String xy,
                                  @RequestParam(value = "status",defaultValue = "-1")Integer status,
                                  HttpServletRequest request, HttpServletResponse response){
        Map<String,Object> map = new HashMap<>();
        Student student = new Student();
        if(xh!=null&&!xh.equals("")){
            student.setXh(xh);
        }
        if(xm!=null&&!xm.equals("")){
            student.setXm(xm);
        }
        if(xy!=null&&!xy.equals("")){
            student.setXy(xy);
        }
        student.setStatus(status);
        try {
            fileService.getStudentExcel(request,student,response);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

}
