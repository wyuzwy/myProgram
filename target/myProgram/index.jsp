<%--
  Created by IntelliJ IDEA.
  User: zhangwenyu
  Date: 2019/8/3
  Time: 16:08
  To change this template use File | Settings | File Templates.
--%>
<%
    request.setCharacterEncoding("utf-8");
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
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
                <h4 class="logo navbar-text "><a title="校园资源共享平台">毕业生信息平台</a></h4>
            </div>

            <div id="login-info">
                <c:choose>
                    <c:when test="${not empty sessionScope.get('currentUser')}">
                        <ul class="nav navbar-nav navbar-right">
                            <li title="个人中心"><a href="<%request.getContextPath();%>/returnToMyInfo" ><span
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
                    <li title="首页" class="active"><a href="#">首页</a></li>
                    <li title="宣讲会"><a href="preach.jsp">宣讲会</a></li>
                    <li title="在线招聘"><a href="job.jsp">在线招聘</a></li>
                    <li title="公告栏"><a href="bulletin.jsp">公告栏</a></li>
                </ul>
            </div>
        </div>
    </nav>
</header>
<section class="panel panel-default container">


    <div class="row" style="margin: 5px">

        <div class="col-md-8">

            <div class="panel panel-default">

                <div class="panel-heading">
                    <h4><a class="panel-info">宣讲会</a></h4>
                </div>
                <ul class="list-group" id="show_Preach">
                    <%--<div style="margin-left: 10px;height: 80px" class="list-group-item">--%>
                        <%--<div style="border:1px solid #eee;width:10%;float:left;height:60px;line-height:30px;text-align:center;font-size: 20px;color: orangered">03月</br>17月</div>--%>
                        <%--<div style="width:90%;float:left;">--%>
                            <%--<div style="width: 100%">--%>
                                <%--<a style="font-size: 20px;padding-left: 20px;padding-top: 5px; width: 85%;float: left">五邑大学就业指导与服务中心宣讲会</a>--%>
                                <%--<div style="font-size: 15px; width: 15%;float: right;">--%>
                                    <%--<span class="glyphicon glyphicon-time " style="color: firebrick">11:40</span>--%>
                                <%--</div>--%>
                            <%--</div>--%>
                            <%--<div style="width: 100%">--%>
                                <%--<div style="font-size: 15px;padding-left: 20px;padding-top: 5px; width: 85%;float: left;color: #6a6a6a"><span class="glyphicon glyphicon-map-marker">五邑大学南主楼205</span> </div>--%>
                                <%--<div style="font-size: 15px; width: 15%;float: right;"><span class="glyphicon glyphicon-eye-open" style="color: #6a6a6a">230</span></div>--%>
                            <%--</div>--%>
                        <%--</div>--%>
                    <%--</div>--%>

                    <%--<div style="margin-left: 10px;height: 80px" class="list-group-item">--%>
                        <%--<div style="border:1px solid #eee;width:10%;float:left;height:60px;line-height:30px;text-align:center;font-size: 20px;color: orangered">03月</br>17月</div>--%>
                        <%--<div style="width:90%;float:left;">--%>
                            <%--<div style="width: 100%">--%>
                                <%--<a style="font-size: 20px;padding-left: 20px;padding-top: 5px; width: 85%;float: left">五邑大学就业指导与服务中心宣讲会</a>--%>
                                <%--<div style="font-size: 15px; width: 15%;float: right;"><span class="glyphicon glyphicon-time " style="color: firebrick">11:40</span>--%>
                                    <%--</div>--%>
                            <%--</div>--%>
                            <%--<div style="width: 100%">--%>
                                <%--<div style="font-size: 15px;padding-left: 20px;padding-top: 5px; width: 85%;float: left;color: #6a6a6a"><span class="glyphicon glyphicon-map-marker">五邑大学南主楼205</span> </div>--%>
                                <%--<div style="font-size: 15px; width: 15%;float: right;"><span class="glyphicon glyphicon-eye-open" style="color: #6a6a6a">230</span></div>--%>
                            <%--</div>--%>
                        <%--</div>--%>
                    <%--</div>--%>

                </ul>
            </div>

            <div class="panel panel-default">
                <div class="panel-heading">
                    <h4><a class="panel-info">在线招聘</a></h4>
                </div>
                <ul class="list-group" id="show_job">
                    <%--<div style="height: 100px" class="list-group-item">--%>
                        <%--<div style="height: 25px">--%>
                            <%--<div style="width: 30%;float: left"><a style="font-size: 20px">java开发</a><sup style="color: orangered">实习</sup></div>--%>
                            <%--<div style="width: 50%;float: left;font-size: 20px">五邑大学就业指导与服务中心</div>--%>
                            <%--<div style="width: 20%;float: right">2020-03-18</div>--%>
                        <%--</div>--%>
                        <%--<div style="height: 30px;padding-top: 10px;">--%>
                            <%--<div style="color: red;width: 30%;float: left">--%>
                                <%--4k-8k/月--%>
                            <%--</div>--%>
                            <%--<div style="width: 50%;float: left">--%>
                                <%--五险一金、包住宿--%>
                            <%--</div>--%>
                        <%--</div>--%>
                        <%--<div style="width: 100%;padding-top: 10px;">--%>
                            <%--<div style="width: 30%;float: left;color: #6a6a6a"><span class="glyphicon glyphicon-map-marker">惠州市</span></div>--%>
                            <%--<div style="width: 50%;float: left;color: #6a6a6a">本科及以上</div>--%>
                            <%--<div style="width: 20%;float: right;"><span class="glyphicon glyphicon-eye-open" style="color: #6a6a6a">230</span></div>--%>
                        <%--</div>--%>
                    <%--</div>--%>
                    <%--<div style="height: 100px" class="list-group-item">--%>
                        <%--<div style="height: 25px">--%>
                            <%--<div style="width: 30%;float: left"><a style="font-size: 20px">java开发</a><sup style="color: red">正式</sup></div>--%>
                            <%--<div style="width: 50%;float: left" style="font-size: 20px">五邑大学就业指导与服务中心</div>--%>
                            <%--<div style="width: 20%;float: right">2020-03-18</div>--%>
                        <%--</div>--%>
                        <%--<div style="height: 30px;padding-top: 10px;">--%>
                            <%--<div style="color: red;width: 30%;float: left">--%>
                                <%--4k-8k/月--%>
                            <%--</div>--%>
                            <%--<div style="width: 50%;float: left">--%>
                                <%--五险一金、包住宿--%>
                            <%--</div>--%>
                        <%--</div>--%>
                        <%--<div style="width: 100%;padding-top: 10px;">--%>
                            <%--<div style="width: 30%;float: left;color: #6a6a6a">惠州市</div>--%>
                            <%--<div style="width: 50%;float: left;color: #6a6a6a">本科及以上</div>--%>
                            <%--<div style="width: 20%;float: right;"><span class="glyphicon glyphicon-eye-open" style="color: #6a6a6a">230</span></div>--%>
                        <%--</div>--%>
                    <%--</div>--%>
                </ul>
            </div>

        </div>

        <aside class="sidebar col-md-4">


            <div class="widget widget_hot">
                    <div id="calendar" class="calendar" style="height: 240px;margin-left: 50px"></div>
                    <script  type="text/javascript" src="<%request.getContextPath();%>/static/time/can.js"></script>
                <div style="margin-top: 20px" class="panel panel-default">
                    <div class="panel-heading">
                        <h4 align="center"><a class="panel-info">公告栏</a></h4>
                    </div>
                    <%--<h3 align="center" class="panel-heading">公告栏</h3>--%>
                    <ul class="list-group"  id="show_news">

                    </ul>
                </div>
            </div>
        </aside>

    </div>
</section>




<script type="text/javascript">

    $(function () {
        //加载宣讲会信息
        show_preach();
        //加载在线招聘信息
        show_job();
        // //加载公告信息
        show_bulletin();
    });
    //加载宣讲会信息
    function show_preach() {
        $.ajax({
            url:"<%request.getContextPath();%>/preach/showIndex",
            type:"GET",
            success:function (result) {
                console.log(result);
                //解析资源数据
                build_Preach_table(result.preach);
            }
        });
    }



    function show_job() {
        $.ajax({
            url:"<%request.getContextPath();%>/job/showIndex",
            type:"GET",
            success:function (result) {
                console.log(result);
               //解析评论信息
               build_job_table(result.job);
            }
        });

    }

    function show_bulletin() {{
            var data="backup=1&rows=7&page=1";
            $.ajax({
                url:"<%request.getContextPath();%>/news/searchByCondition",
                data:data,
                type:"GET",
                success:function (result) {
                    console.log(result);
                    $("#show_news").empty();

                    if(result.flag=="200") {//查询成功
                        build_news_table(result);
                    }else{

                    }

                }

            });
        }
    }




    //解析资源数据
   function build_Preach_table(preach){
         $("#show_Preach").empty();
        $.each(preach,function (index,res) {
            var div = $("<div style=\"margin-left: 10px;height: 80px\"></div>").addClass("list-group-item");
            var data = res.startTime.split("-");
            var month=data[1]+"月</br>";
            var data2 = data[2].split(" ");
            var day =data2[0];
            var time =data2[1];
            var divDay = $("<div style=\"border:1px solid #eee;width:10%;float:left;height:60px;line-height:30px;text-align:center;font-size: 20px;color: orangered\"></div>").append(month+day+"日");
            var divData = $("<div style=\"width:90%;float:left;\"></div>");
            var divD1=$("<div style=\"width: 100%\"></div>");
            var divD11=$("<a href=\'<%request.getContextPath();%>preachDetails.jsp?id="+res.preachId+"\' style=\"font-size: 20px;padding-left: 20px;padding-top: 5px; width: 85%;float: left\"></a>").append(res.companyName+"宣讲会");
            if(res.backup!="1"){
                var divD111 = $("<sup style=\"border-radius: 5px;font-size: 15px;background-color: gray;color: white\">过</sup>");
                divD11.append(divD111);
            }
            var divD12 =$("<div style=\"font-size: 15px; width: 15%;float: right;\"></div>");
            var divD121 = $("<span style=\"color: firebrick\"></span>").addClass("glyphicon glyphicon-time").append(time);
            divD12.append(divD121);
            divD1.append(divD11).append(divD12);
            var divD2 = $("<div style=\"width: 100%\"></div>");
            var divD21 = $("<div style=\"font-size: 15px;padding-left: 20px;padding-top: 5px; width: 85%;float: left;color: #6a6a6a\"></div>");
            var divD211 = $("<span></span>").addClass("glyphicon glyphicon-map-marker").append(res.school+res.address);
            var divD22 = $("<div style=\"font-size: 15px; width: 15%;float: right;\"></div>");
            var divD221 = $("<span style=\"color: #6a6a6a\"></span>").addClass("glyphicon glyphicon-eye-open").append(res.click);
            divD21.append(divD211);
            divD22.append(divD221);
            divD2.append(divD21).append(divD22);
            divData.append(divD1).append(divD2);
            div.append(divDay).append(divData);
            div.appendTo("#show_Preach");

            // var hre=$("<a href='"+<%request.getContextPath();%>/resource/getResouceById/"'></a>").addClass("list-group-item");
            //var hre=$(this).wrap("<a href='"+home/resource/getResouceById?rid=item.resourceId+"'></a>".addClass());
            <%--var hre=$("<a href=\'<%request.getContextPath();%>/resource/getResourceById?rid="+item.resourceId+"\'></a>").addClass("list-group-item");--%>
            <%--var side = $("<h4></h4>").addClass("list-group-item-heading").append(item.resourceName);--%>
            <%--var sideData1 ;--%>
            <%--if(item.user.userLevel=="学生"){--%>
                <%--sideData1=$("<sup style=\"border-radius: 5px;font-size: 1px;background-color: #c7ddef;color: blue\"></sup>").append("学生");--%>
            <%--}else if(item.user.userLevel=="教师"){--%>
                <%--sideData1= $("<sup style=\"border-radius: 5px;font-size: 1px;background-color:gray;color: yellow\"></sup>").append("教师");--%>
            <%--}--%>
            <%--side.append(sideData1);--%>
            <%--if(item.resourceGood=="1") {--%>
                <%--var sideData2 = $("<sup style=\"border-radius: 5px;font-size: 1px;background-color: pink;color: red\"></sup>").append("优质");--%>
                <%--side.append(sideData2);--%>
            <%--}--%>
            <%--var context =$("<h6 style=\"overflow: hidden;text-overflow: ellipsis\"></h6>").addClass("text").append(item.resourceDesc);--%>
            <%--var desc1 =$("<span></span>").addClass("muted glyphicon glyphicon-user").append(item.resourceUid).append("&nbsp;");--%>
            <%--var desc2 = $("<span></span>").addClass("text").append("资源类别:").append(item.categoryKey.categoryName).append("&nbsp;");--%>
            <%--var desc3 = $("<span></span>").addClass("text").append("资源等级:").append(item.resourceLevel).append("&nbsp;");--%>
            <%--var time=timeStamp2String(item.resourceTime);--%>
            <%--var desc4 = $("<span></span>").addClass("muted glyphicon glyphicon-time").append(time);--%>



            <%--hre.append(side).append(context).append(desc1).append(desc2).append(desc3).append(desc4).appendTo("#show_resources");--%>

        });
        var seeMore = $("<a href=\'preach.jsp\'></a>").addClass("see-more list-group-item").append("查看更多...");
        seeMore.appendTo("#show_Preach");
    }


    //解析在线招聘数据
    function build_job_table(job) {
        $("#show_job").empty();
        $.each(job,function (index,item) {
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
            <%--// var hre=$("<a href='"+<%request.getContextPath();%>/resource/getResouceById/"'></a>").addClass("list-group-item");--%>
            <%--//var hre=$(this).wrap("<a href='"+home/resource/getResouceById?rid=item.resourceId+"'></a>".addClass());--%>
            <%--var hre=$("<a href=\'<%request.getContextPath();%>/post/getPostById?pid="+item.postId+"\'></a>").addClass("list-group-item");--%>
            <%--var side = $("<h4></h4>").addClass("list-group-item-heading").append(item.postTitle);--%>
            <%--var sideData1 ;--%>
            <%--if(item.user.userLevel=="学生"){--%>
                <%--sideData1=$("<sup style=\"border-radius: 5px;font-size: 1px;background-color: #c7ddef;color: blue\"></sup>").append("学生");--%>
            <%--}else if(item.user.userLevel=="教师"){--%>
                <%--sideData1= $("<sup style=\"border-radius: 5px;font-size: 1px;background-color:gray;color: yellow\"></sup>").append("教师");--%>
            <%--}--%>
            <%--side.append(sideData1);--%>
            <%--var context =$("<h6 style=\"overflow: hidden;text-overflow: ellipsis\"></h6>").addClass("text").append(item.postText);--%>
            <%--var desc1 =$("<span></span>").addClass("muted glyphicon glyphicon-user").append(item.postUid).append("&nbsp;");--%>
            <%--var time=timeStamp2String(item.postTime);--%>
            <%--var desc4 = $("<span></span>").addClass("muted glyphicon glyphicon-time").append(time);--%>
            <%--hre.append(side).append(context).append(desc1).append(desc4).appendTo("#show_post");--%>

        });
        var seeMore = $("<a href=\'job.jsp'></a>").addClass("see-more list-group-item").append("查看更多...");
        seeMore.appendTo("#show_job");
    }


    function build_news_table(result) {
        var news = result.pageInfo.list;
        $.each(news,function (index,item) {
            var div = $("<div style=\"height: 50px\" ></div>").addClass("list-group-item");
            // var div = $("<div style=\"height: 40px\" ></div>");
            var div1 = $("<div style=\"width: 60%;float: left\"></div>");
            var p = $("<p></p>").addClass("line-limit-length");
            var divA = $("<a href=\'<%request.getContextPath();%>bulletinDetails.jsp?id="+item.newsId+"\' style=\"color: #6a6a6a\"></a>").append(item.title);
            p.append(divA);
            div1.append(p);
            var div2 = $("<div style=\"font-size: 15px; width: 35%;float: right;\"></div>");
            var div21 = $("<span></span>").addClass("glyphicon glyphicon-time").append(item.newsTime);
            div2.append(div21);
            div.append(div1).append(div2);
            div.appendTo("#show_news");
        });
        var seeMore = $("<a href=\'bulletin.jsp'></a>").addClass("see-more list-group-item").append("查看更多...");
        seeMore.appendTo("#show_news");
    }





    
    
    
</script>
</body>
</html>
