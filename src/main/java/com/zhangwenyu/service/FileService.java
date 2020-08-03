package com.zhangwenyu.service;

import com.zhangwenyu.bean.Company;
import com.zhangwenyu.bean.Employment;
import com.zhangwenyu.bean.Student;
import com.zhangwenyu.bean.User;
import com.zhangwenyu.dao.EmploymentMapper;
import com.zhangwenyu.dao.StudentMapper;
import com.zhangwenyu.utils.ResponseToHtml;
import org.apache.poi.hssf.usermodel.*;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;
import org.springframework.web.multipart.MultipartFile;

import javax.print.attribute.standard.Fidelity;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;
import jxl.Cell;


@Service
public class FileService {

    @Autowired
    private EmploymentMapper employmentMapper;

    @Autowired
    private StudentService studentService;

    @Autowired
    private CompanyService companyService;

    @Autowired
    private UserService userService;


    public Map<String , Object> addImg(MultipartFile file, HttpServletRequest request) {
        String fileName = file.getOriginalFilename();
        System.out.println(fileName);
        String saveName = UUID.randomUUID().toString().replace("-", "").substring(0,5) + fileName;
        String savedPath = request.getServletContext().getRealPath("/") + "Images/";
        String saveUrl  = request.getContextPath() + "/Images/";

        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHH");
        String ymd = sdf.format(new Date());
        savedPath += ymd + "/";
        saveUrl += ymd + "/";


        File saveDir = new File(savedPath);
        if (!saveDir.exists()) {
            saveDir.mkdirs();
        }
        File saveFile = new File(savedPath, saveName);
        Map<String,Object> map = new HashMap<>();
        String url = saveUrl+saveName;
        try{
            file.transferTo(saveFile);
            map.put("flag","200");
            map.put("url",url);

        } catch (IOException e) {
            e.printStackTrace();
            map.put("flag","100");
        }
        return map;
    }


    public Map<String,Object> addResume(MultipartFile file, HttpServletRequest request){
        String fileName = file.getOriginalFilename();
        System.out.println(fileName);
        String saveName = UUID.randomUUID().toString().replace("-", "").substring(0,5) + fileName;
        String savedPath = request.getServletContext().getRealPath("/") + "resumes/";
        String saveUrl  = request.getContextPath() + "/resumes/";

        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHH");
        String ymd = sdf.format(new Date());
        savedPath += ymd + "/";
        saveUrl += ymd + "/";


        File saveDir = new File(savedPath);
        if (!saveDir.exists()) {
            saveDir.mkdirs();
        }
        File saveFile = new File(savedPath, saveName);
        Map<String,Object> map = new HashMap<>();
        String url = saveUrl+saveName;
        String name = fileName;
        try{
            file.transferTo(saveFile);
            map.put("flag","200");
            map.put("url",url);
            map.put("name",name);

        } catch (IOException e) {
            e.printStackTrace();
            map.put("flag","100");
        }
        return map;
    }




    public Map<String,Object> addNewsFile(MultipartFile[] files, HttpServletRequest request ){
        StringBuilder url = new StringBuilder();
        StringBuilder name = new StringBuilder();
        Map<String,Object> map = new HashMap<>();
        System.out.println(files.length);
        try {
            int i=0;
            if(files.length!=0) {
                for (MultipartFile file : files) {
                    String fileName = file.getOriginalFilename();
                    System.out.println(fileName);
                    String saveName = UUID.randomUUID().toString().replace("-", "").substring(0,5) + fileName;
                    String savedPath = request.getServletContext().getRealPath("/") + "uploadFiles/";
                    String saveUrl  = request.getContextPath() + "/uploadFiles/";

                    SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHH");
                    String ymd = sdf.format(new Date());
                    savedPath += ymd + "/";
                    saveUrl += ymd + "/";


                    File saveDir = new File(savedPath);
                    if (!saveDir.exists()) {
                        saveDir.mkdirs();
                    }
                    File saveFile = new File(savedPath, saveName);
                    if (i!=0) {
                        url.append(",");
                        name.append(",");
                    }
                    //System.out.println(saveFile);
                    url.append(saveUrl);
                    url.append(saveName);
                    name.append(fileName);
                    file.transferTo(saveFile);
                    i++;
                }
            }

            if(i!=0) {
                map.put("url", url.toString());
                map.put("name", name.toString());
                map.put("flag", "200");
                System.out.println("i:"+i+"url："+ url.toString()+"name："+ name.toString());
                return map;
            }
        } catch (IOException e) {
            e.printStackTrace();
            map.put("flag","100");
        }

        return map;

    }


    public void downFile(String url, HttpServletRequest request, HttpServletResponse response) throws IOException {
        ResponseToHtml toHtml = new ResponseToHtml();
        if("".equals(url)){
            toHtml.sendExceptionToHtml(response,"文件下载参数发生错误!");
            return;
        }
        String basePath = request.getServletContext().getRealPath("/");
        url=url.substring(1);//去掉第一个/
        String realPath = basePath+url;

        String names[] =url.split("/");
        String name = names[names.length-1].substring(5);
        File file = new File(realPath);
        if(!file.exists()){
            toHtml.sendExceptionToHtml(response,"下载的文件不存在!");
            return;
        }

        System.out.println(realPath);
        InputStream ins=new FileInputStream(realPath);//构造一个读取文件的IO流对象
        BufferedInputStream bins=new BufferedInputStream(ins);//放到缓冲流里面
        OutputStream outs=response.getOutputStream();//获取文件输出IO流
        BufferedOutputStream bouts=new BufferedOutputStream(outs);
        response.setContentType("application/x-download");//设置response内容的类型
        response.setHeader("Content-disposition","attachment;filename="+ URLEncoder.encode(name, "UTF-8"));//设置头部信息
        int bytesRead = 0;
        byte[] buffer = new byte[8192];
        //开始向网络传输文件流
        while ((bytesRead = bins.read(buffer, 0, 8192)) != -1) {
            bouts.write(buffer, 0, bytesRead);
        }
        bouts.flush();//这里一定要调用flush()方法
        ins.close();
        bins.close();
        outs.close();
        bouts.close();

    }


    /**
     * 文件下载
     * @param urls
     * @param request
     * @param response
     */
    public void  downResume(List<String> urls, HttpServletRequest request, HttpServletResponse response) {

        if(CollectionUtils.isEmpty(urls)){
            return;
        }
        String zipFilePath=null;
        try {
//            String path="123"; //= fileUploadMapper.selectByPrimaryKey(id).getUrl();
//            String[] paths = path.split(",");
            List<String> files = new ArrayList<>();
            String basePath=request.getServletContext().getRealPath("/");
            for(String p : urls){
                p=basePath+p;
//            File file = new File(p);
                files.add(p);
            }

            //IO流实现下载的功能
            response.setCharacterEncoding("UTF-8");//设置编码符号
            response.setContentType("application/octet-stream;charset=UTF-8");//设置下载内容类型
            OutputStream out = response.getOutputStream();//创建页面返回方式为输出流，会自动弹出下载框


            //创建压缩文件需要的空的zip包
            String zipBasePath = request.getSession().getServletContext().getRealPath("/resumes/zip");
            String zipName = "downLoad.zip";
            zipFilePath=zipBasePath+File.separator+zipName;

            //压缩文件
            File zip = new File(zipFilePath);
            if(!zip.exists()){
                zip.createNewFile();
            }

            //创建zip的文件输出流
            ZipOutputStream zos = new ZipOutputStream(new FileOutputStream(zip));
            this.zipFile(zipBasePath,zipName,zipFilePath,files,zos);
            zos.close();
            //设置下载的压缩文件名称
            response.setHeader("Content-disposition","attachment;filename="+zipName);

            //将打包后的文件写到客户端，输出的方法同上，使用缓冲流输出
            BufferedInputStream bis = new BufferedInputStream(new FileInputStream(zipFilePath));
            byte[] buff = new byte[bis.available()];
            bis.read(buff);
            bis.close();
            out.write(buff);//输出数据文件
            out.flush();//释放缓存
            out.close();//关闭输出流





        } catch (IOException e) {
            e.printStackTrace();
            //response.reset();

        }finally {
            File file = new File(zipFilePath);
            if(file.exists()){
                file.delete();
            }
        }
    }

    /**
     * 压缩文件
     * @param zipBasePath 临时压缩文件基础路径
     * @param zipName   临时压缩文件名称
     * @param zipFilePath   临时压缩文件完整路径
     * @param filePaths 需要压缩的文件路径集合
     * @param zos
     * @return
     */
    private String zipFile(String zipBasePath, String zipName, String zipFilePath, List<String> filePaths, ZipOutputStream zos) throws IOException {
//    private String zipFile(List<String> filePaths,ZipOutputStream zos) throws IOException {
        //循环解读文件路径集合，获取每一个文件的路径
        for(String filePath : filePaths){
            File inputFile = new File(filePath);
            if(inputFile.exists()){
                //创建输入流读取文件
                BufferedInputStream bis = new BufferedInputStream(new FileInputStream(inputFile));
                //将文件写入zip内，即将文件进行打包
                zos.putNextEntry(new ZipEntry(inputFile.getName()));

                //写入文件的方法
                int size = 0;
                byte[] buffer = new byte[bis.available()];//设置读取数据缓存大小
                while ((size=bis.read(buffer))>0){
                    zos.write(buffer,0,size);
                }
                //关闭输入输出流
                zos.closeEntry();
                bis.close();
            }
        }
        return null;
    }


    //导出 Excel
    public void getEmploymentExcel (HttpServletRequest req, Employment employment, HttpServletResponse resp)
            throws IOException {
        // TODO Auto-generated method stub
//        stubCommodityService commoNameService = new CommodityServiceImpl();
//
//        String currentPageStr = req.getParameter("curPage");//当前页
//        String pageSizeStr = req.getParameter("pageSize");//每一页的数据条数
//        String names = req.getParameter("cxuserName");//获取界面的用户名称
//
//        //转乱码
////        String commoName = Tools.ISOtoUTF8(names);
////
////        int totalAll = commoNameService.getTotalRow(commoName);//获取总行数
//
//        int currentPage = 1;
//        int pageSize = 10;
//
//        if(currentPageStr != null && Tools.isNum(currentPageStr)){
//            currentPage = Integer.parseInt(currentPageStr);
//        }
//        if(pageSizeStr != null && Tools.isNum(pageSizeStr)){
//            pageSize = Integer.parseInt(pageSizeStr);
//        }
//
//        int startIndex = (currentPage-1) * pageSize;

        //List<commoditytb> TabCommodity = commoNameService.findAll(startIndex,pageSize,commoName);

        List<Employment> list = employmentMapper.searchByCondition(employment);

        if(CollectionUtils.isEmpty(list)){
            return;
        }
        // 第一步，创建一个webbook，对应一个Excel文件
        HSSFWorkbook wb = new HSSFWorkbook();
        // 第二步，在webbook中添加一个sheet,对应Excel文件中的sheet
        HSSFSheet sheet = wb.createSheet("学生就业表");
        // 第三步，在sheet中添加表头第0行,注意老版本poi对Excel的行数列数有限制short
        HSSFRow row = sheet.createRow((int) 0);
        // 第四步，创建单元格，并设置值表头 设置表头居中
        HSSFCellStyle style = wb.createCellStyle();
        /*style.setAlignment(HSSFCellStyle.ALIGN_CENTER); // 创建一个居中格式*/

        HSSFCell cell = row.createCell(0);
        cell.setCellValue("学号");
        cell.setCellStyle(style);
        cell = row.createCell(1);
        cell.setCellValue("姓名");
        cell.setCellStyle(style);
        cell = row.createCell(2);
        cell.setCellValue("学院");
        cell.setCellStyle(style);
        cell = row.createCell(3);
        cell.setCellValue("专业");
        cell.setCellStyle(style);
        cell = row.createCell(4);
        cell.setCellValue("企业名称");
        cell.setCellStyle(style);
        cell = row.createCell(5);
        cell.setCellValue("单位性质");
        cell.setCellStyle(style);
        cell = row.createCell(6);
        cell.setCellValue("所属行业");
        cell.setCellStyle(style);
        cell = row.createCell(7);
        cell.setCellValue("所在省份");
        cell.setCellStyle(style);
        cell = row.createCell(8);
        cell.setCellValue("所在城市");
        cell.setCellStyle(style);
        cell = row.createCell(9);
        cell.setCellValue("详细地址");
        cell.setCellStyle(style);
        cell = row.createCell(10);
        cell.setCellValue("岗位名称");
        cell.setCellStyle(style);
        cell = row.createCell(11);
        cell.setCellValue("专业是否对口");
        cell.setCellStyle(style);
        cell = row.createCell(12);
        cell.setCellValue("签约日期");
        cell.setCellStyle(style);
        cell = row.createCell(13);
        cell.setCellValue("企业联系人");
        cell.setCellStyle(style);
        cell = row.createCell(14);
        cell.setCellValue("联系人手机");
        cell.setCellStyle(style);
        cell = row.createCell(15);
        cell.setCellValue("联系人电话");
        cell.setCellStyle(style);
        cell = row.createCell(16);
        cell.setCellValue("联系人邮箱");
        cell.setCellStyle(style);
        cell = row.createCell(17);
        cell.setCellValue("企业邮编");
        cell.setCellStyle(style);
        cell = row.createCell(18);
        cell.setCellValue("工作薪酬");
        cell.setCellStyle(style);
        cell = row.createCell(19);
        cell.setCellValue("创建时间");
        cell.setCellStyle(style);
        cell = row.createCell(20);
        cell.setCellValue("审核状态");
        cell.setCellStyle(style);
        cell = row.createCell(21);
        cell.setCellValue("审核时间");
        cell.setCellStyle(style);
        cell = row.createCell(22);
        cell.setCellValue("审核人员");
        cell.setCellStyle(style);
        cell = row.createCell(23);
        cell.setCellValue("原因说明");
        cell.setCellStyle(style);






        for (int i = 0; i < list.size(); i++)
        {
            row = sheet.createRow((int) i + 1);
            Employment employment1 = (Employment)list.get(i);
            // 第五步，创建单元格，并设置值

            row.createCell(0).setCellValue(employment1.getStudentId());//商品名称
            row.createCell(1).setCellValue(employment1.getStudentName());//商品类型
            row.createCell(2).setCellValue((employment1.getStudentDept()));//销售价格 setSellPrice
            row.createCell(3).setCellValue((employment1.getStudentMajor()));//所获积分
            row.createCell(4).setCellValue(employment1.getCompanyName());//库存数量
            row.createCell(5).setCellValue(employment1.getCompanyProperty());//生产许可证
            row.createCell(6).setCellValue(employment1.getCompanyCategory());//厂名
            row.createCell(7).setCellValue(employment1.getCompanyProvinces());//厂址
            row.createCell(8).setCellValue(employment1.getCompanyCity());//厂家联系电话
            row.createCell(9).setCellValue(employment1.getCompanyAddress());//配料表
            row.createCell(10).setCellValue(employment1.getJobName());//保质期
            String jobCounterpart=null;
            if(employment1.getJobCounterpart()==1){
                jobCounterpart="是";
            }else{
                jobCounterpart="否";
            }
            row.createCell(11).setCellValue(jobCounterpart);//净含量
            row.createCell(12).setCellValue(employment1.getSignTime());//包装方式
            row.createCell(13).setCellValue(employment1.getCompanyMan());//品牌
            row.createCell(14).setCellValue(employment1.getManPhone());//存储方式
            row.createCell(15).setCellValue(employment1.getManTelephone());//下架状态
            row.createCell(16).setCellValue(employment1.getManEmail());//商品编号

            row.createCell(17).setCellValue(employment1.getCompanyPostcode());//包装方式
            row.createCell(18).setCellValue(employment1.getMoney());//品牌
            row.createCell(19).setCellValue(employment1.getCreateTime());//存储方式
            String status=null;
            if(employment1.getStatus()==0){
                status="待审核";
            }else if(employment1.getStatus()==1){
                status="通过";
            }else{
                status="不通过";
            }
            row.createCell(20).setCellValue(status);//下架状态
            row.createCell(21).setCellValue(employment1.getChaeckTime());//商品编号
            row.createCell(22).setCellValue(employment1.getCheckMan());//包装方式
            row.createCell(23).setCellValue(employment1.getRemark());//品牌
        }
        // 第六步，将文件存到指定位置
        try
        {
            Date date = new Date();
            String str = new SimpleDateFormat("yyyy-MM-dd-HH-mm-ss-SSSS").format(date); //需要文件导出带有时间的，请把时间拼接到/杠后面去
//            FileOutputStream fout = new FileOutputStream("C:\\Users\\夜\\Desktop\\商品图片/" + str + "Table.xls");
//            wb.write(fout);
//            fout.close();
            OutputStream out = resp.getOutputStream();
//            workbook.write(out);
//            out.close();

            BufferedOutputStream bouts=new BufferedOutputStream(out);
            resp.setContentType("application/x-download");//设置response内容的类型
            resp.setHeader("Content-disposition","attachment;filename="+ URLEncoder.encode(str+"学生就业表.xls", "UTF-8"));//设置头部信息
            wb.write(out);
            out.close();
            bouts.close();
        } catch (IOException e) {
           throw new IOException(e.getMessage());
        }
    }

    //导出 Excel
    public void getStudentExcel (HttpServletRequest req, Student student, HttpServletResponse resp)
            throws IOException {

        List<Student> list = studentService.searchByCondition(student);

        if(CollectionUtils.isEmpty(list)){
            return;
        }
        // 第一步，创建一个webbook，对应一个Excel文件
        HSSFWorkbook wb = new HSSFWorkbook();
        // 第二步，在webbook中添加一个sheet,对应Excel文件中的sheet
        HSSFSheet sheet = wb.createSheet("学生信息表");
        // 第三步，在sheet中添加表头第0行,注意老版本poi对Excel的行数列数有限制short
        HSSFRow row = sheet.createRow((int) 0);
        // 第四步，创建单元格，并设置值表头 设置表头居中
        HSSFCellStyle style = wb.createCellStyle();
        /*style.setAlignment(HSSFCellStyle.ALIGN_CENTER); // 创建一个居中格式*/

        HSSFCell cell = row.createCell(0);
        cell.setCellValue("学号");
        cell.setCellStyle(style);
        cell = row.createCell(1);
        cell.setCellValue("姓名");
        cell.setCellStyle(style);
        cell = row.createCell(2);
        cell.setCellValue("性别");
        cell.setCellStyle(style);
        cell = row.createCell(3);
        cell.setCellValue("身份证号");
        cell.setCellStyle(style);
        cell = row.createCell(4);
        cell.setCellValue("出生日期");
        cell.setCellStyle(style);
        cell = row.createCell(5);
        cell.setCellValue("政治面貌");
        cell.setCellStyle(style);
        cell = row.createCell(6);
        cell.setCellValue("民族");
        cell.setCellStyle(style);
        cell = row.createCell(7);
        cell.setCellValue("生源地");
        cell.setCellStyle(style);
        cell = row.createCell(8);
        cell.setCellValue("手机号码");
        cell.setCellStyle(style);
        cell = row.createCell(9);
        cell.setCellValue("电子邮箱");
        cell.setCellStyle(style);
        cell = row.createCell(10);
        cell.setCellValue("家庭地址");
        cell.setCellStyle(style);
        cell = row.createCell(11);
        cell.setCellValue("家庭邮编");
        cell.setCellStyle(style);
        cell = row.createCell(12);
        cell.setCellValue("学校名称");
        cell.setCellStyle(style);
        cell = row.createCell(13);
        cell.setCellValue("校区");
        cell.setCellStyle(style);
        cell = row.createCell(14);
        cell.setCellValue("学院");
        cell.setCellStyle(style);
        cell = row.createCell(15);
        cell.setCellValue("专业");
        cell.setCellStyle(style);
        cell = row.createCell(16);
        cell.setCellValue("班级");
        cell.setCellStyle(style);
        cell = row.createCell(17);
        cell.setCellValue("学历");
        cell.setCellStyle(style);
        cell = row.createCell(18);
        cell.setCellValue("学制");
        cell.setCellStyle(style);
        cell = row.createCell(19);
        cell.setCellValue("创建时间");
        cell.setCellStyle(style);
        cell = row.createCell(20);
        cell.setCellValue("审核状态");
        cell.setCellStyle(style);
        cell = row.createCell(21);
        cell.setCellValue("审核时间");
        cell.setCellStyle(style);
        cell = row.createCell(22);
        cell.setCellValue("审核人员");
        cell.setCellStyle(style);
        cell = row.createCell(23);
        cell.setCellValue("原因说明");
        cell.setCellStyle(style);
        for (int i = 0; i < list.size(); i++)
        {
            row = sheet.createRow((int) i + 1);
            Student student1 = (Student)list.get(i);
            // 第五步，创建单元格，并设置值

            row.createCell(0).setCellValue(student1.getXh());//商品名称
            row.createCell(1).setCellValue(student1.getXm());//商品类型
            String xb = null;
            if(student1.getXb()==1){
                xb="男";
            }else{
                xb="女";
            }
            row.createCell(2).setCellValue(xb);//销售价格 setSellPrice
            row.createCell(3).setCellValue((student1.getSfzh()));//所获积分
            row.createCell(4).setCellValue(student1.getCsrq());//库存数量
            row.createCell(5).setCellValue(student1.getZzmm());//生产许可证
            row.createCell(6).setCellValue(student1.getMz());//厂名
            row.createCell(7).setCellValue(student1.getSyd());//厂址
            row.createCell(8).setCellValue(student1.getSjhm());//厂家联系电话
            row.createCell(9).setCellValue(student1.getDzyx());//配料表
            row.createCell(10).setCellValue(student1.getJtdz());//保质期
            row.createCell(11).setCellValue(student1.getJtyb());//净含量
            row.createCell(12).setCellValue(student1.getXxmc());//包装方式
            row.createCell(13).setCellValue(student1.getXq());//品牌
            row.createCell(14).setCellValue(student1.getXy());//存储方式
            row.createCell(15).setCellValue(student1.getZy());//下架状态
            row.createCell(16).setCellValue(student1.getBj());//商品编号

            row.createCell(17).setCellValue(student1.getXl());//包装方式
            row.createCell(18).setCellValue(student1.getXz());//品牌
            row.createCell(19).setCellValue(student1.getCreateTime());//存储方式
            String status=null;
            if(student1.getStatus()==0){
                status="待审核";
            }else if(student1.getStatus()==1){
                status="通过";
            }else{
                status="不通过";
            }
            row.createCell(20).setCellValue(status);//下架状态
            row.createCell(21).setCellValue(student1.getEnsureTime());//商品编号
            row.createCell(22).setCellValue(student1.getConfirmName());//包装方式
            row.createCell(23).setCellValue(student1.getRemark());//品牌
        }
        // 第六步，将文件存到指定位置
        try
        {
            Date date = new Date();
            String str = new SimpleDateFormat("yyyy-MM-dd-HH-mm-ss-SSSS").format(date); //需要文件导出带有时间的，请把时间拼接到/杠后面去
//            FileOutputStream fout = new FileOutputStream("C:\\Users\\夜\\Desktop\\商品图片/" + str + "Table.xls");
//            wb.write(fout);
//            fout.close();
            OutputStream out = resp.getOutputStream();
//            workbook.write(out);
//            out.close();

            BufferedOutputStream bouts=new BufferedOutputStream(out);
            resp.setContentType("application/x-download");//设置response内容的类型
            resp.setHeader("Content-disposition","attachment;filename="+ URLEncoder.encode(str+"学生信息表.xls", "UTF-8"));//设置头部信息
            wb.write(out);
            out.close();
            bouts.close();
        } catch (IOException e) {
            throw new IOException(e.getMessage());
        }
    }


    //导出 Excel
    public void getUserExcel(HttpServletRequest req, User user, HttpServletResponse resp)
            throws IOException {

        List<User> list = userService.searchByCondition(user);

        if(CollectionUtils.isEmpty(list)){
            return;
        }

        // 第一步，创建一个webbook，对应一个Excel文件
        HSSFWorkbook wb = new HSSFWorkbook();
        // 第二步，在webbook中添加一个sheet,对应Excel文件中的sheet
        HSSFSheet sheet = wb.createSheet("用户信息表");
        // 第三步，在sheet中添加表头第0行,注意老版本poi对Excel的行数列数有限制short
        HSSFRow row = sheet.createRow((int) 0);
        // 第四步，创建单元格，并设置值表头 设置表头居中
        HSSFCellStyle style = wb.createCellStyle();
        /*style.setAlignment(HSSFCellStyle.ALIGN_CENTER); // 创建一个居中格式*/

        HSSFCell cell = row.createCell(0);
        cell.setCellValue("用户账号");
        cell.setCellStyle(style);
        cell = row.createCell(1);
        cell.setCellValue("用户单位");
        cell.setCellStyle(style);
        cell = row.createCell(2);
        cell.setCellValue("用户姓名");
        cell.setCellStyle(style);
        cell = row.createCell(3);
        cell.setCellValue("用户角色");
        cell.setCellStyle(style);
        cell = row.createCell(4);
        cell.setCellValue("用户状态");
        cell.setCellStyle(style);
        cell = row.createCell(5);
        cell.setCellValue("备注");
        cell.setCellStyle(style);


        for (int i = 0; i < list.size(); i++)
        {
            row = sheet.createRow((int) i + 1);
            User user1 = (User) list.get(i);
            // 第五步，创建单元格，并设置值

            row.createCell(0).setCellValue(user1.getId());//商品名称
            row.createCell(1).setCellValue(user1.getUserDept());//商品类型

            row.createCell(2).setCellValue(user1.getUserName());//销售价格 setSellPrice
            String role = null;
            if(user1.getRole()==1){
                role="学生";
            } else if(user1.getRole()==2){
                role="教师";
            }else if(user1.getRole()==3){
                role="企业";
            }else {
                role="管理员";
            }
            row.createCell(3).setCellValue(role);//所获积分
            String status=null;
            if(user1.getStatus()==0){
                status="待审核";
            }else if(user1.getStatus()==1){
                status="通过";
            }else{
                status="不通过";
            }
            row.createCell(4).setCellValue(status);//库存数量
            row.createCell(5).setCellValue(user1.getBackup());//生产许可证
        }
        // 第六步，将文件存到指定位置
        try
        {
            Date date = new Date();
            String str = new SimpleDateFormat("yyyy-MM-dd-HH-mm-ss-SSSS").format(date); //需要文件导出带有时间的，请把时间拼接到/杠后面去
            OutputStream out = resp.getOutputStream();


            BufferedOutputStream bouts=new BufferedOutputStream(out);
            resp.setContentType("application/x-download");//设置response内容的类型
            resp.setHeader("Content-disposition","attachment;filename="+ URLEncoder.encode(str+"用户信息表.xls", "UTF-8"));//设置头部信息
            wb.write(out);
            out.close();
            bouts.close();
        } catch (IOException e) {
            throw new IOException(e.getMessage());
        }
    }

    //导出 Excel
    public void getCompanyExcel (HttpServletRequest req, Company company, HttpServletResponse resp)
            throws IOException {

        List<Company> list = companyService.searchCompanyByCondition(company);

        if(CollectionUtils.isEmpty(list)){
            return;
        }
        // 第一步，创建一个webbook，对应一个Excel文件
        HSSFWorkbook wb = new HSSFWorkbook();
        // 第二步，在webbook中添加一个sheet,对应Excel文件中的sheet
        HSSFSheet sheet = wb.createSheet("企业信息表");
        // 第三步，在sheet中添加表头第0行,注意老版本poi对Excel的行数列数有限制short
        HSSFRow row = sheet.createRow((int) 0);
        // 第四步，创建单元格，并设置值表头 设置表头居中
        HSSFCellStyle style = wb.createCellStyle();
        /*style.setAlignment(HSSFCellStyle.ALIGN_CENTER); // 创建一个居中格式*/

        HSSFCell cell = row.createCell(0);
        cell.setCellValue("企业账号");
        cell.setCellStyle(style);
        cell = row.createCell(1);
        cell.setCellValue("企业名称");
        cell.setCellStyle(style);
        cell = row.createCell(2);
        cell.setCellValue("用户姓名");
        cell.setCellStyle(style);
        cell = row.createCell(3);
        cell.setCellValue("手机号码");
        cell.setCellStyle(style);
        cell = row.createCell(4);
        cell.setCellValue("所在省份");
        cell.setCellStyle(style);
        cell = row.createCell(5);
        cell.setCellValue("所在城市");
        cell.setCellStyle(style);
        cell = row.createCell(6);
        cell.setCellValue("详细地址");
        cell.setCellStyle(style);
        cell = row.createCell(7);
        cell.setCellValue("固定电话");
        cell.setCellStyle(style);
        cell = row.createCell(8);
        cell.setCellValue("招聘邮箱");
        cell.setCellStyle(style);
        cell = row.createCell(9);
        cell.setCellValue("单位性质");
        cell.setCellStyle(style);
        cell = row.createCell(10);
        cell.setCellValue("所属行业");
        cell.setCellStyle(style);
        cell = row.createCell(11);
        cell.setCellValue("单位规模");
        cell.setCellStyle(style);
        cell = row.createCell(12);
        cell.setCellValue("注册资金");
        cell.setCellStyle(style);
        cell = row.createCell(13);
        cell.setCellValue("审核状态");
        cell.setCellStyle(style);
        cell = row.createCell(14);
        cell.setCellValue("创建时间");
        cell.setCellStyle(style);
        cell = row.createCell(15);
        cell.setCellValue("修改时间");
        cell.setCellStyle(style);
        cell = row.createCell(16);
        cell.setCellValue("备注");
        cell.setCellStyle(style);

        for (int i = 0; i < list.size(); i++)
        {
            row = sheet.createRow((int) i + 1);
            Company company1 = (Company)list.get(i);
            // 第五步，创建单元格，并设置值

            row.createCell(0).setCellValue(company1.getCompanyEmail());//商品名称
            row.createCell(1).setCellValue(company1.getCompanyName());//商品类型

            row.createCell(2).setCellValue(company1.getUserName());//销售价格 setSellPrice
            row.createCell(3).setCellValue(company1.getPhone());//所获积分
            row.createCell(4).setCellValue(company1.getProvinces());//库存数量
            row.createCell(5).setCellValue(company1.getCity());//生产许可证
            row.createCell(6).setCellValue(company1.getAddress());//厂名
            row.createCell(7).setCellValue(company1.getTelephone());//厂址
            row.createCell(8).setCellValue(company1.getJobEmail());//厂家联系电话
            row.createCell(9).setCellValue(company1.getCompanyProperty());//配料表
            row.createCell(10).setCellValue(company1.getCompanyCategory());//保质期
            row.createCell(11).setCellValue(company1.getScale());//净含量
            row.createCell(12).setCellValue(company1.getRegisterMoney());//包装方式

            String status=null;
            if(company1.getStatus()==0){
                status="待审核";
            }else if(company1.getStatus()==1){
                status="通过";
            }else{
                status="不通过";
            }
            row.createCell(13).setCellValue(status);//品牌
            row.createCell(14).setCellValue(company1.getCreateTime());//存储方式
            row.createCell(15).setCellValue(company1.getUpdateTime());//下架状态
            row.createCell(16).setCellValue(company1.getBackup());//商品编号


        }
        // 第六步，将文件存到指定位置
        try
        {
            Date date = new Date();
            String str = new SimpleDateFormat("yyyy-MM-dd-HH-mm-ss-SSSS").format(date); //需要文件导出带有时间的，请把时间拼接到/杠后面去
//            FileOutputStream fout = new FileOutputStream("C:\\Users\\夜\\Desktop\\商品图片/" + str + "Table.xls");
//            wb.write(fout);
//            fout.close();
            OutputStream out = resp.getOutputStream();
//            workbook.write(out);
//            out.close();

            BufferedOutputStream bouts=new BufferedOutputStream(out);
            resp.setContentType("application/x-download");//设置response内容的类型
            resp.setHeader("Content-disposition","attachment;filename="+ URLEncoder.encode(str+"企业信息表.xls", "UTF-8"));//设置头部信息
            wb.write(out);
            out.close();
            bouts.close();
        } catch (IOException e) {
            throw new IOException(e.getMessage());
        }
    }






}
