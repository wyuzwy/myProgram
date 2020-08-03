package com.zhangwenyu.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zhangwenyu.bean.User;
import com.zhangwenyu.service.AddExcelService;
import com.zhangwenyu.service.FileService;
import com.zhangwenyu.service.UserService;
import com.zhangwenyu.utils.VerifyCode;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class userController {

    @Value("${request.url}")
    private String url;

    @Autowired
    private UserService userService;

    @Autowired
    private FileService fileService;

    @Autowired
    private AddExcelService addExcelService;




    @RequestMapping("/updatePwd")
    @ResponseBody
    public Map updatePwd(@RequestParam String id,String password,String newPassword){
        System.out.println("id="+id+",password="+password+",newPassword="+newPassword);
        Map<String,Object> map = new HashMap<>();
        User user = userService.findUserById(id);
        if(user!=null){
            if(password.equals(user.getPassword())){
                User user1 = new User();
                user1.setId(id);
                user1.setPassword(newPassword);
                map=userService.updateUser(user1);
            }else{
                map.put("flag","100");
                map.put("msg","密码不正确！");
            }
        }else{
            map.put("flag","100");
            map.put("msg","账号错误！");
        }

        return map;
    }



    @RequestMapping("/login")
    @ResponseBody
    public Map login(String id, String password, String verify, HttpServletRequest request) {
        Map<String,Object> map = new HashMap<>();
        //获取session
        HttpSession session = request.getSession();
        //获取session域的code，用于验证码校验
        String code= (String)session.getAttribute("code");
        if(!verify.equalsIgnoreCase(code)){
            map.put("flag","100");
            map.put("msg","验证码不正确！！！");
            return map;
        }
        //查询某个id的user信息
        User user = userService.getUserById(id);
        if(user==null){
            map.put("flag","100");
            map.put("msg","用户不存在！");
            return map;
        }else{
            if(!user.getPassword().equals(password)){
                map.put("flag","100");
                map.put("msg","密码错误！！！");
                return map;
            }else{
                int status=user.getStatus();
                if(status==0){
                    map.put("flag","100");
                    map.put("msg","账号正在审核中！");
                    return map;
                }else if(status==2){
                    map.put("flag","100");
                    map.put("msg",user.getBackup());
                    return map;
                }else {
                    HttpSession httpSession = request.getSession();
                    user.setPassword(null);

                    map.put("flag", "200");
                    int role = user.getRole();
                    if (role == 1) {
                        httpSession.setAttribute("currentUser", user);
                        map.put("data",url+"/studentInfo.jsp");
                    }else if(role==2){
                        httpSession.setAttribute("currentUser", user);
                        map.put("data",url+"/teacherInfo.jsp");
                    }else if(role==3){
                        httpSession.setAttribute("currentUser", user);
                        map.put("data",url+"/companyInfo.jsp");
                    }else{
                        httpSession.setAttribute("user", user);
                        map.put("data",url+"/admin.jsp");
                    }
                }
            }
        }
        return map;
    }

    @RequestMapping("/setVerify")
    @ResponseBody
    public void verify(HttpServletRequest request, HttpServletResponse response) throws IOException, IOException {
        VerifyCode vc = new VerifyCode();//创建验证码类
        BufferedImage image  = vc.getImage();//创建验证码图片
        request.getSession().setAttribute("code", vc.getText());//获取验证码文本,并将其放到session域中
        VerifyCode.output(image, response.getOutputStream());//输出图片到页面
    }



    @RequestMapping("/exit")
    public String exit(HttpSession session){
        session.invalidate();
        return "redirect:/login.jsp";
    }


    @ResponseBody
    @RequestMapping(value = "/forgetPassword")
    public Map forgetPassword(String id, String phone, String verify, HttpServletRequest request){
        Map<String ,Object> map = new HashMap<>();
        HttpSession session = request.getSession();
        //获取session域的code，用于验证码校验
        String code= (String)session.getAttribute("code");
        if(!verify.equalsIgnoreCase(code)){
            map.put("flag","100");
            map.put("msg","验证码不正确！！！");
            return map;
        }
        map = userService.forgetPassword(id, phone);
        return map;
    }

    @ResponseBody
    @RequestMapping(value = "/searchInfoById" ,method = RequestMethod.GET)
    public Map searchInfoById(HttpServletRequest request){
        Map<String ,Object> map = new HashMap<>();
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("currentUser");
        if(user==null){
            map.put("flag","500");
            return map;
        }
        map = userService.searchInfoById(user.getId(),user.getRole());
        return map;
    }


    @RequestMapping("/returnToMyInfo")
    public String returnToMyInfo(HttpServletRequest request){
        HttpSession session = request.getSession();
        //获取session域的code，用于验证码校验
        User user= (User)session.getAttribute("currentUser");
        int role = user.getRole();
        String url="";
        if(role==1){
            url="studentInfo";
        }else if(role==2){
            url="teacherInfo";
        }else if(role==3){
            url="companyInfo";
        }else{
            url="index";
        }
        return url;
    }

    @RequestMapping("/searchByCondition")
    @ResponseBody
    public Map searchByCondition(User user,@RequestParam("page")Integer page,
                                 @RequestParam("rows")Integer rows){
        Map<String,Object> map = new HashMap<>();
        PageHelper.startPage(page, rows);
        List<User> users=userService.searchByCondition(user);
        PageInfo pageInfo = new PageInfo(users,page);
        map.put("rows",users);
        map.put("total",pageInfo.getTotal());
        return map;
    }

    @RequestMapping("/getUserExcel")
    public void getUserExcel(User user,HttpServletRequest request, HttpServletResponse response){
        try {
            fileService.getUserExcel(request,user,response);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @RequestMapping("/searchById")
    @ResponseBody
    public Map searchById(String id){
        Map<String,Object> map = new HashMap<>();
        User user = userService.findUserById(id);
        if(user!=null){
            user.setPassword(null);
            map.put("flag","200");
            map.put("user",user);
        }else{
            map.put("flag","100");
        }
        return map;
    }

    @RequestMapping("/checkUser")
    @ResponseBody
    public Map checkUser(String id){
        Map<String,Object> map = new HashMap<>();
        User user = userService.findUserById(id);
        if(user!=null){
            map.put("flag","200");
        }else{
            map.put("flag","100");
        }
        return map;
    }


    @RequestMapping("/updateUser")
    @ResponseBody
    public Map updateUser(User user){
        System.out.println(user.toString());
        Map<String,Object> map = userService.updateUser(user);
        return map;
    }

    @RequestMapping("/addUserFromExcel")
    @ResponseBody
    public Map<String ,Object> addUserFromExcel(@RequestParam(value="userExcel",required = false) MultipartFile userExcel, HttpServletRequest request){
        Map<String,Object> map = new HashMap<>();
        if(userExcel.isEmpty()){
            map.put("flag","100");
            map.put("info","请添加文件");
            return map;
        }
        String fileName = userExcel.getOriginalFilename();
        String savedPath = request.getServletContext().getRealPath("/") + "excel/";
        File saveDir = new File(savedPath);
        if (!saveDir.exists()) {
            saveDir.mkdirs();
        }
        File saveFile = new File(savedPath, fileName);

        try {
            userExcel.transferTo(saveFile);
            map=addExcelService.addUserFromExcel(saveFile);
            return map;
        } catch (IOException e) {
            e.printStackTrace();
            map.put("flag","100");
            map.put("info","文件上传异常");
            return map;
        } catch (Exception e) {
            e.printStackTrace();
            map.put("flag","100");
            map.put("info","文件解析异常");
            return map;
        } finally {
            boolean delete = saveFile.delete();
            System.out.println(delete);
        }




    }


}
