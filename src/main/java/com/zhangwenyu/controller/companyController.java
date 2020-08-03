package com.zhangwenyu.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zhangwenyu.bean.Company;
import com.zhangwenyu.bean.User;
import com.zhangwenyu.dao.UserMapper;
import com.zhangwenyu.service.CompanyService;
import com.zhangwenyu.service.EmailService;
import com.zhangwenyu.service.FileService;
import com.zhangwenyu.service.UserService;
import com.zhangwenyu.utils.Utils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.reflect.MalformedParameterizedTypeException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/company")
public class companyController {

    @Autowired
    private CompanyService companyService;

    @Autowired
    private UserService userService;

    @Autowired
    private FileService fileService;



    @RequestMapping("/searchInfoById")
    @ResponseBody
    public Map searchInfoById(String companyEmail){
        Map<String,Object> map = new HashMap<>();
        Company company = companyService.findById(companyEmail);
        if(company==null){
            map.put("flag","100");
        }else{
            map.put("flag","200");
            map.put("company",company);
        }
        return map;
    }

    @RequestMapping("/insertOrUpdate")
    @ResponseBody
    public Map insertOrUpdate(Company company,String password){
        System.out.println(company.toString());
        Map<String,Object> map = new HashMap<>();
        Company company1 = companyService.findById(company.getCompanyEmail());
        Utils utils = new Utils();
        String date = utils.DateToString(new Date());
        company.setUpdateTime(date);
        if(company1==null){
            company.setCreateTime(date);//注册时间
            company.setStatus(0);
            map=companyService.insertCompany(company);
            User user = new User();
            user.setId(company.getCompanyEmail());
            user.setPassword(password);
            user.setRole(3);
            user.setStatus(0);
            user.setUserName(company.getUserName());
            user.setUserDept(company.getCompanyName());
            userService.insertUser(user);
        }else{
            map=companyService.updateCompany(company);
        }
        return map;
    }


    @RequestMapping("/insert")
    @ResponseBody
    public Map insert(Company company,String password){
        System.out.println(company.toString());
        Map<String,Object> map = new HashMap<>();
        Company company1 = companyService.findById(company.getCompanyEmail());
        Utils utils = new Utils();
        String date = utils.DateToString(new Date());
        company.setUpdateTime(date);
        if(company1==null){
            company.setCreateTime(date);//注册时间
            company.setStatus(0);
            map=companyService.insertCompany(company);
            User user = new User();
            user.setId(company.getCompanyEmail());
            user.setPassword(password);
            user.setRole(3);
            user.setStatus(0);
            user.setUserName(company.getUserName());
            user.setUserDept(company.getCompanyName());
            userService.insertUser(user);
        }else{
            map.put("flag","100");
            map.put("msg","账号已存在");
        }
        return map;
    }



    @RequestMapping("/searchCompany")
    @ResponseBody
    public Map searchCompany(Company company,@RequestParam("page")Integer page,
                             @RequestParam("rows")Integer rows){
        Map<String,Object> map = new HashMap<>();
        PageHelper.startPage(page, rows);
        List<Company> companies = companyService.searchCompanyByCondition(company);
        PageInfo pageInfo = new PageInfo(companies,page);
        map.put("rows",companies);
        map.put("total",pageInfo.getTotal());
        return map;
    }

    @RequestMapping("/changeCompanyStatus")
    @ResponseBody
    public Map changeCompanyStatus(Company company) throws Exception {
        System.out.println(company.toString());
        Map<String,Object> map = new HashMap<>();
        map=companyService.changeCompanyStatus(company);
        return map;
    }


    @RequestMapping("/getCompanyExcel")
    @ResponseBody
    public void getCompanyExcel(Company company, HttpServletRequest request, HttpServletResponse response){
        try {
            fileService.getCompanyExcel(request,company,response);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
