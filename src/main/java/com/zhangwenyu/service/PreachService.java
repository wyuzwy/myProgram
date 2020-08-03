package com.zhangwenyu.service;


import com.zhangwenyu.bean.Preach;
import com.zhangwenyu.bean.PreachExample;
import com.zhangwenyu.dao.PreachMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

@Service
public class PreachService {

    @Autowired
    private PreachMapper preachMapper;

    @Autowired
    private EmailService emailService;

    static ExecutorService fixedThreadPool = Executors.newCachedThreadPool();

    public Preach searchById (Integer id){

        Preach preach =preachMapper.selectByPrimaryKey(id);
        return preach;
    }


    public Map<String,Object> insertPreach(Preach preach){
        Map<String,Object> map = new HashMap<>();
        try{
            preachMapper.insert(preach);
            map.put("flag","200");
        }catch (Exception e){
            e.printStackTrace();
            map.put("flag","100");
        }
        return map;
    }


    public Map<String,Object> updatePreach(Preach preach){
        Map<String,Object> map = new HashMap<>();
        try{
            preachMapper.updateByPrimaryKeySelective(preach);
            map.put("flag","200");
        }catch (Exception e){
            e.printStackTrace();
            map.put("flag","100");
        }
        return map;
    }


    public Map<String,Object> deletePreach(Integer preachId){
        Map<String,Object> map = new HashMap<>();
        try{
            preachMapper.deleteByPrimaryKey(preachId);
            map.put("flag","200");
        }catch (Exception e){
            e.printStackTrace();
            map.put("flag","100");
        }
        return map;

    }


    public List<Preach> showIndex(){
        PreachExample preachExample = new PreachExample();
        preachExample.setOrderByClause("start_time desc");
        PreachExample.Criteria criteria = preachExample.createCriteria();
        criteria.andStatusEqualTo(1);
        List<Preach> preaches = preachMapper.selectByExample(preachExample);
        return preaches;
    }


    public void addClick (Integer preachId){
        preachMapper.addClick(preachId);
    }

    public List<Preach> selectByCondition(Preach preach){
        List<Preach> preaches = preachMapper.selectByCondition(preach);
        return preaches;
    }

    public List<Preach> selectByCondition2(Preach preach){
        PreachExample preachExample = new PreachExample();
        preachExample.setOrderByClause("status asc");
        PreachExample.Criteria criteria = preachExample.createCriteria();
        if(preach.getCompanyName()!=null&&preach.getCompanyName()!=""){
            criteria.andCompanyNameLike("%"+preach.getCompanyName()+"%");
        }
        if(preach.getSnedName()!=null&&preach.getSnedName()!=""){
            criteria.andSnedNameLike("%"+preach.getSnedName()+"%");
        }
        if(preach.getStatus()!=-1){
            criteria.andStatusEqualTo(preach.getStatus());
        }

        List<Preach> preaches = preachMapper.selectByExample(preachExample);
        return preaches;
    }

    public List<Preach> getPreachByFollow(List<Integer> preachId,String companyName){
        PreachExample example = new PreachExample();
        PreachExample.Criteria criteria = example.createCriteria();
        criteria.andStatusEqualTo(1);
        criteria.andPreachIdIn(preachId);
        if(companyName!=null&&!companyName.equals("")){
           criteria.andCompanyNameLike("%"+companyName+"%");
        }
        List<Preach> preaches=preachMapper.selectByExample(example);
        return preaches;
    }


    public Map<String,Object> changeCompanyStatus(Preach preach) throws Exception {
        Map<String,Object> map = new HashMap<>();
        Preach preach1 =preachMapper.selectByPrimaryKey(preach.getPreachId());
        String theme="宣讲会申请审核结果通知";
        try{

            preachMapper.updateByPrimaryKeySelective(preach);
            map.put("flag","200");
            if(preach1.getCompanyId()!=null) {
                fixedThreadPool.execute(new Runnable() {
                    @Override
                    public void run() {
                        try {
                            Thread.sleep(1000);

                            if (preach.getStatus() == 1) {
                                emailService.sendEmail(preach1.getCompanyId(), theme, "您的宣讲会申请已通过，感谢您的使用！");
                            } else {
                                emailService.sendEmail(preach1.getCompanyId(), theme, preach.getRemark());
                            }

                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                    }
                });
            }
        }catch (Exception e){
            e.printStackTrace();
            map.put("flag","100");
            map.put("msg","修改失败，请重试！");
            return map;
        }
//        if(preach.getCompanyId()!=null){
//            if(preach.getStatus()==1){
//                emailService.sendEmail(preach.getCompanyId(), theme, "您的宣讲会申请已通过，感谢您的使用！");
//            }else{
//                emailService.sendEmail(preach.getCompanyId(), theme,preach.getRemark());
//            }
//        }
        return map;
    }

}
