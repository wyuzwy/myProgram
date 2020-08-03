package com.zhangwenyu.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zhangwenyu.bean.*;
import com.zhangwenyu.service.JobCommentService;
import com.zhangwenyu.service.JobService;
import com.zhangwenyu.service.ResumeService;
import com.zhangwenyu.service.SendService;
import com.zhangwenyu.utils.Utils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/job")
public class jobController {

    @Autowired
    private JobService jobService;

    @Autowired
    private JobCommentService jobCommentService;

    @Autowired
    private SendService sendService;

    @Autowired
    private ResumeService resumeService;


    @RequestMapping("/searchById")
    @ResponseBody
    public Map searchById(@RequestParam("jobId")Integer jobId,@RequestParam(value = "take",required = false)String take){
        Map<String,Object> map = new HashMap<>();
        if(take==null){
            jobService.addClick(jobId);
        }
        Job job = jobService.searchById(jobId);
        if(job==null){
            map.put("flag","100");
        }else{
            map.put("flag", "200");
            map.put("job", job);
        }
        return map;
    }

    @RequestMapping("/insertOrUpdate")
    @ResponseBody
    public Map insertOrUpdate(Job job){
        Map<String,Object> map =new HashMap<>();

            Job job1 = jobService.searchById(job.getJobId());
            job.setClick(0);
            if(job1!=null){
                map = jobService.updateJob(job);
            }else{
                job.setCreateTime(new Utils().DateToString(new Date()));

                if (job.getStatus()==null){
                    job.setStatus(0);
                }
                map = jobService.insertJob(job);
            }
        return map;

    }


    @RequestMapping("/insertComment")
    @ResponseBody
    public Map insertComment(JobComment jobComment){
        Map<String,Object> map =new HashMap<>();
        System.out.println(jobComment.toString());
        jobComment.setCreateTime(new Utils().DateToString(new Date()));
        map= jobCommentService.insertComment(jobComment);
        return map;
    }


    @RequestMapping("/delComment")
    @ResponseBody
    public Map deleteComment(Integer commentId){
        Map<String,Object> map =new HashMap<>();
        if(commentId==null){
            map.put("flag","100");
        }else {
            map = jobCommentService.deleteComment(commentId);
        }
        return map;
    }

    @RequestMapping("/searchListComment")
    @ResponseBody
    public Map searchListComment(JobComment jobComment,@RequestParam("rows")Integer rows,@RequestParam("page")Integer page) {
        Map<String, Object> map = new HashMap<>();
        PageHelper.startPage(page,rows);
        List<JobComment> list = jobCommentService.searchListCom(jobComment);
        PageInfo pageInfo = new PageInfo(list,page);
        map.put("rows",list);
        map.put("total",pageInfo.getTotal());
        return map;

    }



    @RequestMapping("/searchCom")
    @ResponseBody
    public Map searchCommentByJobId(Integer jobId){
        Map<String,Object> map = new HashMap<>();
        if(jobId==null){
            map.put("flag","100");
        }else {
            List<JobComment> commentList = jobCommentService.searchComment(jobId);
            if(commentList.size()==0){
                map.put("flag", "20");
            }else {
                map.put("flag", "200");
                map.put("comment", commentList);
            }
        }
        return map;
    }


    @ResponseBody
    @RequestMapping(value = "/addSend",method = RequestMethod.POST)
    public Map addSend(Send send){
        Map<String,Object> map = new HashMap<>();
        Resume resume = resumeService.searchById(send.getStudentId());
        if(resume==null){
            map.put("flag","100");
            map.put("msg","请先上传你的简历！");
            return map;
        }else{
            if(resume.getResumeUrl()==null){
                map.put("flag","100");
                map.put("msg","请先上传你的简历！");
                return map;
            }
        }
        Send send1 = sendService.searchByUserId(send.getStudentId(),send.getJobId());
        if(send1==null){
            send.setCreatetime(new Utils().DateToString(new Date()));
            map = sendService.addSend(send);
        }else{
            map.put("flag","100");
            map.put("msg","请勿重复投递！");
        }
        return map;
    }


    @RequestMapping("/downResume")
    @ResponseBody
    public Map downResumeByJobId(String id, Integer jobId, HttpServletRequest request, HttpServletResponse response){
        Map<String,Object> map = new HashMap<>();
        User user = (User) request.getSession().getAttribute("currentUser");
        if(!id.equals(user.getId())){
            map.put("flag","100");
            map.put("msg","请勿非法下载！");
        }else {
            List<Send> sends = sendService.searchByJobId(jobId);
            if(sends.size()==0){
                map.put("flag","100");
                map.put("msg","当前简历数为0，请耐心等待！");
            }else{
                //请求打包下载service
                map.put("flag","200");
            }
        }
        return map;

    }

    @RequestMapping("/deleteJob")
    @ResponseBody
    public Map deleteJob(Integer jobId){
        return jobService.deleteJob(jobId);
    }



    @RequestMapping("/showIndex")
    @ResponseBody
    public Map showIndex(){
        Map<String,Object> map = new HashMap<>();
        int page = 4;
        List<Job> jobs = jobService.showIndex();
        if(page>jobs.size()){
            page=jobs.size();
        }
        map.put("job",jobs.subList(0,page));

        return map;
    }

    @RequestMapping("/searchByCondition")
    @ResponseBody
    public Map selectByCondition(@RequestParam(value = "companyName",required = false)String companyName,
                                 @RequestParam(value = "jobName",required = false)String jobName,
                                 @RequestParam(value = "category",required = false)String category,
                                 @RequestParam(value = "sendId",required = false)String sendId,
                                 @RequestParam("status")Integer status,@RequestParam("rows")Integer rows,@RequestParam("page")Integer page){

        Map<String,Object> map = new HashMap<>();
        Job job = new Job();
        if(companyName!=null&&companyName!=""){
            job.setCompanyName(companyName);
        }
        if(jobName!=null&&jobName!=""){
            job.setJobName(jobName);
        }
        if(category!=null&&category!=""){
            job.setCategory(category);
        }
        if(sendId!=null&&sendId!=""){
            job.setSendId(sendId);
        }
        job.setStatus(status);
        PageHelper.startPage(page,rows);
        List<Job> list= jobService.selectByCondition(job);
        if(list.size()>0){
            map.put("flag","200");
            PageInfo pages = new PageInfo(list,rows);
            map.put("pageInfo",pages);
        }else{
            map.put("flag","100");
        }
        return map;
    }


    @RequestMapping("/searchByConditionAfter")
    @ResponseBody
    public Map searchByConditionAfter(@RequestParam(value = "companyName",required = false)String companyName,
                                      @RequestParam(value = "sendName",required = false)String sendName,
                                 @RequestParam(value = "jobName",required = false)String jobName,
                                 @RequestParam(value = "category",required = false)String category,
                                 @RequestParam(value = "status",defaultValue = "-1")Integer status,@RequestParam("rows")Integer rows,@RequestParam("page")Integer page){

        Map<String,Object> map = new HashMap<>();
        Job job = new Job();
        if(companyName!=null&&companyName!=""){
            job.setCompanyName(companyName);
        }
        if(jobName!=null&&jobName!=""){
            job.setJobName(jobName);
        }
        if(category!=null&&category!=""){
            job.setCategory(category);
        }
        if(sendName!=null&&sendName!=""){
            job.setSendName(sendName);
        }
        if(status!=-1){
            job.setStatus(status);
        }
        PageHelper.startPage(page,rows);
        List<Job> list= jobService.selectByCondition2(job);
        map.put("rows",list);
        PageInfo pages = new PageInfo(list,rows);
        map.put("total",pages.getTotal());
        return map;
    }



    @RequestMapping("/getSend")
    @ResponseBody
    public Map getSend(@RequestParam(value = "companyName",required = false)String companyName,
                       @RequestParam(value = "jobName",required = false)String jobName,
                       @RequestParam(value = "category",required = false)String category,
                       @RequestParam("userId")String userId,
                       @RequestParam("rows")Integer rows,@RequestParam("page")Integer page){
        Map<String,Object> map = new HashMap<>();
        List<Integer> jid = sendService.searchBySend(userId);
        if(jid.size()==0){
            map.put("flag","100");
            return map;
        }
        PageHelper.startPage(page,rows);
        List<Job> jobs = jobService.searchBySendId(companyName,jobName,category,jid);
        if(jobs.size()>0){
            map.put("flag","200");
            PageInfo pages = new PageInfo(jobs,rows);
            map.put("pageInfo",pages);
            return map;
        }else{
            map.put("flag","100");
            return map;
        }

    }

}
