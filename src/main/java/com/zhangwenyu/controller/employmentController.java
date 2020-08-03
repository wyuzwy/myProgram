package com.zhangwenyu.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zhangwenyu.bean.CollegeDept;
import com.zhangwenyu.bean.Employment;
import com.zhangwenyu.service.CollegeDeptService;
import com.zhangwenyu.service.EmploymentService;
import com.zhangwenyu.service.FileService;
import com.zhangwenyu.service.UserService;
import com.zhangwenyu.utils.Utils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import sun.rmi.runtime.Log;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.*;

@Controller
@RequestMapping("/emp")
public class employmentController {
    @Autowired
    private EmploymentService employmentService;

    @Autowired
    private FileService fileService;

    @Autowired
    private CollegeDeptService collegeDeptService;

    @Autowired
    private UserService userService;

    @RequestMapping("/searchById")
    @ResponseBody
    public Map searchById(String studentId){
        Map<String,Object> map = new HashMap<>();
        Employment employment = employmentService.searchById(studentId);
        if (employment!=null){
            map.put("flag","200");
            map.put("employment",employment);
        }else{
            map.put("flag","100");
        }
        return map;
    }

    @RequestMapping("/insertOrUpdate")
    @ResponseBody
    public Map insertOrUpdate(Employment employment){
        System.out.println(employment.toString());
        Map<String,Object> map = new HashMap<>();

        Employment employment1 = employmentService.searchById(employment.getStudentId());
        employment.setCreateTime(new Utils().DateToString2(new Date()));
        employment.setStatus(0);
        if(employment1!=null){

            map = employmentService.updateEmployment(employment);
        }else{


            map=employmentService.insertEmployment(employment);
        }
        return map;
    }


    @RequestMapping("/searchByCondition")
    @ResponseBody
    public Map searchByCondition(@RequestParam(value = "studentId",required = false)String studentId,
                                 @RequestParam(value = "studentName",required = false)String studentName,
                                 @RequestParam(value = "studentDept",required = false)String studentDept,
                                 @RequestParam(value = "status",defaultValue = "-1")Integer status,
                                 @RequestParam("rows")Integer rows,@RequestParam("page")Integer page){
        Map<String,Object> map = new HashMap<>();
        Employment employment = new Employment();
        if(studentId!=null&&!studentId.equals("")){
            employment.setStudentId(studentId);
        }
        if(studentName!=null&&!studentName.equals("")){
            employment.setStudentName(studentName);
        }
        if(studentDept!=null&&!studentDept.equals("")){
            employment.setStudentDept(studentDept);
        }

        employment.setStatus(status);
        PageHelper.startPage(page,rows);
        //方法
        List<Employment> list = employmentService.searchByCondition(employment);
        map.put("rows",list);
        if(list.size()>0){
            map.put("flag","200");
            PageInfo pages = new PageInfo(list,rows);
            map.put("pageInfo",pages);
            map.put("total",pages.getTotal());
        }else{
            map.put("flag","100");
            map.put("total",0);
        }
        return map;
    }


    @RequestMapping("/teacherCheck")
    @ResponseBody
    public Map teacherCheck(Employment employment){
        Map<String,Object> map = new HashMap<>();
        System.out.println(employment.toString());
        employment.setChaeckTime(new Utils().DateToString2(new Date()));
        if(employment.getRemark().equals("")){
            employment.setRemark(null);
        }
        map=employmentService.updateEmployment(employment);
        return map;
    }

    @RequestMapping("/getEmploymentExcel")
    public void getEmployeeExcel(@RequestParam(value = "studentId",required = false)String studentId,
                                 @RequestParam(value = "studentName",required = false)String studentName,
                                 @RequestParam(value = "studentDept",required = false)String studentDept,
                                 @RequestParam(value = "status",defaultValue = "-1")Integer status,
                                 HttpServletRequest request, HttpServletResponse response){

        Employment employment = new Employment();
        if(studentId!=null&&!studentId.equals("")){
            employment.setStudentId(studentId);
        }
        if(studentName!=null&&!studentName.equals("")){
            employment.setStudentName(studentName);
        }
        if(studentDept!=null&&!studentDept.equals("")){
            employment.setStudentDept(studentDept);
        }
        employment.setStatus(status);
        try {
            fileService.getEmploymentExcel(request,employment,response);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }


    @RequestMapping("/showPic")
    @ResponseBody
    public Map<String,Object> showPic(String year){
        Map<String,Object> map = new HashMap<>();
        try {
            List<CollegeDept> list = collegeDeptService.getListByPid(0);
            List<Map<String, Object>> mapList = new ArrayList<>();
            long total=0;
            long collegeTotal;
            for (CollegeDept c : list) {
                Map<String, Object> map1 = new HashMap<>();
                map1.put("deptName", c.getName());
                collegeTotal=userService.countByCondition(c.getName(), year);
                map1.put("total", collegeTotal);
                total+=collegeTotal;
                map1.put("now", employmentService.countByCondition(c.getName(),year));
                mapList.add(map1);
            }
            Map<String, Long> map2 =employmentService.getEmpByStatus(year);
            map2.put("total",total);
            map.put("flag","200");
            map.put("map",map2);
            map.put("list",mapList);
        }catch (Exception e){
            e.printStackTrace();
            map.put("flag","100");
        }
        return map;
    }

}
