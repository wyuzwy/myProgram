package com.zhangwenyu.service;

import com.zhangwenyu.bean.Resume;
import com.zhangwenyu.bean.ResumeExample;
import com.zhangwenyu.dao.ResumeMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

@Service
public class ResumeService {

    @Autowired
    private ResumeMapper resumeMapper;


    public Resume searchById(String studentId){

        Resume resume = resumeMapper.selectByPrimaryKey(studentId);

        return resume;
    }


    public Map<String,Object> insertResume(Resume resume){
        Map<String,Object> mapResume = new HashMap<>();
        try{
            resumeMapper.insert(resume);
            mapResume.put("flag","200");
        }catch (Exception e){
            mapResume.put("flag","100");
            e.printStackTrace();
        }
        return mapResume;
    }

    public Map<String,Object> updateResume(Resume resume){
        Map<String,Object> mapRes = new HashMap<>();
        try{
            resumeMapper.updateByPrimaryKeySelective(resume);
            mapRes.put("flag","200");
        }catch (Exception e){
            mapRes.put("flag","100");
            e.printStackTrace();
        }
        return mapRes;
    }


    public List<Resume> getResume(List<String> studentId){
        ResumeExample resumeExample = new ResumeExample();
        ResumeExample.Criteria criteria = resumeExample.createCriteria();
        criteria.andStudentIdIn(studentId);
        return resumeMapper.selectByExample(resumeExample);
    }



}
