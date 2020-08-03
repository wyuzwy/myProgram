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
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
                    <a class="list-group-item active" title="我的信息" >我的信息</a>
                </li>
                <li style="display:block">
                    <a class="list-group-item" title="查询所有发布" href="teacherSearch.jsp">查询所有发布</a>
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
                <table style="width: 900px">
                    <tr>
                        <td style="width: 500px"><h3>${currentUser.userDept}</h3></td>

                        <td style="width: 400px;margin-bottom: 2px" align="right"><a style="color: #2446AB" href="javascript:void(0);"  onClick="upload_pw_modal()">修改密码</a></td>
                    </tr>
                </table>
            </div>

            <div class="panel panel-default ">
                <div class="container">

                    <div style="margin: 20px;height: 550px">

                        <form  class="col-md-9 form-horizontal"  id="editTeacher" >

                            <div class="form-group">
                                <label class="col-sm-2 control-label">帐号：</label>
                                <div class="col-sm-4">
                                    <input type="text" readonly class="form-control" name="teacherId" id="teacherId" value="${currentUser.id}"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">姓名：</label>
                                <div class="col-sm-4">
                                    <input type="text" class="form-control" name="teacherName" id="teacherName" readonly value="${currentUser.userName}"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">学院：</label>
                                <div class="col-sm-4">
                                    <input type="text" class="form-control" name="teacherDept" id="teacherDept" readonly value="${currentUser.userDept}"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">手机号码：</label>
                                <div class="col-sm-4">
                                    <input type="text" class="form-control" name="teacherPhone" id="teacherPhone" readonly/>
                                </div>
                                <div class="col-sm-3">
                                    <h5 id="phoneH5"  class="help-block" style="color: red "></h5>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">座机号码：</label>
                                <div class="col-sm-4">
                                    <input type="text" class="form-control" name="teacherTelephone" id="teacherTelephone" readonly/>
                                </div>
                                <div class="col-sm-3">
                                    <h5 id="telephoneH5"  class="help-block" style="color: red "></h5>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-offset-2 col-sm-10">
                                    <button type="button" class="btn btn-default" id="update_btn">编辑</button>
                                    <button type="button" class="btn btn-primary" id="save_btn">保存</button>
                                    <a  href="javascript:location.reload();" class="btn btn-default" id="cancel_btn">取消</a>
                                </div>
                            </div>
                        </form>
                    </div>


                </div>
            </div>


        </div>


    </div>
</section>
<%--修改密码模态框--%>
<div class="modal fade" id="upload_pw_modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel2" aria-hidden="true">
    <div class="modal-dialog" style="width: 400px">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="myModalLabel2">
                    <span style="color: green">修改密码</span>
                </h4>
            </div>
            <div class="modal-body" >

                <form id="pw">
                    <table style="margin-left: 20px">
                        <tbody>
                        <tr>
                            <th style="width: 70px">
                                旧&nbsp;&nbsp;密&nbsp;&nbsp;码:
                            </th>
                            <th>
                                <input type="password" id="password" name="password" style="width: 150px"/>
                            </th>
                            <th>
                                <h5  class="help-block" id="old" style="color: red"></h5>
                            </th>
                        </tr>
                        <tr style="margin-top: 10px;margin-top: 10px">
                            <th style="width: 70px">
                                新&nbsp;&nbsp;密&nbsp;&nbsp;码：
                            </th>
                            <th style="margin-top: 10px">
                                <input type="password" id="newPassword" name="newPassword" style="width: 150px"/>
                            </th>
                            <th style="margin-top: 10px">
                                <h5 id="new"  class="help-block" style="color: red"></h5>
                            </th>
                        </tr>
                        <tr>
                            <th style="width: 70px;margin-top: 10px">
                                确认密码：
                            </th>
                            <th style="margin-top: 10px">
                                <input type="password" id="confirm_Password" style="width: 150px"/>
                            </th>
                            <th style="margin-top: 10px">
                                <h5 id="confirm" class="help-block" style="color: red"></h5>
                            </th>
                        </tr>
                        <tr>
                            <th>
                                <input type="text" id="id" name="id" hidden/>
                            </th>
                        </tr>
                        </tbody>
                    </table>

                </form>

            </div>

            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                </button>
                <button type="button" class="btn btn-primary" id="upload_pw">
                    提交更改
                </button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>

<script type="text/javascript">

    $("#update_btn").click(function () {
        $("#save_btn").show();
        $("#update_btn").hide();
        $("#cancel_btn").show();
        $("#teacherPhone").attr("readonly",false);
        $("#teacherTelephone").attr("readonly",false);
    });

    $(function () {
        var id="${currentUser.role}";
        if(id!="2"){
            window.location.href = "index.jsp";
        }
        $("#save_btn").hide();
        $("#update_btn").show();
        $("#cancel_btn").hide();
        loadView();
    });

    function loadView(){
        var id="${currentUser.id}";
        if(id==""|| id==undefined){
            return false;
        }
        $.ajax({
            url:"/teacher/searchInfoById",//查询教师个人信息url
            data:"teacherId="+id,
            type:"GET",
            success:function (result) {
                if(result.flag=="200"){
                    $("#teacherPhone").val(result.teacher.teacherPhone);
                    $("#teacherTelephone").val(result.teacher.teacherTelephone);
                }
            }
        });
    }



    $(document).on("click","#save_btn",function () {
        $("#editTeacher h5").text("");

        var id = $("#teacherId").val();
        if(id==""){
            layer.msg("请重新登录！", {icon: 5});
            return false;
        }


        var phone = $("#teacherPhone").val();
        var resPhone = /^1(3|4|5|6|7|8|9)\d{9}$/;
        if(phone==""){
            $("#phoneH5").text("请填写手机号码！");
            $("#teacherPhone").focus();
            return false;
        }else if(!resPhone.test(phone)){
            $("#phoneH5").text("请填写正确的手机号码！");
            $("#phone").focus();
            return false;
        }

        var telephone = $("#teacherTelephone").val();
        var resTele = /(^(0[0-9]{2,3}\-)?([2-9][0-9]{6,7})+(\-[0-9]{1,4})?$)/;
        if(telephone==""){
            $("#telephoneH5").text("请填写座机号码！");
            $("#teacherTelephone").focus();
            return false;
        }else if(!resTele.test(telephone)){
            $("#telephoneH5").text("请填写正确的座机号码！");
            $("#teacherTelephone").focus();
            return false;
        }



        layer.confirm("是否确认修改？", {btn: ['确定', '取消'], title: "提示"}, function () {
            $.ajax({
                url: "/teacher/insertOrUpdate",//修改老师信息url
                type: "POST",
                data: $("#editTeacher").serialize(),
                success: function (result) {
                    if(result.flag=="200") {
                        layer.msg(result.msg, {icon: 1});
                        window.location.reload();
                    }else{
                        layer.msg('操作失败，请重试！', {icon: 2});
                    }
                },
                error:function () {
                    layer.msg('请求超时，请稍后。。。', {icon: 5});
                }
            });
        });
    });


    //打开修改密码模态框
    function upload_pw_modal(){
        $("#upload_pw_modal").modal('show');
        $("#pw input").val("");
    }

    //修改密码
    $("#upload_pw").click(function () {
        $("#pw h5").empty();

        var id = "${currentUser.id}";
        $("#id").val(id);

        var password = $("#password").val();
        if(password==""){
            $("#old").append("请输入旧密码！");
            $("#password").focus();
            return false;
        }

        var newPassword = $("#newPassword").val();
        var regPass =  /(^[a-zA-Z0-9_-]{6,12}$)/;
        if(newPassword==""){
            $("#new").append("请输入新密码！");
            $("#newPassword").focus();
            return false;
        }else if(!regPass.test(newPassword)) {
            $("#new").append("密码必须为6-12位英文或数字！");
            $("#newPassword").focus();
            return false;
        }

        if(password==newPassword){
            $("#new").append("新密码不能与原来的密码一致！");
            $("#newPassword").focus();
            return false;
        }

        var confirm_password = $("#confirm_Password").val();
        if(confirm_password==""){
            $("#confirm").append("请输入确认密码！");
            $("#confirm_Password").focus();
            return false;
        }else if(confirm_password != newPassword){
            $("#confirm").append("两次密码不一致，请重新输入!");
            $("#confirm_Password").focus();
            return false;
        }
        layer.confirm("是否确认修改？",{btn:['确定','取消'],title:"提示"},function () {
            $.ajax({
                url:"/updatePwd",
                type:"POST",
                data:$("#pw").serialize(),
                success:function (result) {
                    if(result.flag=="200"){
                        layer.msg('操作成功', {icon: 1});
                        $("#upload_pw_modal").modal('hide');
                    }else{
                        layer.msg(result.msg, {icon: 2});
                    }
                }
            });
        });

    });

</script>
</body>
</html>
