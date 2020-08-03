package com.zhangwenyu.service;

import com.zhangwenyu.bean.JobComment;
import com.zhangwenyu.bean.JobCommentExample;
import com.zhangwenyu.bean.PreachComment;
import com.zhangwenyu.bean.PreachCommentExample;
import com.zhangwenyu.dao.PreachCommentMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class PreachCommentService {

    @Autowired
    private PreachCommentMapper preachCommentMapper;

    public Map<String,Object> insertComment(PreachComment preachComment){
        Map<String,Object> commentMap = new HashMap<>();
        try{
            preachCommentMapper.insert(preachComment);
            commentMap.put("flag","200");
        }catch (Exception e){
            commentMap.put("flag","100");
        }
        return commentMap;
    }

    public Map<String,Object> deleteComment(Integer commentId){
        Map<String,Object> delMap = new HashMap<>();
        try{
            preachCommentMapper.deleteByPrimaryKey(commentId);
            delMap.put("flag","200");
        }catch (Exception e){
            delMap.put("flag","100");
        }
        return delMap;
    }

    public List<PreachComment> searchComment(Integer preachId){
        PreachCommentExample example = new PreachCommentExample();
        example.setOrderByClause("create_time desc");
        PreachCommentExample.Criteria criteria = example.createCriteria();
        criteria.andPreachIdEqualTo(preachId);
        List<PreachComment> list = preachCommentMapper.selectByExample(example);
        return list;
    }


    public List<PreachComment> searchListCom(PreachComment preachComment){
        PreachCommentExample example = new PreachCommentExample();
        example.setOrderByClause("create_time desc");
        PreachCommentExample.Criteria criteria = example.createCriteria();
        if(preachComment.getSendName()!=null&&preachComment.getSendName()!=""){
            criteria.andSendNameLike("%"+preachComment.getSendName()+"%");
        }
        if(preachComment.getCommentText()!=null&&preachComment.getCommentText()!=""){
            criteria.andCommentTextLike("%"+preachComment.getCommentText()+"%");
        }
        List<PreachComment> list = preachCommentMapper.selectByExample(example);
        return list;
    }

}
