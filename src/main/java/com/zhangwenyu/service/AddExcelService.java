package com.zhangwenyu.service;

import com.zhangwenyu.bean.User;
import com.zhangwenyu.bean.UserExample;
import com.zhangwenyu.dao.UserMapper;
import jxl.Cell;

import jxl.Sheet;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @Author: Zhang Wenyu
 * @Date: 2020-04-25 11:34
 * @Version: 1.0
 */
@Service
public class AddExcelService {

    @Autowired(required = false)
    private UserMapper userMapper;

    public Map<String,Object> addUserFromExcel(File file)throws Exception{
        try {
            Map<String,Object> map =new HashMap<>();
            jxl.Workbook readwb = null;
            InputStream io = new FileInputStream(file.getAbsoluteFile());
            readwb = jxl.Workbook.getWorkbook(io);
            Sheet readsheet =  readwb.getSheet(0);
            int rsColumns = readsheet.getColumns();  //获取表格列数
            if (rsColumns < 7) {
                map.put("flag","100");
                map.put("info","表格数据不合规范，列数应大于或等于7列");
                return map;
            }
            int rsRows = readsheet.getRows();  //获取表格行数
            System.out.println(rsRows);
            List<User> list = new ArrayList<>();
            List<String> listId = new ArrayList<>();
            for (int i = 1; i < rsRows; i++) {
                User user = new User();
                user.setId(readsheet.getCell(0, i).getContents());
                listId.add(user.getId());
                user.setUserDept(readsheet.getCell(1, i).getContents());
                user.setUserName(readsheet.getCell(2, i).getContents());
                user.setPassword(readsheet.getCell(3, i).getContents());
                user.setRole(Integer.valueOf(readsheet.getCell(4, i).getContents()));
                user.setStatus(Integer.valueOf(readsheet.getCell(5, i).getContents()));
                user.setBackup(readsheet.getCell(6,i).getContents());
                list.add(user);
            }
            readwb.close();
            io.close();
            UserExample userExample = new UserExample();
            UserExample.Criteria criteria = userExample.createCriteria();
            criteria.andIdIn(listId);
            List<User> userList = userMapper.selectByExample(userExample);
            if (!CollectionUtils.isEmpty(userList)) {
                map.put("flag","100");
                map.put("info","学号："+userList.get(0).getId()+"已存在，请删除后再导入");
                return map;
            }
            System.out.println("成功了");
            for (User user : list) {
                userMapper.insert(user);
            }
            System.out.println("成功了");
            map.put("flag","200");
            map.put("info","导入成功");
            return map;
        }catch (Exception e){
            throw  new Exception(e.getMessage());
        }
//        System.out.println(columnList);
//        System.out.println(valueList);
//
//
//
//
//        String[] name_String = new String[columnList.size()];
//        String[] value_String = new String[columnList.size()];
//
//        for (int i = 0; i < columnList.size(); i++) {
//            name_String[i] = columnList.get(i);
//            value_String[i] = valueList.get(i);
////			System.out.println("<string name=" + "\"" + name_String[i] + "\">" + value_String[i] +  "</string>");
//        }
    }



}
