<%--
  Created by IntelliJ IDEA.
  User: zhangwenyu
  Date: 2019/8/4
  Time: 17:32
  To change this template use File | Settings | File Templates.
--%>
<%
    request.setCharacterEncoding("utf-8");
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>毕业生信息平台</title>
    <base href="<%=basePath%>">
    <link rel="icon" href="<%request.getContextPath();%>/static/favicon.ico" type="image/x-icon">
    <script type="text/javascript" src="<%request.getContextPath();%>/static/js/jquery-1.12.4.min.js"></script>
    <link href="<%request.getContextPath();%>/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="<%request.getContextPath();%>/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
    <link rel='stylesheet' href="<%request.getContextPath();%>/static/time/my.css" />

    <style type="text/css">
        .line-limit-length {
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap; //文本不换行，这样超出一行的部分被截取，显示...
        }
    </style>
</head>
<body>

<header>
    <nav class="navbar navbar-default " role="navigation">
        <div class="navbar container-fluid navbar-default  navbar-fixed-top">
            <div class="navbar-header">
                <h4 class="logo navbar-text "><a  title="毕业生信息平台">毕业生信息平台</a></h4>
            </div>

            <div id="login-info">
                <c:choose>
                    <c:when test="${not empty sessionScope.get('currentUser')}">
                        <ul class="nav navbar-nav navbar-right">
                            <li title="个人中心" class="active"><a href="<%request.getContextPath();%>/returnToMyInfo"><span
                                    class="glyphicon glyphicon-user"></span>${currentUser.id}</a>
                            </li>
                            <li title="退出"><a href="<%request.getContextPath();%>/exit"><span class="glyphicon glyphicon-log-in"></span>退出</a></li>
                        </ul>
                    </c:when>
                    <c:otherwise>
                        <ul class="nav navbar-nav navbar-right">
                            <li title="企业注册"><a href="register.jsp"><span class="glyphicon glyphicon-user"></span> 企业注册</a>
                            </li>
                            <li title="登录"><a href="login.jsp"><span class="glyphicon glyphicon-log-in"></span> 登录</a>
                            </li>
                        </ul>
                    </c:otherwise>
                </c:choose>
            </div>


            <div class="navbar-collapse collapse" style="text-align: center">
                <ul class="nav navbar-nav nav-pills" style="display: inline-block;float: none">
                    <li title="首页" ><a href="#">首页</a></li>
                    <li title="宣讲会"><a href="preach.jsp">宣讲会</a></li>
                    <li title="在线招聘"><a href="job.jsp">在线招聘</a></li>
                    <li title="公告栏" class="active"><a>公告栏</a></li>
                </ul>
            </div>
        </div>
    </nav>
</header>
<section class="panel panel-default container">
    <div class="row">

        <div class="col-md-3">
            <ul class="clearfix">
                <h3>公告栏</h3>
                <li style="display:block">
                    <a class="list-group-item active" title="查询岗位" >搜索公告</a>
                </li>
            </ul>
            <ul class="clearfix">
                <li style="display:block">
                    <div id="calendar" class="calendar"></div>
                    <script  type="text/javascript" src="<%request.getContextPath();%>/static/time/can.js"></script>
                </li>
            </ul>
        </div>

        <div class="col-md-9">

            <div>
                <h3>全部公告</h3>
            </div>

            <div class="panel panel-default">
                <div class="container-fluid ">
                    <div style="margin: 20px;">

                        <form class=" form-inline"  id="form-search">
                            <span>&nbsp &nbsp &nbsp &nbsp &nbsp </span>
                            <input type="text" class="form-control" placeholder="公告名称" name="title" id="title">
                            <span>&nbsp &nbsp </span>
                            <a id="search_btn" onclick="searchNews()" class="btn btn-info">搜索</a>
                            <span id="test"></span>
                        </form>

                        <div class="panel panel-default">
                            <ul class="list-group" id="show_new">

                            </ul>
                        </div>
                        <div class="row">
                            <div class="col-md-6" id="page_info_area" >
                            </div>
                            <div class="col-md-6" id="page_nav_area">
                            </div>
                        </div>
                    </div>
                </div>
                <%--<%@ include file="pagination.jsp" %>--%>
            </div>
        </div>
    </div>
</section>
<script type="text/javascript">

    $(function () {
        show_news(1);
    });

    function show_news(page) {
        var data="backup=1&rows=5&page="+page;
        var title = $("#title").val();
        if(title!=null&&title!=""){
            data+="&title="+title;
        }

        $.ajax({
            url:"<%request.getContextPath();%>/news/searchByCondition",
            data:data,
            type:"GET",
            success:function (result) {
                console.log(result);
                $("#show_new").empty();
                $("#page_info_area").empty();
                $("#page_nav_area").empty();
                if(result.flag=="200") {//查询成功
                    //alert("111");

                    build_new_table(result);
                    build_page_info(result);
                    build_page_nav(result);
                    // $("#test").append("共"+result.extend.tipes+"条记录！")
                }else{

                    var div=$("<div style='color: grey' align='center'></div>").append("暂无记录");
                    div.appendTo("#show_new");
                }

            }

        });
    }

    function searchNews() {
        show_news(1);
    }


    function build_new_table(result) {
        $("#show_new").empty();
        var news = result.pageInfo.list;
        $.each(news,function (index,item) {
            var div = $("<div style=\"height: 50px\" ></div>").addClass("list-group-item");
            var div1 = $("<div style=\"width: 70%;float: left\"></div>");
            var p = $("<p></p>").addClass("line-limit-length");
            var divA = $("<a href=\'<%request.getContextPath();%>bulletinDetails.jsp?id="+item.newsId+"\' style=\"color: #6a6a6a\"></a>").append(item.title);
            p.append(divA);
            div1.append(p);
            var div2 = $("<div style=\"font-size: 15px; width: 20%;float: right;\"></div>");
            var div21 = $("<span style=\"color: firebrick\"></span>").addClass("glyphicon glyphicon-time").append(item.newsTime);
            div2.append(div21);
            div.append(div1).append(div2);
            div.appendTo("#show_new");
        });
    }





    function build_page_info(result){
        $("#page_info_area").empty();
        $("#page_info_area").append("第 "+result.pageInfo.pageNum+" 页（总共 "+
            result.pageInfo.pages+" 页,"+
            result.pageInfo.total+" 条记录）");
        // totalRecord = result.pageInfo.total;
        // currentPage = result.pageInfo.pageNum;
    }
    //解析显示分页条，点击分页要能去下一页....
    function build_page_nav(result){
        //page_nav_area
        $("#page_nav_area").empty();
        var ul = $("<ul></ul>").addClass("pagination");

        //构建元素
        var firstPageLi = $("<li></li>").append($("<a></a>").append("首页"));
        var prePageLi = $("<li></li>").append($("<a></a>").append("&laquo;"));
        if(result.pageInfo.hasPreviousPage == false){
            firstPageLi.addClass("disabled");
            prePageLi.addClass("disabled");
        }else{
            //为元素添加点击翻页的事件
            firstPageLi.click(function(){
                show_news(1);
            });
            prePageLi.click(function(){
                show_news(result.pageInfo.pageNum -1);
            });
        }




        var nextPageLi = $("<li></li>").append($("<a></a>").append("&raquo;"));
        var lastPageLi = $("<li></li>").append($("<a></a>").append("末页"));
        if(result.pageInfo.hasNextPage == false){
            nextPageLi.addClass("disabled");
            lastPageLi.addClass("disabled");
        }else{
            nextPageLi.click(function(){
                show_news(result.pageInfo.pageNum +1);
            });
            lastPageLi.click(function(){
                show_news(result.pageInfo.pages);
            });
        }



        //添加首页和前一页 的提示
        ul.append(firstPageLi).append(prePageLi);
        //1,2，3遍历给ul中添加页码提示
        $.each(result.pageInfo.navigatepageNums,function(index,item){

            var numLi = $("<li></li>").append($("<a></a>").append(item));
            if(result.pageInfo.pageNum == item){
                numLi.addClass("active");
            }
            numLi.click(function(){
                show_news(item);
            });
            ul.append(numLi);
        });
        //添加下一页和末页 的提示
        ul.append(nextPageLi).append(lastPageLi);

        //把ul加入到nav
        var navEle = $("<nav></nav>").append(ul);
        navEle.appendTo("#page_nav_area");
    }


</script>
</body>
</html>
