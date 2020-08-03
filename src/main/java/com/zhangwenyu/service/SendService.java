package com.zhangwenyu.service;

import com.zhangwenyu.bean.Send;
import com.zhangwenyu.bean.SendExample;
import com.zhangwenyu.bean.SendKey;
import com.zhangwenyu.dao.SendMapper;
import org.omg.CORBA.OBJ_ADAPTER;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class SendService {

    @Autowired
    private SendMapper sendMapper;


    //查询是否有投过简历
    public Send searchByUserId(String studentId,Integer jobId){
        SendKey sendKey = new SendKey();
        sendKey.setStudentId(studentId);
        sendKey.setJobId(jobId);
        return sendMapper.selectByPrimaryKey(sendKey);
    }

    public Map<String,Object> addSend(Send send){
        Map<String, Object> sendMap = new HashMap<>();
        try{
            sendMapper.insert(send);
            sendMap.put("flag","200");
        }catch (Exception e){
            sendMap.put("flag","100");
            sendMap.put("msg","投递失败，请重试！");
        }
        return sendMap;
    }

    public List<Send> searchByJobId(Integer jobId){
        SendExample sendExample = new SendExample();
        SendExample.Criteria criteria = sendExample.createCriteria();
        criteria.andJobIdEqualTo(jobId);
        List<Send> list = sendMapper.selectByExample(sendExample);
        return list;
    }

    public List<Integer> searchBySend(String studentId){
        SendExample example = new SendExample();
        example.setOrderByClause("createTime desc");
        SendExample.Criteria criteria = example.createCriteria();
        criteria.andStudentIdEqualTo(studentId);
        List<Send> sends = sendMapper.selectByExample(example);
        List<Integer> jid = new ArrayList<>();
        for(Send send : sends){
            jid.add(send.getJobId());
        }
        return jid;
    }

}
