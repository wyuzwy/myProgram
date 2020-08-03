package com.zhangwenyu.service;

import com.zhangwenyu.bean.Student;
import com.zhangwenyu.dao.StudentMapper;
//import org.hibernate.validator.constraints.EAN;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class StudentService {

    @Autowired
    private StudentMapper studentMapper;

    public Student findStudentById(String xh){
        Student student = studentMapper.selectByPrimaryKey(xh);
        return student;
    }

    public Map<String,Object> insertStudent(Student student){
        Map<String,Object> map = new HashMap<>();
        try {
            studentMapper.insert(student);
            map.put("flag", "200");
            map.put("msg", "成功添加学生信息!");
        }catch (Exception e){
            e.printStackTrace();
            map.put("flag","100");
            map.put("msg", "添加失败!");
        }
        return map;
    }


    public Map<String,Object> updateStudent(Student student){
        Map<String,Object> map = new HashMap<>();
        try {
            studentMapper.updateByPrimaryKeySelective(student);
            map.put("flag","200");
            map.put("msg","成功修改学生信息!");
        }catch (Exception e){
            map.put("flag","100");
            map.put("msg", "更新失败!");
        }
        return map;
    }

    public List<Student> searchByCondition(Student student){
        return studentMapper.searchByCondition(student);
    }
}
