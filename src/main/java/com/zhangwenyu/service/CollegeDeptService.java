package com.zhangwenyu.service;

import com.zhangwenyu.bean.CollegeDept;
import com.zhangwenyu.bean.CollegeDeptExample;
import com.zhangwenyu.dao.CollegeDeptMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import javax.annotation.Resource;
import java.util.List;

/**
 * @Author: Zhang Wenyu
 * @Date: 2020-04-14 20:30
 * @Version: 1.0
 */
@Service
public class CollegeDeptService {

    @Resource
    private CollegeDeptMapper collegeDeptMapper;

    public List<CollegeDept> getListByPid(Integer id){
        CollegeDeptExample example = new CollegeDeptExample();
        CollegeDeptExample.Criteria criteria = example.createCriteria();
        criteria.andPidEqualTo(id);
        criteria.andStatusEqualTo(1);
        List<CollegeDept> list = collegeDeptMapper.selectByExample(example);
        return list;
    }


    public CollegeDept getIdByName(String name){
        CollegeDeptExample example = new CollegeDeptExample();
        CollegeDeptExample.Criteria criteria = example.createCriteria();
        criteria.andNameEqualTo(name);
        criteria.andStatusEqualTo(1);
        List<CollegeDept> collegeDept = collegeDeptMapper.selectByExample(example);
        if(CollectionUtils.isEmpty(collegeDept)){
            return new CollegeDept();
        }
        return collegeDept.get(0);
    }

}
