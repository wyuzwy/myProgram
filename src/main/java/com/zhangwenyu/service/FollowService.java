package com.zhangwenyu.service;

import com.zhangwenyu.bean.Follow;
import com.zhangwenyu.bean.FollowExample;
import com.zhangwenyu.bean.FollowKey;
import com.zhangwenyu.dao.FollowMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class FollowService {

    @Autowired
    private FollowMapper followMapper;

    public Map<String,Object> insertFollow(Follow follow){
        Map<String,Object> followMap = new HashMap<>();
        try{
            followMapper.insert(follow);
            followMap.put("flag","200");
        }catch (Exception e){
            followMap.put("flag","500");
        }
        return followMap;
    }

    public Follow searchById(Follow follow){
        FollowKey followKey = new FollowKey();
        followKey.setJobId(follow.getJobId());
        followKey.setStudentId(follow.getStudentId());
        Follow follow1 = followMapper.selectByPrimaryKey(followKey);
        return follow1;
    }

    public Map<String,Object> deleteFollow(Follow follow){
        FollowKey followKey = new FollowKey();
        followKey.setJobId(follow.getJobId());
        followKey.setStudentId(follow.getStudentId());
        Map<String,Object> followMap = new HashMap<>();
        try{
            followMapper.deleteByPrimaryKey(followKey);
            followMap.put("flag","200");
        }catch (Exception e){
            followMap.put("flag","100");
        }
        return followMap;
    }

    public List<Integer> getFollowId(String studentId){
        FollowExample example = new FollowExample();
        example.setOrderByClause("create_time desc");
        FollowExample.Criteria criteria = example.createCriteria();
        criteria.andStudentIdEqualTo(studentId);
        List<Follow> follows = followMapper.selectByExample(example);
        List<Integer> pid = new ArrayList<>();
        for (Follow follow : follows){
            pid.add(follow.getJobId());
        }
        return pid;
    }

}
