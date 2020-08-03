package com.zhangwenyu.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zhangwenyu.bean.News;
import com.zhangwenyu.service.NewsService;
import com.zhangwenyu.utils.Utils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/news")
public class newsController {
    @Autowired
    private NewsService newsService;


    @RequestMapping("/searchById")
    @ResponseBody
    public  Map searchById(Integer newsId,@RequestParam(value = "backup",required = false)String backup,
                           @RequestParam(value = "token",required = false)String token){
        Map<String,Object> map = new HashMap<>();
        if(token!=null){
            newsService.addClick(newsId);
        }
        News news = newsService.searchById(newsId);
        if(news==null){
            map.put("flag","100");
        }else{
            if(backup!=null){
                if(!backup.equals(news.getBackup())){
                    map.put("flag","100");
                    return map;
                }
            }
            map.put("flag","200");
            map.put("news",news);
        }
        return map;
    }

    @RequestMapping("/insertOrUpdate")
    @ResponseBody
    public Map insertOrUpdate(News news){
        System.out.println(news.toString());
        Map<String,Object> map = new HashMap<>();
        if("".equals(news.getFileUrl())){
            news.setFileUrl(null);
        }
        if("".equals(news.getFileName())){
            news.setFileName(null);
        }
        if(news!=null) {
            News news1 = newsService.searchById(news.getNewsId());
            if (news1 != null) {
                map = newsService.updateNews(news);
            }else{
                news.setNewsTime(new Utils().DateToString2(new Date()));
                news.setClick(0);
                map=newsService.insertNews(news);
            }
        }else{
            map.put("flag","100");
        }
        return map;
    }


    @RequestMapping("/searchByCondition")
    @ResponseBody
    public Map searchByCondition(@RequestParam(value = "title",required = false)String title,
                                 @RequestParam(value = "backup",defaultValue = "-1")String backup,
                                 @RequestParam("rows")Integer rows,@RequestParam("page")Integer page){
        Map<String,Object> map = new HashMap<>();
        PageHelper.startPage(page,rows);
        List<News> list= newsService.searchByCondition(backup,title);
        map.put("rows",list);
        long total=0;
        if(list.size()>0){
            map.put("flag","200");
            PageInfo pages = new PageInfo(list,rows);
            map.put("pageInfo",pages);
            total=pages.getTotal();
        }else{
            map.put("flag","100");
        }
        map.put("total",total);
        return map;


    }

}
