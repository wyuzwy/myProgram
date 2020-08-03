package com.zhangwenyu.controller;

import com.zhangwenyu.bean.Send;
import com.zhangwenyu.service.SendService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.xml.ws.Action;
import java.util.HashMap;
import java.util.Map;

/**
 * @Author: Zhang Wenyu
 * @Date: 2020-03-20 19:46
 * @Version: 1.0
 */

@Controller
@RequestMapping("/send")
public class sendController {
    @Autowired
    private SendService sendService;



//    @RequestMapping("/sendResume")
//    @ResponseBody
//    public Map sendResume(Send send){
//        Map<String,Object> map = new HashMap<>();
//
//    }

}
