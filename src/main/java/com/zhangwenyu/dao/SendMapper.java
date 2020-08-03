package com.zhangwenyu.dao;

import com.zhangwenyu.bean.Send;
import com.zhangwenyu.bean.SendExample;
import com.zhangwenyu.bean.SendKey;
import java.util.List;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface SendMapper {
    long countByExample(SendExample example);

    int deleteByExample(SendExample example);

    int deleteByPrimaryKey(SendKey key);

    int insert(Send record);

    int insertSelective(Send record);

    List<Send> selectByExample(SendExample example);

    Send selectByPrimaryKey(SendKey key);

    int updateByExampleSelective(@Param("record") Send record, @Param("example") SendExample example);

    int updateByExample(@Param("record") Send record, @Param("example") SendExample example);

    int updateByPrimaryKeySelective(Send record);

    int updateByPrimaryKey(Send record);
}