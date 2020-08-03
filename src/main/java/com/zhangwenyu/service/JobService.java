package com.zhangwenyu.service;

import com.zhangwenyu.bean.Job;
import com.zhangwenyu.bean.JobComment;
import com.zhangwenyu.bean.JobCommentExample;
import com.zhangwenyu.bean.JobExample;
import com.zhangwenyu.dao.JobMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class JobService {

    @Autowired
    private JobMapper jobMapper;

    public Job searchById(Integer jobId){
        Job job = jobMapper.selectByPrimaryKey(jobId);
        return job;
    }

    public Map<String,Object> insertJob(Job job){
        Map<String,Object> JobMap = new HashMap<>();
        try{
            jobMapper.insert(job);
            JobMap.put("flag","200");
        }catch (Exception e){
            e.printStackTrace();
            JobMap.put("flag","100");
        }
        return JobMap;
    }

    public Map<String,Object> updateJob(Job job){
        Map<String,Object> JobMap = new HashMap<>();
        try{
            jobMapper.updateByPrimaryKeySelective(job);
            JobMap.put("flag","200");
        }catch (Exception e){
            e.printStackTrace();
            JobMap.put("flag","100");
        }
        return JobMap;
    }

    public Map<String,Object> deleteJob(Integer jobId){
        Map<String,Object> map = new HashMap<>();
        try {
            jobMapper.deleteByPrimaryKey(jobId);
            map.put("flag","200");
        }catch (Exception e){
            e.printStackTrace();
            map.put("flag","100");
        }
        return map;
    }





    public List<Job> showIndex(){
        JobExample jobExample = new JobExample();
        jobExample.setOrderByClause("create_time desc");
        JobExample.Criteria criteria = jobExample.createCriteria();
        criteria.andStatusEqualTo(1);
        List<Job> jobs = jobMapper.selectByExample(jobExample);
        return jobs;
    }

    public void addClick(Integer jobId){
        jobMapper.addClick(jobId);
    }

    public List<Job> selectByCondition(Job job){
        List<Job> jobs = jobMapper.selectByCondition(job);
        return jobs;
    }


    public List<Job> selectByCondition2(Job job){
        JobExample jobExample = new JobExample();
        jobExample.setOrderByClause("status asc");
        JobExample.Criteria criteria = jobExample.createCriteria();
        if(job.getCompanyName()!=null){
            criteria.andCompanyNameLike("%"+job.getCompanyName()+"%");
        }
        if(job.getSendName()!=null){
            criteria.andSendNameLike("%"+job.getSendName()+"%");
        }
        if(job.getJobName()!=null){
            criteria.andJobNameLike("%"+job.getJobName()+"%");
        }
        if(job.getCategory()!=null){
            criteria.andCategoryEqualTo(job.getCategory());
        }
        if(job.getStatus()!=null){
            criteria.andStatusEqualTo(job.getStatus());
        }
        List<Job> jobs = jobMapper.selectByExample(jobExample);
        return jobs;
    }



    public List<Job> searchBySendId(String companyName,String jobName,String category,List<Integer> jid){
        JobExample example = new JobExample();
        JobExample.Criteria criteria = example.createCriteria();
        criteria.andStatusEqualTo(1);
        criteria.andJobIdIn(jid);
        if(companyName!=null&&!companyName.equals("")){

            criteria.andCompanyNameLike("%"+companyName+"%");
        }
        if(jobName!=null&&!jobName.equals("")){

            criteria.andJobNameLike("%"+jobName+"%");
        }
        if(category!=null&&!category.equals("")){

            criteria.andCategoryEqualTo(category);
        }
        List<Job> jobs = jobMapper.selectByExample(example);
        return jobs;
    }
}
