package com.zhangwenyu.service;

import com.zhangwenyu.bean.Company;
import com.zhangwenyu.bean.CompanyExample;
import com.zhangwenyu.dao.CompanyMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import sun.java2d.pipe.SolidTextRenderer;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

@Service
public class CompanyService {

    @Autowired
    private CompanyMapper companyMapper;

    static ExecutorService fixedThreadPool = Executors.newCachedThreadPool();

    @Autowired
    private EmailService emailService;

    public Company findById(String companyEmail){
        Company company = companyMapper.selectByPrimaryKey(companyEmail);
        return company;
    }

    public Map<String,Object> insertCompany(Company company){
        Map<String,Object> map = new HashMap<>();
        companyMapper.insert(company);
        map.put("flag","200");
        map.put("msg","添加企业成功！");
        return map;
    }

    public Map<String,Object> updateCompany(Company company){
        Map<String,Object> map = new HashMap<>();
        companyMapper.updateByPrimaryKeySelective(company);
        map.put("flag","200");
        map.put("msg","修改企业信息成功！");
        return map;
    }

    public List<Company> searchCompanyByCondition(Company company){
        CompanyExample companyExample = new CompanyExample();
        companyExample.setOrderByClause("status asc");
//        if(company!=null) {
            CompanyExample.Criteria criteria = companyExample.createCriteria();
            if (company.getCompanyEmail() != null && company.getCompanyEmail() != "") {
                criteria.andCompanyEmailLike("%" + company.getCompanyEmail() + "%");
            }
            if (company.getCompanyName() != null && company.getCompanyName() != "") {
                criteria.andCompanyNameLike("%" + company.getCompanyName() + "%");
            }
            if (company.getStatus() != null&& company.getStatus() != -1 ) {
                criteria.andStatusEqualTo(company.getStatus());
            }
//        }
        List<Company> list = companyMapper.selectByExample(companyExample);
        return list;
    }


    public Map<String,Object> changeCompanyStatus(Company company) throws Exception {
        Map<String,Object> map = new HashMap<>();
        String theme="用户注册审核结果通知";
        try {
            companyMapper.updateByPrimaryKeySelective(company);
            map.put("flag","200");
            map.put("msg","修改企业信息成功！");
            fixedThreadPool.execute(new Runnable() {
                @Override
                public void run() {
                    try {
                        Thread.sleep(1000);
                        if(company.getStatus()==1) {
                            emailService.sendEmail(company.getCompanyEmail(), theme, "您的注册信息已通过，请放心使用我们平台！");
                        }else{
                            emailService.sendEmail(company.getCompanyEmail(), theme, company.getBackup());
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                }
            });

        }catch (Exception e){
            e.printStackTrace();
            map.put("flag","100");
            map.put("msg","修改失败，请重试");
            return map;
        }
//        if(company.getStatus()==1) {
//            emailService.sendEmail(company.getCompanyEmail(), theme, "您的注册信息已通过，请放心使用我们平台！");
//        }else{
//            emailService.sendEmail(company.getCompanyEmail(), theme, company.getBackup());
//        }
        return map;
    }

}
