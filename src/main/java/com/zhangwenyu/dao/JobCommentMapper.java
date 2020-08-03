package com.zhangwenyu.dao;

import com.zhangwenyu.bean.JobComment;
import com.zhangwenyu.bean.JobCommentExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface JobCommentMapper {
    long countByExample(JobCommentExample example);

    int deleteByExample(JobCommentExample example);

    int deleteByPrimaryKey(Integer commentId);

    int insert(JobComment record);

    int insertSelective(JobComment record);

    List<JobComment> selectByExample(JobCommentExample example);

    JobComment selectByPrimaryKey(Integer commentId);

    int updateByExampleSelective(@Param("record") JobComment record, @Param("example") JobCommentExample example);

    int updateByExample(@Param("record") JobComment record, @Param("example") JobCommentExample example);

    int updateByPrimaryKeySelective(JobComment record);

    int updateByPrimaryKey(JobComment record);
}