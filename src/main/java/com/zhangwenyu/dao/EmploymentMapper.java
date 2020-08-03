package com.zhangwenyu.dao;

import com.zhangwenyu.bean.Employment;
import com.zhangwenyu.bean.EmploymentExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface EmploymentMapper {
    long countByExample(EmploymentExample example);

    int deleteByExample(EmploymentExample example);

    int deleteByPrimaryKey(String studentId);

    int insert(Employment record);

    int insertSelective(Employment record);

    List<Employment> selectByExample(EmploymentExample example);

    Employment selectByPrimaryKey(String studentId);

    int updateByExampleSelective(@Param("record") Employment record, @Param("example") EmploymentExample example);

    int updateByExample(@Param("record") Employment record, @Param("example") EmploymentExample example);

    int updateByPrimaryKeySelective(Employment record);

    int updateByPrimaryKey(Employment record);

    List<Employment> searchByCondition(Employment employment);

    Long countByCondition(@Param("studentDept") String studentDept,@Param("year")String year);
}