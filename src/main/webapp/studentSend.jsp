<%--
  Created by IntelliJ IDEA.
  User: zhangwenyu
  Date: 2019/8/7
  Time: 21:02
  To change this template use File | Settings | File Templates.
--%>
<%

    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
    <title>毕业生信息平台</title>
    <base href="<%=basePath%>">
    <link rel="icon" href="<%request.getContextPath();%>/static/favicon.ico" type="image/x-icon">
    <script type="text/javascript" src="<%request.getContextPath();%>/static/js/jquery-1.12.4.min.js"></script>
    <link href="<%request.getContextPath();%>/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="<%request.getContextPath();%>/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
    <link src="<%request.getContextPath();%>/static/bootstrap-3.3.7-dist/js/bootstrap-datetimepicker.min.js" rel="stylesheet">
    <script src="<%request.getContextPath();%>/static/bootstrap-3.3.7-dist/js/bootstrap-datetimepicker.min.js"></script>
    <script src="<%request.getContextPath();%>/static/bootstrap-3.3.7-dist/js/bootstrap-datetimepicker.zh-CN.js"></script>
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
                            <li title="个人中心" class="active"><a ><span
                                    class="glyphicon glyphicon-user"></span>${currentUser.id}</a>
                            </li>
                            <li title="注销"><a href="<%request.getContextPath();%>/exit"><span class="glyphicon glyphicon-log-in"></span>退出</a></li>
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
                    <li title="公告栏" ><a href="bulletin.jsp">公告栏</a></li>
                </ul>
            </div>
        </div>
    </nav>
</header>
<section class="panel panel-default container">
    <div class="row">

        <div class="col-md-2">
            <ul class="clearfix">
                <h4>个人中心 <sup style="border-radius: 5px;font-size: 15px;background-color: #c7ddef;color: blue">学生</sup></h4>
                <li style="display:block">
                    <a class="list-group-item " title="我的信息" href="studentInfo.jsp">我的信息</a>
                </li>
                <li style="display:block">
                    <a class="list-group-item active" title="已投递岗位">已投递岗位</a>
                </li>
                <li style="display:block">
                    <a class="list-group-item" title="已关注宣讲会" href="studentFollow.jsp">已关注宣讲会</a>
                </li>
                <li style="display:block">
                    <a class="list-group-item" title="填写就业信息" href="studentEmployment.jsp">填写就业信息</a>
                </li>
                <li style="display:block">
                    <a class="list-group-item" title="个人简历" href="studentResume.jsp">个人简历</a>
                </li>
            </ul>
        </div>

        <div class="col-md-10">

            <div>
                <h3>已投递岗位</h3>
            </div>

            <div class="panel panel-default ">
                <div class="container-fluid">
                    <div style="margin: 20px">
                        <form class=" form-inline"  id="form-search">
                            <span>&nbsp &nbsp &nbsp &nbsp &nbsp </span>
                            <input type="text" class="form-control" placeholder="公司名称" name="companyName" id="companyName">
                            <span>&nbsp &nbsp </span>
                            <input type="text" class="form-control" placeholder="岗位名称" name="jobName" id="jobName">
                            <span>&nbsp </span>
                            <label class="form-inline">岗位类型</label>
                            <select id="category" class="form-control " name="category">
                                <option value="" selected>全部</option>
                                <option value="正式">正式岗位</option>
                                <option value="实习">实习岗位</option>
                            </select>
                            <span> &nbsp </span>
                            <a id="search_btn" onclick="searchJob()" class="btn btn-info">搜索</a>
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
            </div>
        </div>
    </div>
</section>

<script type="text/javascript">
    var value="${currentUser.id}";
    $(function () {

        show_job(1);


    });

    function show_job(page) {
        if(value==null||value==""||value==undefined){
            return false;
        }
        var data="rows=5&page="+page+"&userId="+value;
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
            url:"<%request.getContextPath();%>/job/getSend",
            data:data,
            type:"GET",
            success:function (result) {
                console.log(result);
                $("#show_job").empty();
                $("#page_info_area").empty();
                $("#page_nav_area").empty();
                if(result.flag=="200"){
                    show_jobs(result);

                    build_page_info(result);
                    //3、解析显示分页条数据
                    build_page_nav(result);
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


    function show_jobs(result) {
        $("#show_job").empty();
        var res = result.pageInfo.list;
        $.each(res,function (index,item) {
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
        // totalRecord = result.extend.pageInfo.total;
        // currentPage = result.extend.pageInfo.pageNum;
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



    <%--$(document).on("click",".delete_btn",function () {--%>
        <%--var delId="${currentUser.userId}"+",";--%>
            <%--delId += $(this).attr("del-id");--%>
        <%--if(confirm("是否取消收藏该资源？")){--%>
            <%--$.ajax({--%>
                <%--url:"<%request.getContextPath();%>/resource/delete/"+delId,--%>
                <%--type:"DELETE",--%>
                <%--success:function (result) {--%>
                   <%--if(result.codel==100){--%>
                       <%--show_resource1(1);--%>
                       <%--$("#tipes12").show();--%>
                       <%--setTimeout("hidden_cue()","3000")--%>
                   <%--}--%>




                <%--}--%>


            <%--});--%>
        <%--}--%>

        <%--return false;--%>
    <%--});--%>






</script>
</body>
</html>
