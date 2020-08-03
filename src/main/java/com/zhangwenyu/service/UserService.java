package com.zhangwenyu.service;

import com.zhangwenyu.bean.*;
import com.zhangwenyu.dao.CompanyMapper;
import com.zhangwenyu.dao.StudentMapper;
import com.zhangwenyu.dao.TeacherMapper;
import com.zhangwenyu.dao.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class UserService {

    @Autowired
    private UserMapper userMapper;

    @Autowired
    private StudentMapper studentMapper;

    @Autowired
    private TeacherMapper teacherMapper;

    @Autowired
    private CompanyMapper companyMapper;

    public User getUserById(String id){
        User user = userMapper.selectByPrimaryKey(id);
        return user;
    }

    public Map<String,Object> searchInfoById(String id,int role){
        Map<String ,Object> map = new HashMap<>();
        if(role==1){
            Student student = studentMapper.selectByPrimaryKey(id);
            if(student==null){
                map.put("flag","100");
                return map;
            }
            map.put("flag","200");
            map.put("student",student);
            return map;
        }else if(role==2){
            Teacher teacher = teacherMapper.selectByPrimaryKey(id);
            if(teacher==null){
                map.put("flag","100");
                return map;
            }
            map.put("flag","200");
            map.put("teacher",teacher);
            return map;
        } else{
            Company company = companyMapper.selectByPrimaryKey(id);
            if(company==null){
                map.put("flag","100");
                return map;
            }
            map.put("flag","200");
            map.put("company",company);
            return map;
        }
    }

    public User findUserById(String id){
        User user = userMapper.selectByPrimaryKey(id);
        return user;
    }


    public Map<String,Object> updateUser(User user){
        Map<String,Object>map = new HashMap<>();
        try {
            userMapper.updateByPrimaryKeySelective(user);
            map.put("flag","200");
        }catch (Exception e){
            e.printStackTrace();
            map.put("flag","100");
        }

        return map;
    }

    public Map<String ,Object> insertUser(User user){
        userMapper.insert(user);
        return new HashMap<>();
    }

    public List<User> searchByCondition(User user){
        UserExample userExample = new UserExample();
        userExample.setOrderByClause("status asc");
        UserExample.Criteria criteria = userExample.createCriteria();
        if(user.getId()!=null&&user.getId()!=""){
            criteria.andIdLike("%" + user.getId() + "%");
        }
        if(user.getUserDept()!=null&&user.getUserDept()!=""){
            criteria.andUserDeptLike("%" + user.getUserDept()+ "%");
        }
        if(user.getUserName()!=null&&user.getUserName()!=""){
            criteria.andUserNameLike("%" + user.getUserName()+ "%");
        }
        if (user.getRole()!=null){
            criteria.andRoleEqualTo(user.getRole());
        }
        if(user.getStatus()!=null){
            criteria.andStatusEqualTo(user.getStatus());
        }

        List<User> users = userMapper.selectByExample(userExample);
        for(int i=0;i<users.size();i++){
            users.get(i).setPassword(null);
        }
        return users;
    }


//    public Long countByCondition(String dept,String year){
//        UserExample userExample = new UserExample();
//        UserExample.Criteria criteria = userExample.createCriteria();
//        criteria.andBackupEqualTo(year);
//        criteria.andUserDeptEqualTo(dept);
//        criteria.andRoleEqualTo(1);
//        criteria.andStatusEqualTo(1);
//        return userMapper.countByExample(userExample);
//    }

    public Long countByCondition(String dept,String year){

        return userMapper.countByCondition(dept,year);
    }

    public Map<String,Object> forgetPassword(String id,String phone){
        Map<String ,Object> map = new HashMap<>();
        User user = userMapper.selectByPrimaryKey(id);

        if(user==null){
            map.put("flag","100");
            map.put("msg","没有该用户");
            return map;
        }
        user.setPassword("123456");
        if(user.getRole()==1){
            Student student = studentMapper.selectByPrimaryKey(id);
            if(student!=null&&phone.equals(student.getSjhm())){

                userMapper.updateByPrimaryKeySelective(user);
                map.put("flag","200");
                map.put("msg","修改成功，默认密码为123456");
            }else{
                map.put("flag","100");
                map.put("msg","手机号码错误");
                return map;
            }
        }else if(user.getRole()==2){
            Teacher teacher = teacherMapper.selectByPrimaryKey(id);
            if(teacher!=null&&phone.equals(teacher.getTeacherPhone())){
                userMapper.updateByPrimaryKeySelective(user);
                map.put("flag","200");
                map.put("msg","修改成功，默认密码为123456");
            }else{
                map.put("flag","100");
                map.put("msg","手机号码错误");
                return map;
            }
        }else if(user.getRole()==3){
            Company company = companyMapper.selectByPrimaryKey(id);
            if(company!=null&&phone.equals(company.getPhone())){
                userMapper.updateByPrimaryKeySelective(user);
                map.put("flag","200");
                map.put("msg","修改成功，默认密码为123456");
            }else{
                map.put("flag","100");
                map.put("msg","手机号码错误");
                return map;
            }
        }else{
            map.put("flag","100");
            map.put("msg","请求错误");
            return map;
        }
        return map;
    }
}
