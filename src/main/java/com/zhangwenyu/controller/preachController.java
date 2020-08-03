package com.zhangwenyu.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zhangwenyu.bean.Follow;
import com.zhangwenyu.bean.Preach;
import com.zhangwenyu.bean.PreachComment;
import com.zhangwenyu.service.FollowService;
import com.zhangwenyu.service.PreachCommentService;
import com.zhangwenyu.service.PreachService;
import com.zhangwenyu.utils.Utils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.*;

@Controller
@RequestMapping("/preach")
public class preachController {

    @Autowired
    private PreachService preachService;

    @Autowired
    private PreachCommentService preachCommentService;

    @Autowired
    private FollowService followService;





    @RequestMapping("/searchById")
    @ResponseBody
    public Map searchById(@RequestParam("preachId") Integer preachId,@RequestParam(value = "take",required = false)String take){
        Map<String,Object> map = new HashMap<>();
        if(take==null){
            preachService.addClick(preachId);
        }
        Preach preach = preachService.searchById(preachId);
        if(preach==null){
            map.put("flag","100");
        }else{
            map.put("flag","200");
            map.put("preach",preach);
        }
        return map;
    }

    @RequestMapping("/insertOrUpdate")
    @ResponseBody
    public Map insertOrUpdate( Preach preach){
        System.out.println(preach.toString());
        Map<String,Object> map = new HashMap<>();

        preach.setCreatTime(new Utils().DateToString(new Date()));

            Preach preach1 = preachService.searchById(preach.getPreachId());
            preach.setClick(0);
            if (preach1 == null) {
                preach.setSchool("五邑大学");

                if(preach.getStatus()==null){
                    preach.setStatus(0);
                }
                map = preachService.insertPreach(preach);
            } else {
                map = preachService.updatePreach(preach);
            }

        return map;
    }

    @RequestMapping("/deletePreach")
    @ResponseBody
    public Map deletePreach(Integer preachId){
        return preachService.deletePreach(preachId);
    }


    @RequestMapping("/insertComment")
    @ResponseBody
    public Map insertComment(PreachComment preachComment){
        System.out.println(preachComment.toString());
        Map<String,Object> map =new HashMap<>();
        preachComment.setCreateTime(new Utils().DateToString(new Date()));
        map = preachCommentService.insertComment(preachComment);
        return map;
    }

    @RequestMapping("/delComment")
    @ResponseBody
    public Map deleteComment(Integer commentId){
        Map<String,Object> map =new HashMap<>();
       if(commentId==null){
           map.put("flag","100");
       }else{
           map = preachCommentService.deleteComment(commentId);
       }
        return map;
    }

    @RequestMapping("/searchComment")
    @ResponseBody
    public Map searchCommentByPreachId(Integer preachId) {
        Map<String, Object> map = new HashMap<>();
        if (preachId == null) {
            map.put("flag", "100");
        } else {
            List<PreachComment> list = preachCommentService.searchComment(preachId);
            if(list.size()==0){
                map.put("flag", "20");
            }else {
                map.put("flag", "200");
                map.put("comment", list);
            }
        }
        return map;

    }


    @RequestMapping("/searchListComment")
    @ResponseBody
    public Map searchListComment(PreachComment preachComment,@RequestParam("rows")Integer rows,@RequestParam("page")Integer page) {
        Map<String, Object> map = new HashMap<>();
        PageHelper.startPage(page,rows);
        List<PreachComment> list = preachCommentService.searchListCom(preachComment);
        PageInfo pageInfo = new PageInfo(list,page);
        map.put("rows",list);
        map.put("total",pageInfo.getTotal());
        return map;

    }


    @RequestMapping("/addFollow")
    @ResponseBody
    public Map addFollow(Follow follow){
        Map<String,Object> map = new HashMap<>();
        Follow follow1 = followService.searchById(follow);
        if(follow1==null){
            follow.setCreateTime(new Utils().DateToString(new Date()));
            map=followService.insertFollow(follow);
        }else{
            map.put("flag","100");
        }
        return map;
    }

    @RequestMapping("/delFollow")
    @ResponseBody
    public Map delFollow(Follow follow){
        Map<String,Object> map = new HashMap<>();
        map=followService.deleteFollow(follow);
        return map;
    }


    @RequestMapping("/searchFollow")
    @ResponseBody
    public Map searchFollow(Follow follow){
        Map<String,Object> map = new HashMap<>();
        Follow follow1 = followService.searchById(follow);
        if(follow1==null){
            map.put("flag","100");
        }else {
            map.put("flag","200");
            map.put("follow",follow1);
        }
        return map;
    }


    @RequestMapping("/showIndex")
    @ResponseBody
    public Map showIndex(){
        Map<String,Object> map = new HashMap<>();
        int page = 4;
        List<Preach> preaches = preachService.showIndex();
        String date = new Utils().DateToString2(new Date());
        List<Preach> preaches1 = new ArrayList<>();
        int i =0;
        for (Preach preach : preaches){
            if(date.compareTo(preach.getStartTime())<0){
                preach.setBackup("1");
                preaches1.add(preach);
                i++;
            }else {
                break;
            }
        }
        //System.out.println(i);
        if(i!=0){
            Collections.reverse(preaches1);
            for(int j=0;j<i;j++){
                preaches.set(j, preaches1.get(j));
            }
        }
        if(page>preaches.size()){
            page=preaches.size();
        }
        map.put("preach",preaches.subList(0,page));
        return map;
    }

    @RequestMapping("/selectByCondition")
    @ResponseBody
    public Map selectByCondition(@RequestParam(value = "companyName",required = false)String companyName,
                                 @RequestParam(value = "sendId",required = false)String sendId,
                                 @RequestParam(value = "snedName",required = false)String snedName,
                                 @RequestParam("status")Integer status,@RequestParam("rows")Integer rows,@RequestParam("page")Integer page){
        Map<String,Object> map = new HashMap<>();
        Preach preach = new Preach();
        if(companyName!=null && companyName!=""){
            preach.setCompanyName(companyName);
        }
        if(sendId!=null && sendId!=""){
            preach.setSendId(sendId);
        }
        if(snedName!=null && snedName!=""){
            preach.setSnedName(snedName);
        }
        preach.setStatus(status);
        System.out.println(status);
        PageHelper.startPage(page,rows);
        List<Preach> list = preachService.selectByCondition(preach);
        if(list.size()>0){
            map.put("flag","200");
            PageInfo pages = new PageInfo(list,rows);
            map.put("pageInfo",pages);
        }else{
            map.put("flag","100");
        }
        return map;
    }


    @RequestMapping("/selectByConditionAfter")
    @ResponseBody
    public Map selectByConditionAfter(@RequestParam(value = "companyName",required = false)String companyName,
                                 @RequestParam(value = "snedName",required = false)String snedName,
                                 @RequestParam(value = "status",defaultValue ="-1" )Integer status,@RequestParam("rows")Integer rows,@RequestParam("page")Integer page){
        Map<String,Object> map = new HashMap<>();
        Preach preach = new Preach();
        if(companyName!=null && companyName!=""){
            preach.setCompanyName(companyName);
        }

        if(snedName!=null && snedName!=""){
            preach.setSnedName(snedName);
        }
        preach.setStatus(status);
        PageHelper.startPage(page,rows);
        List<Preach> list = preachService.selectByCondition2(preach);
        map.put("rows",list);
        PageInfo pages = new PageInfo(list,rows);
        map.put("total",pages.getTotal());
//        if(list.size()>0){
//            map.put("flag","200");
//            PageInfo pages = new PageInfo(list,rows);
//            map.put("pageInfo",pages);
//        }else{
//            map.put("flag","100");
//        }
        return map;
    }


    @RequestMapping("/getFollow")
    @ResponseBody
    public Map getFollow(@RequestParam(value = "companyName",required = false)String companyName,
                         @RequestParam("userId")String userId,
                         @RequestParam("page")Integer page,@RequestParam("rows")Integer rows){
//        System.out.println(companyName);
        Map<String,Object> map = new HashMap<>();
        List<Integer> pid = followService.getFollowId(userId);
        if(pid.size()==0){
            map.put("flag","100");
            return map;
        }
        PageHelper.startPage(page,rows);
        List<Preach> preaches = preachService.getPreachByFollow(pid,companyName);
        if(preaches.size()>0){
            map.put("flag","200");
            PageInfo pages = new PageInfo(preaches,rows);
            map.put("pageInfo",pages);
            return map;
        }else {
            map.put("flag","100");
            return map;
        }

    }


    @RequestMapping("/changePreachStatus")
    @ResponseBody
    public Map changePreachStatus (Preach preach) throws Exception {
        Map<String, Object> map = new HashMap<>();
        System.out.println(preach.toString());
        map=preachService.changeCompanyStatus(preach);
        return map;
    }


}
