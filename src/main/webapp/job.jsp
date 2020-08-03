<%--
  Created by IntelliJ IDEA.
  User: zhangwenyu
  Date: 2020/2
  Time: 22:54
  To change this template use File | Settings | File Templates.
--%>
<%
    request.setCharacterEncoding("utf-8");
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<head>
    <title>在线招聘</title>
    <base href="<%=basePath%>">
    <link rel="icon" href="<%request.getContextPath();%>/static/favicon.ico" type="image/x-icon">
    <script type="text/javascript" src="<%request.getContextPath();%>/static/js/jquery-1.12.4.min.js"></script>
    <link href="<%request.getContextPath();%>/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="<%request.getContextPath();%>/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
    <link rel='stylesheet' href="<%request.getContextPath();%>/static/time/my.css" />
</head>
<body>

<header>
    <nav class="navbar navbar-default " role="navigation">
        <div class="navbar container-fluid navbar-default  navbar-fixed-top">
            <div class="navbar-header">
                <h4 class="logo navbar-text "><a href="#" title="毕业生信息平台">毕业生信息平台</a></h4>
            </div>

            <div id="login-info">
                <c:choose>
                    <c:when test="${not empty sessionScope.get('currentUser')}">
                        <ul class="nav navbar-nav navbar-right">
                            <li title="个人中心"><a href="<%request.getContextPath();%>/returnToMyInfo"><span
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
                    <li title="首页"><a href="#">首页</a></li>
                    <li title="宣讲会"><a href="preach.jsp">宣讲会</a></li>
                    <li title="在线招聘" class="active"><a>在线招聘</a></li>
                    <li title="公告栏"><a href="bulletin.jsp">公告栏</a></li>
                </ul>
            </div>
        </div>
    </nav>
</header>
<section class="panel panel-default container">
    <div class="row">

        <div class="col-md-3">
            <ul class="clearfix">
                <h3>在线招聘</h3>
                <li style="display:block">
                    <a class="list-group-item active" title="查询岗位" >查询岗位</a>
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
                <h3>招聘岗位</h3>
            </div>

            <div class="panel panel-default">
                <div class="container-fluid ">
                    <div style="margin: 20px">

                        <form class=" form-inline"  id="form-search">
                            <span>&nbsp &nbsp &nbsp &nbsp &nbsp </span>
                            <input type="text" class="form-control" placeholder="公司名称" name="companyName" id="companyName">
                            <span>&nbsp &nbsp </span>
                            <input type="text" class="form-control" placeholder="岗位名称" name="jobName" id="jobName">
                            <label class="form-inline">岗位类型</label>
                            <select id="category" class="form-control " name="category">
                                <option value="">全部</option>
                                <option value="正式">正式岗位</option>
                                <option value="实习">实习岗位</option>
                            </select>
                            <span> &nbsp </span>
                            <a id="search_btn" onclick="searchJob()" class="btn btn-info">搜索</a>
                            <span id="test"></span>
                        </form>

                        <div class="panel panel-default">
                            <ul class="list-group" id="show_job">

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
        show_job(1);
    });

    //根据标题用户类型进行模糊查询
    function show_job(page) {
        var data="status=1&rows=5&page="+page;
        var companyName = $("#companyName").val();
        if(companyName!=null&&companyName!=""){
            data+="&companyName="+companyName;
        }
        var jobName = $("#jobName").val();
        if(jobName!=null&&jobName!=""){
            data+="&jobName="+jobName;
        }
        var category = $("#category").val();
        if(category!=null&&category!=""){
            data+="&category="+category;
        }
        $.ajax({
            url:"<%request.getContextPath();%>/job/searchByCondition",
            data:data,
            type:"GET",
            success:function (result) {
                console.log(result);
                $("#show_job").empty();
                $("#page_info_area").empty();
                $("#page_nav_area").empty();
                if(result.flag=="200") {//查询成功
                    //alert("111");

                    build_job_table(result);
                    build_page_info(result);
                    build_page_nav(result);
                    // $("#test").append("共"+result.extend.tipes+"条记录！")
                }else{

                    var div=$("<div style='color: grey' align='center'></div>").append("暂无记录");
                    div.appendTo("#show_job");
                }

            }

        });
    }


    function searchJob() {
        show_job(1);
    }

    <%--//显示分页帖子--%>
    <%--function show_post(pn) {--%>
        <%--$("#test").empty();--%>
        <%--$.ajax({--%>
            <%--url:"<%request.getContextPath();%>/post/all",--%>
            <%--data:"pn="+pn,--%>
            <%--type:"GET",--%>
            <%--success:function (result) {--%>
                <%--//解析评论信息--%>
                <%--build_post_table(result);--%>
                <%--build_page_info(result);--%>
                <%--build_page_nav(result);--%>
            <%--}--%>
        <%--});--%>

    <%--}--%>

    //解析帖子数据
    function build_job_table(result) {
        $("#show_job").empty();
        var posts = result.pageInfo.list;
        $.each(posts,function (index,item) {
            var div = $("<div style=\"height: 100px\" ></div>").addClass("list-group-item");
            var divD1=$("<div style=\"height: 25px\"></div>");
            var divD11 = $("<div style=\"width: 30%;float: left\"></div>");
            var divA = $("<a href=\'<%request.getContextPath();%>jobDetails.jsp?id="+item.jobId+"\' style=\"font-size: 20px\"></a>").append(item.jobName);
            divD11.append(divA);
            var divD111;
            if(item.category=="实习"){
                divD111 = $("<sup style=\"color: purple\">实习</sup>");
            }else{
                divD111 = $("<sup style=\"color:orangered\">正式</sup>");
            }
            divD11.append(divD111);
            var divD12 = $("<div style=\"width: 50%;float: left;font-size: 20px;color: gray\"></div>").append(item.companyName);
            var date = item.createTime.split(" ");
            var divD13 = $("<div style=\"width: 20%;float: right\"></div>").append("发布于："+date[0]);
            divD1.append(divD11).append(divD12).append(divD13);
            var divD2 = $("<div style=\"height: 30px;padding-top: 10px;\"></div>");
            var divD21 = $("<div style=\"color: red;width: 30%;float: left\"></div>").append(item.money);
            var divD22 = $("<div style=\"width: 50%;float: left\"></div>").append(item.jobWelfare);
            divD2.append(divD21).append(divD22);
            var divD3 = $("<div style=\"width: 100%;padding-top: 10px;\"></div>");
            var divD31 = $("<div style=\"width: 30%;float: left;color: #6a6a6a\"></div>").append("<span></span>").addClass("glyphicon glyphicon-map-marker").append(item.address);
            var divD32 = $("<div style=\"width: 50%;float: left;color: #6a6a6a\"></div>").append(item.educational);
            var divD33 = $("<div style=\"width: 20%;float: right;\"></div>").append("<span></span>").addClass("glyphicon glyphicon-eye-open").append(item.click);
            divD3.append(divD31).append(divD32).append(divD33);
            div.append(divD1).append(divD2).append(divD3);
            div.appendTo("#show_job");

        });
    }




    function build_page_info(result){
        $("#page_info_area").empty();
        $("#page_info_area").append("当前 "+result.pageInfo.pageNum+" 页,总 "+
            result.pageInfo.pages+" 页,总 "+
            result.pageInfo.total+" 条记录");
        totalRecord = result.pageInfo.total;
        currentPage = result.pageInfo.pageNum;
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
                show_job(1);
            });
            prePageLi.click(function(){
                show_job(result.pageInfo.pageNum -1);
            });
        }



        var nextPageLi = $("<li></li>").append($("<a></a>").append("&raquo;"));
        var lastPageLi = $("<li></li>").append($("<a></a>").append("末页"));
        if(result.pageInfo.hasNextPage == false){
            nextPageLi.addClass("disabled");
            lastPageLi.addClass("disabled");
        }else{
            nextPageLi.click(function(){
                show_job(result.pageInfo.pageNum +1);
            });
            lastPageLi.click(function(){
                show_job(result.pageInfo.pages);
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
                show_job(item);
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
