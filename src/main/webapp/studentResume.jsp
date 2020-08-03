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
    <script type="text/javascript" src="<%request.getContextPath();%>/static/layer_v3.1.1/3.1.1/layer.js"></script>


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
                            <li title="注册"><a href="register.jsp"><span class="glyphicon glyphicon-user"></span> 注册</a>
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
                <h4>个人中心 <sup style="border-radius: 5px;font-size: 15px;background-color: #c7ddef;color: blue">学生</sup></h4>
                <li style="display:block">
                    <a class="list-group-item " title="我的信息" href="studentInfo.jsp">我的信息</a>
                </li>
                <li style="display:block">
                    <a class="list-group-item" title="已投递岗位" href="studentSend.jsp">已投递岗位</a>
                </li>
                <li style="display:block">
                    <a class="list-group-item" title="已关注宣讲会" href="studentFollow.jsp">已关注宣讲会</a>
                </li>
                <li style="display:block">
                    <a class="list-group-item" title="填写就业信息" href="studentEmployment.jsp">填写就业信息</a>
                </li>
                <li style="display:block">
                    <a class="list-group-item active" title="个人简历" >个人简历</a>
                </li>
            </ul>
        </div>

        <div class="col-md-10">

            <div>
                <h3>我的简历</h3>
            </div>

            <div class="panel panel-default ">
                <div class="container">

                    <div style="margin: 20px;height: 300px">


                        <form  class="col-md-9 form-horizontal"  id="resume" >

                            <div style="height: 100px">

                            </div>
                             <input type="text" id="studentId" name="studentId" value="${currentUser.id}" hidden/>
                            <div class="form-group" id="loadResume"  hidden>
                                <label class="col-sm-2 control-label">上传简历：</label>
                                <div class="col-sm-4">
                                    <input type="file"  id="resumeFile" onchange="upload_file()"/>
                                    <input type="text" id="resumeUrl" name="resumeUrl" hidden>
                                    <input type="text" id="resumeName" name="resumeName" hidden>
                                    <h5  id="resumeH5" class="help-block" style="color: red"></h5>
                                </div>
                                <div align="center">
                                    <button type="button" class="btn btn-primary" id="load">上传</button>
                                    <button type="button" class="btn btn-default" id="cancel">取消</button>
                                </div>
                            </div>
                            <div class="form-group" id="myResume" hidden>
                                <label class="col-sm-2 control-label">我的简历：</label>
                                <div class="col-sm-7" style="padding-top: 9px">
                                   <span id="resume_name" style=""></span>
                                   <span id="create_time" style="margin-left: 20px"></span>
                                    <input id="resume_url" name="resume_url" hidden/>
                                </div>
                                <div align="center">
                                    <button type="button" class="btn btn-default" id="download">下载简历</button>
                                    <button type="button" class="btn btn-default" id="reload">更新简历</button>
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


    $(function () {
      load_view();
    });


    function load_view(){
        var id="${currentUser.id}";
        $("#resumeH5").text("");
        $("#loadResume input").val("");
        $("#myResume span").text("");
        $("#loadResume").hide();
        $("#myResume").hide();
        $("#resume_url").val("");
        if(id==""||id==undefined){

             return false;
        }
        $.ajax({
            url:"resume/searchById",//查询学生简历的url
            data:"studentId="+id,
            type:"GET",
            success:function (result) {
                if(result.flag=="200"){
                    load_resume(result.resume);
                }else{
                     $("#loadResume").show();
                }
            },
            error:function () {
                layer.msg("连接服务器超时，请稍后再试！",{icon:5});
            }
        });
    }

    function load_resume(resume){
        $("#myResume").show();
        $("#resume_name").text(resume.resumeName);
        $("#create_time").text(resume.createTime);
        $("#resume_url").val(resume.resumeUrl);
    }


    $("#load").click(function () {//上传
       var resumeName = $("#resumeName").val();
       var resumeUrl = $("#resumeUrl").val();
       if(resumeName==""||resumeUrl==""){
           $("#resumeH5").text("请添加简历文件！");
           return false;
       }

        layer.confirm("是否确认上传？",{btn:['确认','取消'],title:"提示"},function () {
            $.ajax({
                url:"resume/insertOrUpdate",//上传简历url
                data:$("#resume").serialize(),
                type:"POST",
                success:function (result) {
                    if(result.flag=="200"){
                        layer.msg("上传成功！",{icon:1});
                        load_view();
                    }else{
                        layer.msg("上传失败，请重试！！",{icon:2});
                    }
                },
                error:function () {
                    layer.msg("连接服务器超时，请稍后再试！",{icon:5});
                }
            });
        });
    });




    $("#cancel").click(function () {//取消
        load_view();
    });

    $("#reload").click(function () {//更新简历
      $("#loadResume").show();
        $("#myResume").hide();
    });

    $("#download").click(function () {//下载简历
        var url=$("#resume_url").val();
        if(url==""||url==undefined){
            layer.msg("下载失败，请刷新后重试！",{icon:2});
            return false;
        }
        window.location.href="file/downFile?url="+url;
        // window.location.href="dowmResume?id="+id;

    });


    function upload_file() {
        var id = $("#resumeFile");
        $("#resumeH5").text("");
        var files =id.prop('files');
        var data=new FormData();
        data.append('resumeFile',files[0]);
        $.ajax({
            url: "/file/addResume",
            type: "POST",
            data: data,
            cache: false,
            processData: false,
            contentType: false,
            success: function (result) {
                if (result.flag == "200") {
                    $("#resumeName").val(result.name);
                    $("#resumeUrl").val(result.url);
                } else {
                    $("#resumeH5").text("上传失败，请重新上传！");
                    $("#resumeName").val("");
                    $("#resumeUrl").val("");
                }
            }
        });
    }

</script>
</body>
</html>
