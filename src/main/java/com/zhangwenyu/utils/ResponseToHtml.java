package com.zhangwenyu.utils;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * @Author: Zhang Wenyu
 * @Date: 2020-04-12 21:42
 * @Version: 1.0
 */
public class ResponseToHtml {

    public void sendExceptionToHtml(HttpServletResponse response,String msg) throws IOException {
        response.setContentType("text/html; charset=utf-8");
        response.setHeader("Content-disposition", "inline");
        response.getWriter().print("<HTML> <BODY> <P>"+msg+"</P> </BODY> </HTML>");
        response.getWriter().close();
    }
}
