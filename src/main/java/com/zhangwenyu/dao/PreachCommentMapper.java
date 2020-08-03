package com.zhangwenyu.dao;

import com.zhangwenyu.bean.PreachComment;
import com.zhangwenyu.bean.PreachCommentExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface PreachCommentMapper {
    long countByExample(PreachCommentExample example);

    int deleteByExample(PreachCommentExample example);

    int deleteByPrimaryKey(Integer commentId);

    int insert(PreachComment record);

    int insertSelective(PreachComment record);

    List<PreachComment> selectByExample(PreachCommentExample example);

    PreachComment selectByPrimaryKey(Integer commentId);

    int updateByExampleSelective(@Param("record") PreachComment record, @Param("example") PreachCommentExample example);

    int updateByExample(@Param("record") PreachComment record, @Param("example") PreachCommentExample example);

    int updateByPrimaryKeySelective(PreachComment record);

    int updateByPrimaryKey(PreachComment record);
}