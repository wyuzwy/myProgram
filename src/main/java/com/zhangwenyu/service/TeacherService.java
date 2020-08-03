package com.zhangwenyu.service;

import com.zhangwenyu.bean.Teacher;
import com.zhangwenyu.dao.TeacherMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

@Service
public class TeacherService {

    @Autowired
    private TeacherMapper teacherMapper;

    public Map<String,Object> insertTeacher(Teacher teacher){
        Map<String ,Object> map = new HashMap<>();
        teacherMapper.insert(teacher);
        map.put("flag","200");
        map.put("msg","添加成功！");
        return map;
    }

    public Map<String,Object> updateTeacher(Teacher teacher){
        Map<String ,Object> map = new HashMap<>();
        teacherMapper.updateByPrimaryKeySelective(teacher);
        map.put("flag","200");
        map.put("msg","修改成功！");
        return map;
    }

    public Teacher findById(String teacherId){
        Teacher teacher = teacherMapper.selectByPrimaryKey(teacherId);
        return teacher;
    }
}
