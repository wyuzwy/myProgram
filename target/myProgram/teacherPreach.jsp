<%--
  Created by IntelliJ IDEA.
  User: zhangwenyu
  Date: 2019/8/6
  Time: 16:52
  To change this template use File | Settings | File Templates.
--%>
<%

    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<%
    request.setCharacterEncoding("utf-8");
    String htmlData = request.getParameter("content") != null ? request.getParameter("content") : "";
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
    <link rel="stylesheet" href="<%request.getContextPath();%>/static/kindeditor/themes/default/default.css" />
    <link rel="stylesheet" href="<%request.getContextPath();%>/static/kindeditor/plugins/code/prettify.css" />
    <script charset="utf-8" src="<%request.getContextPath();%>/static/kindeditor/kindeditor.js"></script>
    <script charset="utf-8" src="<%request.getContextPath();%>/static/kindeditor/lang/zh-CN.js"></script>
    <script charset="utf-8" src="<%request.getContextPath();%>/static/kindeditor/plugins/code/prettify.js"></script>
    <script type="text/javascript" src="<%request.getContextPath();%>/static/layer_v3.1.1/3.1.1/layer.js"></script>
    <script charset="utf-8" src="<%request.getContextPath();%>/static/laydate/laydate.js"></script>

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
                    <li title="公告栏" ><a href="bulletin.jsp" >公告栏</a></li>
                </ul>
            </div>
        </div>
    </nav>
</header>

<section class="panel panel-default container">
    <div class="row">

        <div class="col-md-2">
            <ul class="clearfix">
                <h4>个人中心<sup style="border-radius: 5px;font-size: 15px;background-color: navajowhite;color: green">教师</sup></h4>
                <li style="display:block">
                    <a class="list-group-item " title="我的信息" href="teacherInfo.jsp">我的信息</a>
                </li>
                <li style="display:block">
                    <a class="list-group-item" title="查询所有发布" href="teacherSearch.jsp">查询所有发布</a>
                </li>
                <li style="display:block">
                    <a class="list-group-item active" title="宣讲会申请">申请宣讲会</a>
                </li>
                <li style="display:block">
                    <a class="list-group-item " title="发布在线招聘" href="teacherJob.jsp">发布在线招聘</a>
                </li>
                <li style="display:block">
                    <a class="list-group-item " title="审核生源信息" href="teacherSignInfo.jsp">审核生源信息</a>
                </li>
                <li style="display:block">
                    <a class="list-group-item" title="审核就业信息" href="teacherSignEmp.jsp">审核就业信息</a>
                </li>
            </ul>
        </div>

        <div class="col-md-10">

            <div>
                <h3>发布宣讲会</h3>
            </div>

            <div class="panel panel-default ">
                <div class="container">

                    <div style="margin: 20px;height: 550px">

                        <form  class="col-md-9 form-horizontal"  id="teacherPreach" >
                            <div class="form-group" hidden>
                                <input type="text" id="snedName" name="snedName" value="${currentUser.userDept}"/>
                                <input type="text" id="sendId" name="sendId" value="${currentUser.id}"/>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">公司名称：</label>
                                <div class="col-md-4">
                                    <input type="text" class="form-control" name="companyName" id="companyName" placeholder="请输入公司全称"/>
                                </div>
                                <div class="col-sm-2">
                                    <h5 id="nameH5"  class="help-block" style="color: red ;margin-left: 5px"></h5>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">宣讲地点：</label>
                                <div class="col-md-4">
                                    <input type="text" class="form-control" name="address" id="address" placeholder="例：黄浩川202"/>
                                </div>
                                <div class="col-sm-2">
                                    <h5 id="addressH5"  class="help-block" style="color: red ;margin-left: 5px"></h5>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">公司简介：</label>
                                <div class="col-sm-4">
                                    <textarea cols="100" rows="12"  name="introduction" id="introduction" oninput="check()" placeholder="字数不能超过400字..."></textarea>
                                    <h5  class="help-block" id="h5Introduction"></h5>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">开始时间：</label>
                                <div class="col-sm-2">
                                    <%--<input type="text" class="timeInput form-control" name="endTime" id="endTime"/>--%>
                                    <input type="text" class="form-control" autocomplete="off" name="startTime" id="startTime" style="width: 139px"/>
                                </div>
                                <div class="col-sm-2">
                                    <h5 id="startH5"  class="help-block" style="color: red;margin-left: 5px"></h5>
                                </div>
                                <label class="col-sm-2 control-label">结束时间：</label>
                                <div class="col-sm-2">
                                    <%--<input type="text" class="timeInput form-control" name="endTime" id="endTime"/>--%>
                                    <input type="text" class="form-control" autocomplete="off" name="endTime" id="endTime" style="width: 139px"/>
                                </div>
                                <div class="col-sm-2">
                                    <h5 id="endH5"  class="help-block" style="color: red ;margin-left: 5px"></h5>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label">招聘简章：</label>
                                <div class="col-sm-4">
                                    <textarea  id="content" name="content" cols="50" rows="8" style="width:675px;height: 400px; visibility: hidden;" ><%=htmlspecialchars(htmlData)%></textarea>
                                    <h5  class="help-block" style="color: red"></h5>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">发布状态：</label>
                                <div class="col-sm-4">
                                    <select id="status" class="form-control " name="status">
                                        <option value="1" selected>显示</option>
                                        <option value="2">不显示</option>
                                    </select>
                                </div>
                            </div>

                            <div class="form-group">
                                <div class=" col-sm-10" align="center">
                                    <button type="button" class="btn btn-primary" id="companyPreach_ask">申请</button>
                                    <button type="button" class="btn btn-default" id="cancel_btn">重置</button>
                                </div>
                            </div>
                        </form>
                    </div>


                </div>
            </div>


        </div>


    </div>
</section>


<script type="text/javascript">

    laydate.render({
        elem:'#startTime',
        type:'datetime',
        format:'yyyy-MM-dd HH:mm',
        theme:'molv'
    });

    laydate.render({
        elem:'#endTime',
        type:'time',
        format:'HH:mm',
        theme:'molv'

    });

    function check() {
        $("#h5Introduction").text("");
        var introduction = $("#introduction").val();
        $("#h5Introduction").append("<font color='gray'>已输入"+introduction.length+"字</font>");
    }

    var editor1;
    KindEditor.ready(function(K) {
        editor1 = K.create('textarea[name="content"]', {
            cssPath : 'static/kindeditor/plugins/code/prettify.css',
            uploadJson : 'static/kindeditor/jsp/upload_json.jsp',
            fileManagerJson : 'static/kindeditor/jsp/file_manager_json.jsp',
            allowFileManager : true,
            afterCreate : function() {
                var self = this;
                K.ctrl(document, 13, function() {
                    self.sync();
                    document.forms['example'].submit();
                });
                K.ctrl(self.edit.doc, 13, function() {
                    self.sync();
                    document.forms['example'].submit();
                });
            }
        });
        prettyPrint();
    });



    $("#companyPreach_ask").click(function () {
        $("#teacherPreach h5").text("");

        var companyName = $("#companyName").val();
        if(companyName==""){
            $("#nameH5").text("请输入公司名称！");
            $("#companyName").focus();
            return false;
        }

        var address = $("#address").val();
        if(address==""){
            $("#addressH5").text("请输入宣讲地点！");
            $("#address").focus();
            return false;
        }

        var introduction = $("#introduction").val();
        if(introduction==""){
            // $("#introduction").next("h5").text("请输入公司简介！");
            $("#h5Introduction").append("<font color='red'>请输入公司简介</font>");
            $("#introduction").focus();
            return false;
        }else if(introduction.length>400){
            // $("#introduction").next("h5").text("字数已超过限制！");
            $("#h5Introduction").append("<font color='red'>字数已超过限制</font>");
            $("#introduction").focus();
            return false;
        }

        var startTime = $("#startTime").val();
        if(startTime==""){
            $("#startH5").text("请选择开始时间");
            $("#startTime").focus();
            return false;
        }
        var endTime =$("#endTime").val();
        if(endTime==""){
            $("#endH5").text("请选择开始时间");
            $("#endTime").focus();
            return false;
        }

        editor1.sync();
        var content = $("#content").val();
        if(content==""){
            $("#content").next('h5').text("请输入招聘简章！！！");
            $("#content").focus();
            return false;
        }

        layer.confirm("是否确认申请宣讲会？",{btn:['确定','取消'],title:"提示"},function () {

            $.ajax({
                url:"preach/insertOrUpdate",//发布宣讲会的url
                data:$("#teacherPreach").serialize(),
                type:"POST",
                success:function (result) {
                    if(result.flag=="200"){
                        layer.msg('发布成功！', {icon: 1});
                        clearInput();
                    }else{
                        layer.msg('申请失败，请重试！', {icon: 2});
                    }
                },
                error:function () {
                    layer.msg('服务请求超时！！！', {icon: 5});
                }
            });


        });

    });

    $("#cancel_btn").click(function () {
        clearInput();
    });

    function clearInput(){
        // $("#teacherPreach h5").text("");
        // KindEditor.instances[0].html("");
        // $("#teacherPreach input").val("");
        // $("#teacherPreach textarea").val("");
        window.location.reload();
    }

</script>
</body>
</html>
<%!
    private String htmlspecialchars(String str) {
        str = str.replaceAll("&", "&amp;");
        str = str.replaceAll("<", "&lt;");
        str = str.replaceAll(">", "&gt;");
        str = str.replaceAll("\"", "&quot;");
        return str;
    }
%>