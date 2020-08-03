package com.zhangwenyu.controller;

import com.zhangwenyu.bean.CollegeDept;
import com.zhangwenyu.service.CollegeDeptService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @Author: Zhang Wenyu
 * @Date: 2020-04-14 20:37
 * @Version: 1.0
 */
@Controller
@RequestMapping("/college")
public class collegeDeptController {

    @Autowired
    private CollegeDeptService collegeDeptService;


    @RequestMapping("/getListByPid")
    @ResponseBody
    public Map getListByPid(@RequestParam("pid")Integer pid){
        Map<String,Object> map = new HashMap<>();
        try {
            List<CollegeDept> list = collegeDeptService.getListByPid(pid);
            map.put("flag","200");
            map.put("list",list);
        }catch (Exception e){
            e.printStackTrace();
            map.put("flag","100");
        }

        return map;

    }


    @RequestMapping("/getListByName")
    @ResponseBody
    public Map getListByName(@RequestParam("name")String name){
        Map<String,Object> map = new HashMap<>();
        try {
            int pid=collegeDeptService.getIdByName(name).getId();
            List<CollegeDept> list = collegeDeptService.getListByPid(pid);
            map.put("flag","200");
            map.put("list",list);
        }catch (Exception e){
            e.printStackTrace();
            map.put("flag","100");
        }

        return map;

    }



}
