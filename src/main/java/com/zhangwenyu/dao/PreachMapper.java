package com.zhangwenyu.dao;

import com.zhangwenyu.bean.Preach;
import com.zhangwenyu.bean.PreachExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface PreachMapper {
    long countByExample(PreachExample example);

    int deleteByExample(PreachExample example);

    int deleteByPrimaryKey(Integer preachId);

    int insert(Preach record);

    int insertSelective(Preach record);

    List<Preach> selectByExample(PreachExample example);

    Preach selectByPrimaryKey(Integer preachId);

    int updateByExampleSelective(@Param("record") Preach record, @Param("example") PreachExample example);

    int updateByExample(@Param("record") Preach record, @Param("example") PreachExample example);

    int updateByPrimaryKeySelective(Preach record);

    int updateByPrimaryKey(Preach record);

    void addClick(Integer preachId);

    List<Preach> selectByCondition(Preach preach);

//    List<Preach> selectByCondition2(Preach preach);

}