package com.zhangwenyu.utils;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Utils {


    public String DateToString(Date currentTime){
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String dateString = formatter.format(currentTime);
        return dateString;
    }

    public String DateToString2(Date currentTime){
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        String dateString = formatter.format(currentTime);
        return dateString;
    }
}
