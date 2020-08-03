package com.zhangwenyu.service;

import com.zhangwenyu.bean.JobComment;
import com.zhangwenyu.bean.JobCommentExample;
import com.zhangwenyu.dao.JobCommentMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class JobCommentService {

    @Autowired
    private JobCommentMapper jobCommentMapper;

    public Map<String,Object> insertComment(JobComment jobComment){
        Map<String,Object> commentMap = new HashMap<>();
        try{
            jobCommentMapper.insert(jobComment);
            commentMap.put("flag","200");
        }catch (Exception e){
            commentMap.put("flag","100");
        }
        return commentMap;
    }

    public Map<String,Object> deleteComment(Integer commentId){
        Map<String,Object> delMap = new HashMap<>();
        try{
            jobCommentMapper.deleteByPrimaryKey(commentId);
            delMap.put("flag","200");
        }catch (Exception e){
            delMap.put("flag","100");
        }
        return delMap;
    }

    public List<JobComment> searchComment(Integer jobId){
        JobCommentExample example = new JobCommentExample();
        example.setOrderByClause("create_time desc");
        JobCommentExample.Criteria criteria = example.createCriteria();
        criteria.andJobIdEqualTo(jobId);
       List<JobComment> list = jobCommentMapper.selectByExample(example);
       return list;

    }

    public List<JobComment> searchListCom(JobComment jobComment){
        JobCommentExample example = new JobCommentExample();
        example.setOrderByClause("create_time desc");
        JobCommentExample.Criteria criteria = example.createCriteria();
        if(jobComment.getSendName()!=null&&jobComment.getSendName()!=""){
            criteria.andSendNameLike("%"+jobComment.getSendName()+"%");
        }
        if(jobComment.getCommentText()!=null&&jobComment.getCommentText()!=""){
            criteria.andCommentTextLike("%"+jobComment.getCommentText()+"%");
        }
        List<JobComment> list = jobCommentMapper.selectByExample(example);
        return list;
    }

}
