package com.zhangwenyu.dao;

import com.zhangwenyu.bean.CollegeDept;
import com.zhangwenyu.bean.CollegeDeptExample;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CollegeDeptMapper {
    long countByExample(CollegeDeptExample example);

    int deleteByExample(CollegeDeptExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(CollegeDept record);

    int insertSelective(CollegeDept record);

    List<CollegeDept> selectByExample(CollegeDeptExample example);

    CollegeDept selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") CollegeDept record, @Param("example") CollegeDeptExample example);

    int updateByExample(@Param("record") CollegeDept record, @Param("example") CollegeDeptExample example);

    int updateByPrimaryKeySelective(CollegeDept record);

    int updateByPrimaryKey(CollegeDept record);
}