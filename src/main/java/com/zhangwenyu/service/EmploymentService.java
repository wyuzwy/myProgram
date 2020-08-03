package com.zhangwenyu.service;

import com.zhangwenyu.bean.CollegeDept;
import com.zhangwenyu.bean.Employment;
import com.zhangwenyu.bean.EmploymentExample;
import com.zhangwenyu.dao.EmploymentMapper;
import com.zhangwenyu.dao.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class EmploymentService {

    @Autowired
    private EmploymentMapper employmentMapper;

    @Autowired
    private CollegeDeptService collegeDeptService;

    @Autowired
    private UserService userService;


    public Employment searchById(String studentId){
        Employment employment = employmentMapper.selectByPrimaryKey(studentId);
        return employment;
    }

    public Map<String,Object> insertEmployment(Employment employment){
        Map<String,Object> mapEmp = new HashMap<>();
        try{
            employmentMapper.insert(employment);
            mapEmp.put("flag","200");
        }catch (Exception e){

            mapEmp.put("flag","100");
            e.printStackTrace();
        }
        return mapEmp;
    }

    public Map<String,Object> updateEmployment(Employment employment){
        Map<String,Object> mapEmp = new HashMap<>();
        try{
            employmentMapper.updateByPrimaryKeySelective(employment);
            mapEmp.put("flag","200");
        }catch (Exception e){
            mapEmp.put("flag","100");
        }
        return mapEmp;
    }

    public List<Employment> searchByCondition(Employment employment){
        return employmentMapper.searchByCondition(employment);
    }

    public Long countByCondition(String userDept,String year){

        return employmentMapper.countByCondition(userDept,year);
//        Map<String,Object> map = new HashMap<>();
//        try {
//            List<CollegeDept> list = collegeDeptService.getListByPid(0);
//            List<Map<String, Object>> mapList = new ArrayList<>();
//            for (CollegeDept c : list) {
//                Map<String, Object> map1 = new HashMap<>();
//                map.put("deptName", c.getName());
//                map.put("total", userService.countByCondition(c.getName(), year));
//
//                String studentId = "31" + year.substring(2);
//                String studentId2 = "32" + year.substring(2);
//                map.put("now", employmentMapper.countByCondition(c.getName(), studentId, studentId2));
//                mapList.add(map);
//            }
//            map.put("flag","200");
//            map.put("list",mapList);
//        }catch (Exception e){
//            e.printStackTrace();
//            map.put("flag","100");
//        }
//        return map;
    }


    public Map<String,Long> getEmpByStatus(String year){
        Map<String ,Long> map = new HashMap<>();
        EmploymentExample employmentExample = new EmploymentExample();
        EmploymentExample.Criteria criteria = employmentExample.createCriteria();
        criteria.andBackupEqualTo(year);
        criteria.andStatusEqualTo(1);
        map.put("yes",employmentMapper.countByExample(employmentExample));
        return map;
    }


}


