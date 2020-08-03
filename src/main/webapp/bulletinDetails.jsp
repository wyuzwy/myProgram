<%--
  Created by IntelliJ IDEA.
  User: zhangwenyu
  Date: 2019/8/3
  Time: 22:24
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
    <title>公告详情</title>
    <base href="<%=basePath%>">
    <link rel="icon" href="<%request.getContextPath();%>/static/favicon.ico" type="image/x-icon">
    <script type="text/javascript" src="<%request.getContextPath();%>/static/js/jquery-1.12.4.min.js"></script>
    <link href="<%request.getContextPath();%>/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="<%request.getContextPath();%>/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
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
                            <li title="个人中心" class="active"><a href="<%request.getContextPath();%>/returnToMyInfo"><span
                                    class="glyphicon glyphicon-user"></span>${currentUser.id}</a>
                            </li>
                            <li title="退出"><a href="<%request.getContextPath();%>/exit"><span class="glyphicon glyphicon-log-in"></span>注销</a></li>
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
                    <li title="在线招聘" ><a href="job.jsp">在线招聘</a></li>
                    <li title="公告栏" class="active"><a href="bulletin.jsp">公告栏</a></li>
                </ul>
            </div>
        </div>
    </nav>
</header>
<section class="container">
    <%--panel panel-default--%>
    <div class="row">

        <div class="col-md-1"></div>

        <div class="col-md-10">
            <div>
                <ul class="breadcrumb">
                    <li>
                        <a href="javascript:history.back(-1);">返回</a>
                    </li>
                    <li class="active">
                        公告详情
                    </li>
                </ul>
            </div>



            <div class="panel panel-default">
                <ul class="list-group">
                    <li style="display:block;height:50px" class="list-group-item">
                        <div style="width: 100%">
                            <div style="width: 80%;float: left" id="title"></div>
                            <div style="width: 15%;float: right" id="click"><i class="glyphicon glyphicon-eye-open"></i>点击人次：</div>
                        </div>
                    </li>
                    <li style="display:block" class="list-group-item">
                        <h4>正文</h4>
                        <div style="margin-top: 20px;margin-left: 20px" id="content">

                        </div>
                        <h4 id="fileH4">相关附件</h4>
                        <div style="margin-top: 20px;margin-left: 20px" id="newsFile">

                        </div>
                    </li>

                    <li style="display:block" class="list-group-item">
                        <div align="right">
                            <span class="navbar-left" id="sendName"><i class="glyphicon glyphicon-user"></i>发布单位：</span>
                            <span class="navbar-right" id="newsTime"><i class="glyphicon glyphicon-time ">发布时间：</i></span>
                            <span>&nbsp &nbsp </span>
                        </div>
                    </li>
                </ul>
            </div>



        </div>
    </div>
    </div>
</section>

<script type="text/javascript">
    var id = "${param.id}";
    $(function () {

        searchById(id);
        <%--var fileUrl = "${news.fileUrl}";--%>
        <%--// var fileUrl = "zhangsan,lisi,wangwu";--%>
        <%--if(fileUrl==""||fileUrl==undefined){--%>
            <%--$("#fileH4").hide();--%>
            <%--$("#newsFile").hide();--%>
        <%--}else{--%>
            <%--var fileName = "${news.fileName}";--%>
            <%--// var fileName = "张三,李四,王五,";--%>
            <%--var url=fileUrl.split(",");--%>
            <%--var name = fileName.split(",");--%>
            <%--for(var i=0;i<url.length;i++){--%>
                <%--var di = $("<div></div>");--%>
                <%--var hre=$("<a href=\'<%request.getContextPath();%>/news/download?url="+url[i]+"\'>"+name[i]+"</a>");--%>
                <%--di.append(hre);--%>
                <%--di.appendTo("#newsFile");--%>
            <%--}--%>
        <%--}--%>
    });

    function searchById(id) {
        $.ajax({
            url:"<%request.getContextPath();%>/news/searchById",
            data:"newsId="+id+"&backup=1&token=token",
            type:"GET",
            success:function (result) {
                if(result.flag=="200"){
                    show_news(result.news);
                }
            }
        });
    }

    function show_news(news) {
        // newsEmpty();
        $("#title").append(news.title);
        $("#click").append(news.click);
        $("#content").append(news.content);
        var fileUrl = news.fileUrl;
        if(fileUrl==""||fileUrl==undefined){
            $("#fileH4").hide();
            $("#newsFile").hide();
        }else{
            var fileName = news.fileName;
            // var fileName = "张三,李四,王五,";
            var url=fileUrl.split(",");
            var name = fileName.split(",");
            for(var i=0;i<url.length;i++){
                var di = $("<div></div>");
                var hre=$("<a href=\'<%request.getContextPath();%>/file/downFile?url="+url[i]+"\' style=\"color: #6a6a6a\">"+name[i]+"</a>");
                di.append(hre);
                di.appendTo("#newsFile");
            }
        }
        $("#sendName").append(news.sendName);
        $("#newsTime").append(news.newsTime);
    }

    function newsEmpty() {
        $("#title").empty();
        $("#click").empty();
        $("#content").empty();
    }


</script>

</body>
</html>
