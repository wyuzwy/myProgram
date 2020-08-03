<%--
  Created by IntelliJ IDEA.
  User: zhangwenyu
  Date: 2019/8/6
  Time: 22:06
  To change this template use File | Settings | File Templates.
--%>
<%

    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<%
    request.setCharacterEncoding("utf-8");
    String htmlData1 = request.getParameter("jobDescribe") != null ? request.getParameter("jobDescribe") : "";
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
                <h4>个人中心<sup style="border-radius: 5px;font-size: 15px;background-color: navajowhite;color: green">教师</sup></h4>
                <li style="display:block">
                    <a class="list-group-item" title="我的信息" href="teacherInfo.jsp">我的信息</a>
                </li>
                <li style="display:block">
                    <a class="list-group-item active" title="查询所有发布" >查询所有发布</a>
                </li>
                <li style="display:block">
                    <a class="list-group-item" title="发布宣讲会" href="teacherPreach.jsp">发布宣讲会</a>
                </li>
                <li style="display:block">
                    <a class="list-group-item" title="发布在线招聘" href="teacherJob.jsp">发布在线招聘</a>
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
                <h3>所有的宣讲会/在线招聘</h3>
            </div>

            <div class="panel panel-default ">
                <div class="container-fluid">
                    <div style="margin: 20px;height: 550px">
                        <form class=" form-inline"  id="form-search">
                            <span>&nbsp &nbsp &nbsp &nbsp &nbsp </span>
                            <label class="form-inline">查询类型</label>
                            <select id="type" class="form-control " name="type" onchange="show_or_hide()">
                                <option value="1" selected>宣讲会</option>
                                <option value="2">在线招聘</option>
                            </select>
                            <span> &nbsp </span>
                            <label class="form-inline">状态</label>
                            <select id="status" class="form-control " name="status" onchange="show_or_hide()">
                                <option value="-1" selected>全部</option>
                                <option value="1">显示</option>
                                <option value="2">不显示</option>
                            </select>

                            <input type="text" class="form-control" placeholder="公司名称" name="companyName" id="companyName">
                            <span>&nbsp &nbsp </span>
                            <input type="text" class="form-control" placeholder="岗位名称" name="jobName" id="jobName">
                            <span>&nbsp </span>
                            <a id="search_btn" onclick="searchMy()" class="btn btn-info">搜索</a>
                        </form>
                        <div class="panel panel-default">
                            <ul class="list-group" id="show">

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

<%--修改宣讲会模态框--%>
<div class="modal fade" id="updatePreach" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog" style="width: 900px">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="myModalLabel">
                    修改宣讲会
                </h4>
            </div>
            <div class="modal-body" >
                <div style="margin: 20px;height: 1000px;">

                    <form  class="col-md-9 form-horizontal"  id="update_preach" >
                        <div class="form-group">
                            <label class="col-sm-2 control-label">宣讲会ID：</label>
                            <div class="col-md-4">
                                <input type="text" id="preachId" class="form-control"  name="preachId" readonly />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">公司名称：</label>
                            <div class="col-md-4">
                                <input type="text" class="form-control" name="companyName" id="companyName1" placeholder="请输入公司全称"/>
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
                                <input type="text" class="form-control" name="startTime" id="startTime" style="width: 139px"/>
                            </div>
                            <div class="col-sm-2">
                                <h5 id="startH5"  class="help-block" style="color: red;margin-left: 5px"></h5>
                            </div>
                            <label class="col-sm-2 control-label">结束时间：</label>
                            <div class="col-sm-2">
                                <%--<input type="text" class="timeInput form-control" name="endTime" id="endTime"/>--%>
                                <input type="text" class="form-control" name="endTime" id="endTime" style="width: 139px"/>
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
                                <select id="status1" class="form-control " name="status">
                                    <option value="1" selected>显示</option>
                                    <option value="2">不显示</option>
                                </select>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" onclick="updatePreach()" id="upload_preach">
                    提交更改
                </button>
                <button type="button" class="btn btn-danger" onclick="deletePreach()" id="delete_preach">删除宣讲会
                </button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>



<%--修改在线招聘模态框--%>
<div class="modal fade" id="updateJob" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog" style="width: 900px">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="myModalLabel2">
                    修改在线招聘
                </h4>
            </div>
            <div class="modal-body" >

                <div style="margin: 20px;height: 1200px;">
                    <form  class="col-md-9 form-horizontal"  id="update_job" >

                        <div class="form-group">
                            <label class="col-sm-2 control-label">岗位ID：</label>
                            <div class="col-md-4">
                                <input type="text" id="jobId" class="form-control" name="jobId" readonly />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">公司名称：</label>
                            <div class="col-sm-4">
                                <input type="text"  class="form-control" name="companyName" id="companyName2" placeholder="请输入公司全称"/>
                            </div>
                            <div class="col-sm-4">
                                <h5 id="h5Company"  class="help-block" style="color: red"></h5>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">公司简介：</label>
                            <div class="col-sm-4">
                                <textarea cols="100" rows="12"  name="introduction" id="introduction2" oninput="check()" placeholder="字数不能超过400字..."></textarea>
                                <h5  class="help-block" id="h5Introduction2"></h5>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">职位名称：</label>
                            <div class="col-sm-4">
                                <input type="text"  class="form-control" name="jobName" id="jobName2" />
                            </div>
                            <div class="col-sm-4">
                                <h5 id="h5Name"  class="help-block" style="color: red"></h5>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">职位类别：</label>
                            <div class="col-sm-4">
                                <select  class="form-control" name="category" id="category">
                                    <option selected value="">请选择。。。</option>
                                    <option value="正式">正式岗位</option>
                                    <option value="实习">实习岗位</option>
                                </select>
                            </div>
                            <div class="col-sm-4">
                                <h5 id="h5Cate"  class="help-block" style="color: red"></h5>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">工作地点：</label>
                            <div class="col-sm-4">
                                <input type="text" class="form-control" name="address" id="address2" placeholder="例：江门市"/>
                            </div>
                            <div class="col-sm-4">
                                <h5 id="h5Add"  class="help-block" style="color: red"></h5>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">工作薪酬：</label>
                            <div class="col-sm-4">
                                <input type="text" class="form-control" name="money" id="money" placeholder="例：5000元/月"/>
                            </div>
                            <div class="col-sm-4">
                                <h5 id="h5Money"  class="help-block" style="color: red"></h5>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label">职位福利：</label>
                            <div class="col-sm-4">
                                <input type="text" class="form-control" name="jobWelfare" id="jobWelfare" placeholder="例：包五险一金"/>
                            </div>
                            <div class="col-sm-4">
                                <h5 id="h5Wel"  class="help-block" style="color: red"></h5>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label">学历要求：</label>
                            <div class="col-sm-4">
                                <select  class="form-control" name="educational" id="educational">
                                    <option selected value="">请选择。。。</option>
                                    <option value="大专及以下">大专及以下</option>
                                    <option value="大专及以上">大专及以上</option>
                                    <option value="本科及以上">本科及以上</option>
                                    <option value="硕士及以上">硕士及以上</option>
                                    <option value="博士及以上">博士及以上</option>
                                </select>
                            </div>
                            <div class="col-sm-4">
                                <h5 id="h5Edu"  class="help-block" style="color: red"></h5>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label">截止日期：</label>
                            <div class="col-sm-4" id="searchDate">
                                <input type="text" class=" form-control" name="endTime" id="endTime2"/>

                            </div>
                            <div class="col-sm-4">
                                <h5 id="h5Time"  class="help-block" style="color: red"></h5>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label">职位描述：</label>
                            <div class="col-sm-4">
                                <textarea  id="jobDescribe" name="jobDescribe" cols="50" rows="8" style="width:675px;height: 400px; visibility: hidden;" ><%=htmlspecialchars(htmlData1)%></textarea>
                                <h5  class="help-block" style="color: red"></h5>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">发布状态：</label>
                            <div class="col-sm-4">
                                <select id="status2" class="form-control " name="status">
                                    <option value="1" selected>显示</option>
                                    <option value="2">不显示</option>
                                </select>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" onclick="updateJob()" id="upload_job">
                    提交更改
                </button>
                <button type="button" class="btn btn-danger" onclick="deleteJob()" id="delete_job">删除岗位
                </button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>


<script type="text/javascript">
    var value = "${currentUser.id}";
    $(function () {
        show_or_hide();
        show_resource(1);
    });


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

    laydate.render({
        elem:'#endTime2',
        type:'date',
        format:'yyyy-MM-dd',
        theme:'molv'
    });


    var editor1;
    KindEditor.ready(function(K) {//宣讲会的编辑框
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

    var editor2;
    KindEditor.ready(function(K) {//在线招聘的编辑框
        editor2 = K.create('textarea[name="jobDescribe"]', {
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




    function editPreach(preachId) {
        $.ajax({
            url:"<%request.getContextPath();%>/preach/searchById",
            data:"preachId="+preachId+"&take=1",
            type:"GET",
            success:function (result) {
                console.log(result);
                if(result.flag=="200"){
                    $("#updatePreach").modal('show');
                    show_one_preach(result.preach);
                }else{

                }
            }
        });

    }

    function editJob(jobId) {
        $.ajax({
            url:"<%request.getContextPath();%>/job/searchById",
            data:"jobId="+jobId+"&take=1",
            type:"GET",
            success:function (result) {
                console.log(result);
                if(result.flag=="200"){
                    $("#updateJob").modal('show');
                    show_one_job(result.job);
                }else{

                }
            }
        });

    }


    function show_or_hide() {
        var type = $("#type").val();
        if(type=="1"){
            $("#jobName").hide();
        }else {
            $("#jobName").show();
        }
    }

    function show_resource(page) {
        if(value==""||value==undefined){
            return false;
        }

        var type = $("#type").val();
        if(type=="1"){
            show_preach(page);
        }else {
            show_jobs(page);
        }
    }


    function show_one_preach(preach) {
        $("#update_preach input").val("");
        $("#update_preach textarea").val("");
        KindEditor.instances[0].html("");
        $("#preachId").val(preach.preachId);
        $("#companyName1").val(preach.companyName);
        $("#address").val(preach.address);
        $("#introduction").val(preach.introduction);
        $("#startTime").val(preach.startTime);
        $("#endTime").val(preach.endTime);
        editor1.html(preach.content);
        $("#status1").val(preach.status);
    }

    function show_one_job(job) {
        $("#update_job input").val("");
        $("#update_job textarea").val("");
        KindEditor.instances[0].html("");
        $("#jobId").val(job.jobId);
        $("#companyName2").val(job.companyName);
        $("#introduction2").val(job.introduction);
        $("#jobName2").val(job.jobName);
        $("#category").val(job.category);
        $("#address2").val(job.address);
        $("#money").val(job.money);
        $("#jobWelfare").val(job.jobWelfare);
        $("#educational").val(job.educational);
        $("#endTime2").val(job.endTime);
        editor2.html(job.jobDescribe);
        $("#status2").val(job.status);
    }

    function updatePreach() {
        $("#update_preach h5").text("");

        var companyName = $("#companyName1").val();
        if(companyName==""){
            $("#nameH5").text("请输入公司名称！");
            $("#companyName1").focus();
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
                data:$("#update_preach").serialize(),
                type:"POST",
                success:function (result) {
                    if(result.flag=="200"){
                        layer.msg('发布成功！', {icon: 1});
                        $("#updatePreach").modal('hide');
                        show_resource(1);
                    }else{
                        layer.msg('申请失败，请重试！', {icon: 2});
                    }
                },
                error:function () {
                    layer.msg('服务请求超时！！！', {icon: 5});
                }
            });


        });

    }
    function updateJob() {
        $("#update_job h5").text("");

        var companyName = $("#companyName2").val();
        if(companyName==""){
            $("#h5Company").text("请输入公司名称！");
            $("#companyName2").focus();
            return false;
        }

        var introduction = $("#introduction2").val();
        if(introduction==""){
            // $("#introduction").next("h5").text("请输入公司简介！");
            $("#h5Introduction").append("<font color='red'>请输入公司简介</font>");
            $("#introduction2").focus();
            return false;
        }else if(introduction.length>400){
            // $("#introduction").next("h5").text("字数已超过限制！");
            $("#h5Introduction").append("<font color='red'>字数已超过限制</font>");
            $("#introduction2").focus();
            return false;
        }


        var jobName = $("#jobName2").val();
        if(jobName==""){
            $("#h5Name").text("请输入职位名称！");
            $("#jobName2").focus();
            return false;
        }

        var category = $("#category").val();
        if(category==""){
            $("#h5Cate").text("请选择职位类别！");
            $("#category").focus();
            return false;
        }

        var address =$("#address2").val();
        if(address==""){
            $("#h5Add").text("请输入工作地点！");
            $("#address2").focus();
            return false;
        }

        var money =$("#money").val();
        if(money==""){
            $("#h5Money").text("请输入工作薪酬！");
            $("#money").focus();
            return false;
        }
        var jobWelfare = $("#jobWelfare").val();
        if(jobWelfare ==""){
            $("#h5Wel").text("请输入工作福利！");
            $("#jobWelfare").focus();
            return false;
        }
        var educational = $("#educational").val();
        if(educational==""){
            $("#h5Edu").text("请选择学历要求！");
            $("#educational").focus();
            return false;
        }

        var endTime = $("#endTime2").val();
        if(endTime==""){
            $("#h5Time").text("请输入截止日期！");
            $("#endTime2").focus();
            return false;
        }

        editor2.sync();
        var describe = $("#jobDescribe").val();
        if(describe==""){
            $("#jobDescribe").next("h5").text("请输入职业描述！");
            $("#jobDescribe").focus();
            return false;
        }



        layer.confirm("是否确认修改？",{btn:['确定','取消'],title:"提示"},function () {
            $.ajax({
                url:"job/insertOrUpdate",//教师发布在线招聘url
                data:$("#update_job").serialize(),
                type:"POST",
                success:function (result) {
                    if(result.flag=="200"){
                        layer.msg('发布成功！', {icon: 1});
                        $("#updateJob").modal('hide');
                        show_resource(1);
                    }else{
                        layer.msg('发布失败，请重试！', {icon: 2});
                    }
                },
                error:function () {
                    layer.msg('服务请求超时！！！', {icon: 2});
                }
            });
        });
    }


    function deletePreach() {

        var preachId = $("#preachId").val();
        if(preachId==""||preachId==undefined){
            return false;
        }
        layer.confirm("是否确认删除？",{btn:['确定','取消'],title:"提示"},function () {
            $.ajax({
                url: "<%request.getContextPath();%>/preach/deletePreach",
                data: "preachId=" + preachId,
                type: "GET",
                success: function (result) {
                    console.log(result);
                    if (result.flag == "200") {
                        layer.msg('删除成功！', {icon: 1});
                        $("#updatePreach").modal('hide');
                        show_resource(1);
                    } else {
                        layer.msg('删除失败，请重试', {icon: 2});
                    }
                }
            });
        });
    }


    function deleteJob() {
        var jobId = $("#jobId").val();
        if(jobId==""||jobId==undefined){
            return false;
        }
        layer.confirm("是否确认删除？",{btn:['确定','取消'],title:"提示"},function () {
            $.ajax({
                url: "<%request.getContextPath();%>/job/deleteJob",
                data: "jobId=" + jobId,
                type: "GET",
                success: function (result) {
                    console.log(result);
                    if (result.flag == "200") {
                        layer.msg('删除成功！', {icon: 1});
                        $("#updateJob").modal('hide');
                        show_resource(1);
                    } else {
                        layer.msg('删除失败，请重试', {icon: 2});
                    }
                }
            });
        });
    }






    function show_preach(page) {
        var status = $("#status").val();
        var data="status="+status+"&rows=5&page="+page+"&sendId="+value;
        var companyName= $("#companyName").val();
        if(companyName!=""&&companyName!=undefined){
            data+="&companyName="+companyName;
        }
        $.ajax({
            url:"<%request.getContextPath();%>/preach/selectByCondition",
            data:data,
            type:"GET",
            success:function (result) {
                console.log(result);
                $("#show").empty();
                $("#page_info_area").empty();
                $("#page_nav_area").empty();
                if(result.flag=="200") {
                    build_preach_table(result);
                    build_page_info(result);
                    build_page_nav(result);
                }else{
                    var div=$("<div style='color: grey' align='center'></div>").append("暂无记录");
                    div.appendTo("#show");
                }
            }


        });
    }

    function show_jobs(page) {
        var status = $("#status").val();
        var data="status="+status+"&rows=5&page="+page+"&sendId="+value;
        var companyName = $("#companyName").val();
        if(companyName!=null&&companyName!=""){
            data+="&companyName="+companyName;
        }
        var jobName = $("#jobName").val();
        if(jobName!=null&&jobName!=""){
            data+="&jobName="+jobName;
        }
        $.ajax({
            url:"<%request.getContextPath();%>/job/searchByCondition",
            data:data,
            type:"GET",
            success:function (result) {
                console.log(result);
                $("#show").empty();
                $("#page_info_area").empty();
                $("#page_nav_area").empty();
                if(result.flag=="200") {//查询成功
                    //alert("111");

                    build_job_table(result);
                    build_page_info(result);
                    build_page_nav(result);
                }else{

                    var div=$("<div style='color: grey' align='center'></div>").append("暂无记录");
                    div.appendTo("#show");
                }

            }

        });
    }

    function searchMy() {
        show_resource(1);
    }


    //解析宣讲会数据
    function build_preach_table(result){
        $("#show").empty();
        var preach = result.pageInfo.list;
        $.each(preach, function (index, res) {
            var div = $("<div style=\"margin-left: 10px;height: 80px\"></div>").addClass("list-group-item");
            var data = res.startTime.split("-");
            var month = data[1] + "月</br>";
            var data2 = data[2].split(" ");
            var day = data2[0];
            var time = data2[1];
            var divDay = $("<div style=\"border:1px solid #eee;width:10%;float:left;height:60px;line-height:30px;text-align:center;font-size: 20px;color: orangered\"></div>").append(month + day + "日");
            var divData = $("<div style=\"width:90%;float:left;\"></div>");
            var divD1 = $("<div style=\"width: 100%\"></div>");
            var divD11 = $("<a href=\'<%request.getContextPath();%>preachDetails.jsp?id=" + res.preachId + "\' style=\"font-size: 20px;padding-left: 20px;padding-top: 5px; width: 85%;float: left\"></a>").append(res.companyName + "宣讲会");

            var divD12 = $("<div style=\"font-size: 15px; width: 15%;float: right;\"></div>");
            var divD121 = $("<span style=\"color: firebrick\"></span>").addClass("glyphicon glyphicon-time").append(time);
            divD12.append(divD121);
            divD1.append(divD11).append(divD12);
            var divD2 = $("<div style=\"width: 100%\"></div>");
            var divD21 = $("<div style=\"font-size: 15px;padding-left: 20px;padding-top: 5px; width: 65%;float: left;color: #6a6a6a\"></div>");
            var divD211 = $("<span></span>").addClass("glyphicon glyphicon-map-marker").append(res.school + res.address);

            var divD2111 = $("<div style=\"font-size: 15px; width: 20%;float: left;\"></div>");
            var sup ;
            if(res.status=="1"){
                sup = $("<font style=\"background-color: blue\" color='white' >显示</font>");
            }else if(res.status=="2"){
                sup =$("<font style=\"background-color: black\" color='white' >不显示</font>");
            }else{
                sup=$("<font style=\"background-color: black\" color='white' >>其他</font>");
            }
            divD2111.append(sup);

            var divD22 = $("<div style=\"font-size: 15px; width: 15%;float: right;\"></div>");
            var preachId=res.preachId;
            var divD221 = $("<a href=\'javascript:editPreach("+preachId+")\'></a>").addClass("btn btn-danger btn-sm").append("点击操作");
            divD21.append(divD211);
            divD22.append(divD221);
            divD2.append(divD21).append(divD2111).append(divD22);
            divData.append(divD1).append(divD2);
            div.append(divDay).append(divData);
            div.appendTo("#show");
        });

    }

    function build_job_table(result) {
        $("#show").empty();
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
            // var divD23 = $("<div style=\"width: 10%;float: right\"></div>").append("<a href=\'javascript:editJob("+item.jobId+")\'></a>").addClass("btn btn-danger btn-sm").append("点击操作");
            var sup ;
            if(item.status=="1"){
                sup = $("<font style=\"background-color: blue\" color='white'>显示</font>");
            }else if(item.status=="2"){
                sup =$("<font style=\"background-color: black\" color='white'>不显示</font>");
            }else{
                sup=$("<font style=\"background-color: black\" color='white'>>其他</font>");
            }
            var divD23 = $("<div style=\"width: 10%;float:left\"></div>").append(sup);
            var divD24 = $("<a href=\'javascript:editJob("+item.jobId+")\' style=\"width: 10%;float: right\"></a>").addClass("btn btn-danger btn-sm").append("点击操作");
            divD2.append(divD21).append(divD22).append(divD23).append(divD24);
            var divD3 = $("<div style=\"width: 100%;padding-top: 10px;\"></div>");
            var divD31 = $("<div style=\"width: 30%;float: left;color: #6a6a6a\"></div>").append("<span></span>").addClass("glyphicon glyphicon-map-marker").append(item.address);
            var divD32 = $("<div style=\"width: 50%;float: left;color: #6a6a6a\"></div>").append(item.educational);
            var divD33 = $("<div style=\"width: 20%;float: right;\"></div>").append("<span></span>").addClass("glyphicon glyphicon-eye-open").append(item.click);
            divD3.append(divD31).append(divD32).append(divD33);
            div.append(divD1).append(divD2).append(divD3);
            div.appendTo("#show");

        });
    }



    function build_page_info(result){
        $("#page_info_area").empty();
        $("#page_info_area").append("当前 "+result.pageInfo.pageNum+" 页,总 "+
            result.pageInfo.pages+" 页,共 "+
            result.pageInfo.total+" 条记录");
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
                show_resource(1);
            });
            prePageLi.click(function(){
                show_resource(result.pageInfo.pageNum -1);
            });
        }




        var nextPageLi = $("<li></li>").append($("<a></a>").append("&raquo;"));
        var lastPageLi = $("<li></li>").append($("<a></a>").append("末页"));
        if(result.pageInfo.hasNextPage == false){
            nextPageLi.addClass("disabled");
            lastPageLi.addClass("disabled");
        }else{
            nextPageLi.click(function(){
                show_resource(result.pageInfo.pageNum +1);
            });
            lastPageLi.click(function(){
                show_resource(result.pageInfo.pages);
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
                show_resource(item);
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
<%!
    private String htmlspecialchars(String str) {
        str = str.replaceAll("&", "&amp;");
        str = str.replaceAll("<", "&lt;");
        str = str.replaceAll(">", "&gt;");
        str = str.replaceAll("\"", "&quot;");
        return str;
    }
%>