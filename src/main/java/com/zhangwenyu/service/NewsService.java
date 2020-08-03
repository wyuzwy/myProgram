package com.zhangwenyu.service;

import com.zhangwenyu.bean.News;
import com.zhangwenyu.bean.NewsExample;
import com.zhangwenyu.dao.NewsMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class NewsService {

    @Autowired
    private NewsMapper newsMapper;


    public News searchById(Integer newsId){
        News news = newsMapper.selectByPrimaryKey(newsId);
        return news;
    }


    public Map<String,Object> insertNews(News news){
        Map<String,Object> newsMap = new HashMap<>();

        try{
            newsMapper.insert(news);
            newsMap.put("flag","200");
        }catch (Exception e){
            newsMap.put("flag","100");
        }
        return newsMap;
    }

    public Map<String,Object> updateNews(News news){
        Map<String,Object> newsMap = new HashMap<>();

        try{
            newsMapper.updateByPrimaryKeySelective(news);
            newsMap.put("flag","200");
        }catch (Exception e){
            newsMap.put("flag","100");
        }
        return newsMap;
    }

    public List<News> searchByCondition(String backup,String title){
        NewsExample example = new NewsExample();
        example.setOrderByClause("news_time desc");
        NewsExample.Criteria criteria = example.createCriteria();
        if(!backup.equals("-1")) {
            criteria.andBackupEqualTo(backup);
        }
        if(title!=null&&!title.equals("")){
            criteria.andTitleLike("%"+title+"%");
        }
        List<News> news = newsMapper.selectByExample(example);
        return news;
    }

    public void addClick(Integer newsId){
        newsMapper.addClick(newsId);
    }

}
