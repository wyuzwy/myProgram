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
    String htmlData = request.getParameter("introduction") != null ? request.getParameter("introduction") : "";
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
    <link rel="stylesheet" href="<%request.getContextPath();%>/static/kindeditor/themes/default/default.css" />
    <link rel="stylesheet" href="<%request.getContextPath();%>/static/kindeditor/plugins/code/prettify.css" />
    <script charset="utf-8" src="<%request.getContextPath();%>/static/kindeditor/kindeditor.js"></script>
    <script charset="utf-8" src="<%request.getContextPath();%>/static/kindeditor/lang/zh-CN.js"></script>
    <script charset="utf-8" src="<%request.getContextPath();%>/static/kindeditor/plugins/code/prettify.js"></script>
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
                <h4>个人中心<sup style="border-radius: 5px;font-size: 15px;background-color: gray;color: yellow">企业</sup></h4>
                <li style="display:block">
                    <a class="list-group-item active" title="我的信息" >我的信息</a>
                </li>
                <li style="display:block">
                    <a class="list-group-item" title="查询所有发布" href="companySearch.jsp">查询所有发布</a>
                </li>
                <li style="display:block">
                    <a class="list-group-item" title="宣讲会申请" href="companyPreach.jsp">申请宣讲会</a>
                </li>
                <li style="display:block">
                    <a class="list-group-item" title="发布在线招聘" href="companyJob.jsp">发布在线招聘</a>
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

                    <div style="margin: 20px">

                        <form  class="col-md-9 form-horizontal"  id="companyInfo" >
                            <div class="form-group">
                                <label  class="col-sm-2 control-label">公司名称：</label>
                                <div class="col-sm-4 ">
                                    <div  id="companyName" style="margin-top: 7px"></div>
                                    <%--<input type="text" readonly class="form-control" name="uId" id="user_id" value="${currentUser.userId}"/>--%>

                                </div>
                                <label  class="col-sm-2 control-label">公司邮箱：</label>
                                <div class="col-sm-4 ">
                                    <div id="company_email" style="margin-top: 7px"></div>

                                </div>
                            </div>
                            <div class="form-group">
                                <label for="userName1" class="col-sm-2 control-label">用户姓名：</label>
                                <div class="col-sm-4 ">
                                    <div  id="userName1" style="margin-top: 7px"></div>
                                </div>
                                <label for="phone1" class="col-sm-2 control-label">手机号码：</label>
                                <div class="col-sm-4 ">
                                    <div id="phone1" style="margin-top: 7px"></div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="address" class="col-sm-2 control-label">公司地址：</label>
                                <div class="col-sm-4 ">
                                    <div  id="address" style="margin-top: 7px"></div>
                                </div>
                                <label for="job_email" class="col-sm-2 control-label">更新于：</label>
                                <div class="col-sm-4 ">
                                    <div id="update_time" style="margin-top: 7px"></div>
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="telephone1" class="col-sm-2 control-label">固定电话：</label>
                                <div class="col-sm-4 ">
                                    <div  id="telephone1" style="margin-top: 7px"></div>
                                </div>
                                <label for="job_email" class="col-sm-2 control-label">招聘邮箱：</label>
                                <div class="col-sm-4 ">
                                    <div id="job_email" style="margin-top: 7px"></div>
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="company_property" class="col-sm-2 control-label">单位性质：</label>
                                <div class="col-sm-4 ">
                                    <div  id="company_property" style="margin-top: 7px"></div>
                                </div>
                                <label for="company_category" class="col-sm-2 control-label">所属行业：</label>
                                <div class="col-sm-4 ">
                                    <div id="company_category" style="margin-top: 7px"></div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="scale" class="col-sm-2 control-label">单位规模：</label>
                                <div class="col-sm-4 ">
                                    <div  id="scale" style="margin-top: 7px"></div>
                                </div>
                                <label for="register_money" class="col-sm-2 control-label">注册资金：</label>
                                <div class="col-sm-4 ">
                                    <div id="register_money" style="margin-top: 7px"></div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="introduction1" class="col-sm-2 control-label">公司简介：</label>
                                <div class="col-sm-9 panel panel-default">
                                    <div  id="introduction1" style="margin-top: 7px">

                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="logo1" class="col-sm-2 control-label">企业logo：</label>
                                <div class="col-sm-4 ">
                                    <img src=""  id="logo1" style="margin-top: 7px;width: 50px;height: 50px">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="company_license" class="col-sm-2 control-label">营业执照：</label>
                                <div class="col-sm-4 ">
                                    <img src="" id="company_license" style="margin-top: 7px;width: 150px;height: 200px">
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-offset-4 col-sm-10">
                                    <button type="button" class="btn btn-primary btn-lg" id="edit_btn">修改信息</button>
                                </div>
                            </div>
                        </form>
                    </div>


                </div>
            </div>


        </div>


    </div>
</section>

<%--修改个人信息模态框--%>
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog" style="width: 800px">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="myModalLabel">
                    修改个人信息
                </h4>
            </div>
            <div class="modal-body" >
                <form id="upload">
                    <div>
                        <input type="text"  name="companyEmail" id="companyEmail" style="width: 200px" hidden/>
                    </div>
                    <div style="margin-left: 20px;width: 250px">
                        <label>用户姓名：</label>
                        <div><input type="text"  name="userName" id="userName" style="width: 200px" />
                        <h5  class="help-block" style="color: red"></h5>
                        </div>
                    </div>
                    <div style="margin-top: 10px;margin-left: 20px;width: 250px">
                        <label>手机号码：</label>
                        <div>
                            <input type="text" class="form-control" name="phone" id="phone"  style="width: 200px"/>
                            <h5  class="help-block" style="color: red"></h5>
                        </div>
                    </div>
                    <div style="margin-top: 10px;margin-left: 20px;width: 250px">
                        <label>固定电话：</label>
                        <div><input type="text" class="form-control" name="telephone" id="telephone"  style="width: 200px"/>
                            <h5  class="help-block" style="color: red"></h5>
                        </div>
                    </div>
                    <div style="margin-top: 10px;margin-left: 20px;width: 250px">
                        <label>招聘邮箱：</label>
                        <div><input type="text" class="form-control" name="jobEmail" id="jobEmail" style="width: 200px"/>
                            <h5  class="help-block" style="color: red"></h5>
                        </div>
                    </div>
                    <%--<div style="margin-top: 10px;margin-left: 20px">--%>
                       <%----%>
                    <%--</div>--%>
                    <div style="margin-left: 20px;width: 700px;">
                        <label>公司简介：</label>
                        <div>
                        <textarea  id="introduction" name="introduction" cols="50" rows="8" style="width:675px;height: 400px; visibility: hidden;" ><%=htmlspecialchars(htmlData)%></textarea>
                            <h5  class="help-block" style="color: red"></h5>
                        </div>
                    </div>
                    <div style="margin-top: 10px;margin-left: 20px;width: 250px">
                        <label>企业logo：</label>
                        <div>
                            <input accept="image/*" type="file"  id="logo_file" onchange="upload_img('logo_file','logo_show','logo')"/>
                            <img src="" id="logo_show" class="img-rounded" style="margin-top: 7px;width: 50px;height: 50px" hidden>
                            <input type="text" id="logo" name="logo" hidden>
                            <h5  class="help-block" style="color: red"></h5>
                        </div>
                    </div>
                    <div style="margin-top: 10px;margin-left: 20px;width: 250px">
                        <label>营业执照</label>
                        <div>
                            <input accept="image/*" type="file"   id="license_file" onchange="upload_img('license_file','license_show','companyLicense')" />
                            <img src="" id="license_show" class="img-rounded" style="margin-top: 7px;width: 150px;height: 200px" hidden>
                            <input type="text" id="companyLicense" name="companyLicense" hidden>
                            <h5  class="help-block" style="color: red"></h5>
                        </div>
                    </div>
                </form>
            </div>

            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                </button>
                <button type="button" class="btn btn-primary" id="upload_btn">
                    提交更改
                </button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>


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
    var editor1;
    KindEditor.ready(function(K) {
        editor1 = K.create('textarea[name="introduction"]', {
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


    $(function () {
        var id="${currentUser.role}";
        if(id!="3"){
            window.location.href = "index.jsp";
        }
        firstIn();
    });

    function firstIn() {
        emptyDiv();
        var companyEmail = "${currentUser.id}"
        $.ajax({
            url:"/company/searchInfoById",
            data:"companyEmail="+companyEmail,
            type:"GET",
            success:function (result) {
                if(result.flag=="200"){
                    showMessage(result.company);
                }else{
                    window.location.href = "login.jsp";
                    layer.msg("登录已超时，请重新登录！", {
                        time : 3000
                    });
                }


            }
        });
    }

    function showMessage(company) {
        $("#companyName").append(company.companyName);
        $("#company_email").append(company.companyEmail);
        $("#userName1").append(company.userName);
        $("#phone1").append(company.phone);
        $("#address").append(company.provinces+company.city+company.address);
        $("#update_time").append(company.updateTime);
        $("#telephone1").append(company.telephone);
        $("#job_email").append(company.jobEmail);
        $("#company_property").append(company.companyProperty);
        $("#company_category").append(company.companyCategory);
        $("#scale").append(company.scale);
        $("#register_money").append(company.registerMoney);
        $("#introduction1").append(company.introduction);
        $("#logo1").attr("src",company.logo);
        $("#company_license").attr("src",company.companyLicense);

    }
    function emptyDiv() {
        $("#companyName").empty();
        $("#company_email").empty();
        $("#userName1").empty();
        $("#phone1").empty();
        $("#address").empty();
        $("#update_time").empty();
        $("#telephone1").empty();
        $("#job_email").empty();
        $("#company_property").empty();
        $("#company_category").empty();
        $("#scale").empty();
        $("#register_money").empty();
        $("#introduction1").empty();
        $("#logo1").attr("src","");
        $("#company_license").attr("src","");
    }

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




    $("#edit_btn").click(function () {
        var  companyEmail ="${currentUser.id}";
        if(companyEmail==""||companyEmail=="undefined"){
            layer.msg('登录超时，请重新登录', {icon: 5});
            return false;
        }
            $("#myModal").modal('show');
            $("#upload input").val("");
            $("#upload img").attr('src',"");
            KindEditor.instances[0].html("");

        $.ajax({
            url:"/company/searchInfoById",
            data:"companyEmail="+companyEmail,
            type:"GET",
            success:function (result) {
                if(result.flag=="200"){
                    showMessageInModel(result.company);
                }else{
                    window.location.href = "login.jsp";
                    layer.msg("登录已超时，请重新登录！", {
                        time : 3000
                    });
                }


            }
        });







    });


    //将数据回显到修改模态框
    function showMessageInModel(company){

        $("#companyEmail").val(company.companyEmail);
        $("#userName").val(company.userName);
        $("#phone").val(company.phone);
        $("#telephone").val(company.telephone);
        $("#jobEmail").val(company.jobEmail);
        editor1.html(company.introduction);
        $("#logo_show").attr("src",company.logo);
        $("#logo_show").show();
        $("#logo").val(company.logo);
        $("#license_show").attr("src",company.companyLicense);
        $("#license_show").show();
        $("#companyLicense").val(company.companyLicense)
    }


    $("#upload_btn").click(function () {
        $("#upload h5").text("");
        var u_name = $("#userName").val();
        if(u_name==""){
            // layer.msg('请输入用户名称！', {
            //     time : 1000
            // });
            $("#userName").next("h5").text("请输入用户名称！");
            $("#userName").focus();
            return false;
        }

        var phone = $("#phone").val();
        var resPhone = /^1(3|4|5|6|7|8|9)\d{9}$/;
        if(phone==""){
            // layer.msg('请输入手机号码！', {
            //     time : 1000
            // });
            $("#phone").next("h5").text("请输入手机号码！");
            $("#phone").focus();
            return false;
        }else if(!resPhone.test(phone)){
            // layer.msg('请输入有效的手机号码！', {
            //     time : 1000
            // });
            $("#phone").next("h5").text("请输入有效的手机号码！");
            $("#phone").focus();
            return false;
        }

        var telephone = $("#telephone").val();
        var resTele = /(^(0[0-9]{2,3}\-)?([2-9][0-9]{6,7})+(\-[0-9]{1,4})?$)/;
        if(telephone==""){
            // layer.msg('请输入电话号码！', {
            //     time : 1000
            // });
            $("#telephone").next("h5").text("请输入电话号码！");
            $("#telephone").focus();
            return false;
        } else if(!resTele.test(telephone)){
            //     layer.msg('请输入正确格式的电话号码！', {
            //         time : 1000
            //     });
            $("#telephone").next("h5").text("请输入正确格式的电话号码！");
            $("#telephone").focus();
            return false;
        }

        var j_email = $("#jobEmail").val();
        var resEmail= /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;
        if(j_email==""){
            // layer.msg('请输入招聘邮箱！', {
            //     time : 1000
            // });
            $("#jobEmail").next("h5").text("请输入招聘邮箱！");
            $("#jobEmail").focus();
            return false;
        }else if(!resEmail.test(j_email)){
            // layer.msg('请输入有效的邮箱！', {
            //     time : 1000
            // });
            $("#jobEmail").next("h5").text("请输入有效的邮箱！");
            $("#jobEmail").focus();
            return false;
        }

        editor1.sync();
        var introduction = $("#introduction").val();
        if(introduction==""){
            // layer.msg('请填写公司简介', {
            //     time : 1000
            // });
            $("#introduction").next("h5").text("请填写公司简介！");
            $("#introduction").focus();
            return false;
        }

        var logo = $("#logo").val();
        if(logo==""){
            // layer.msg('请上传企业logo！', {
            //     time : 1000
            // });
            $("#logo").next("h5").text("请上传企业logo！");
            $("#logo").focus();
            return false;
        }

        var c_license = $("#companyLicense").val();
        if(c_license==""){
            // layer.msg('请上传营业执照！', {
            //     time : 1000
            // });
            $("#companyLicense").next("h5").text("请上传营业执照！");
            $("#companyLicense").focus();
            return false;
        }

        layer.confirm("是否确认修改？",{btn:['确定','取消'],title:"提示"},function () {
            $.ajax({
                url:"/company/insertOrUpdate",//更新企业信息的url
                data:$("#upload").serialize(),
                type:"POST",
                success:function (result) {
                    if(result.flag=="200"){
                        layer.msg('操作成功', {icon: 1});
                        KindEditor.instances[0].html("");
                        // $('#upload').form('clear');
                        // $("#myModal").modal('hide');
                        window.location.reload();

                    }else{
                        layer.msg('操作失败，请重试！', {icon: 2});
                    }
                }
            });

            $("#myModal").modal('hide');
        });

    });

    //logo和营业执照上传
    function upload_img(id1,id2,id3) {
        var upload=$("#"+id1);
        var show_img = $("#"+id2);
        var set_value=$("#"+id3);
        upload.next("h5").text("");
        var files = upload.prop('files');
        var data=new FormData();
        data.append('img',files[0]);
        $.ajax({
            url:"/file/addImage",
            type:"POST",
            data:data,
            cache:false,
            processData:false,
            contentType:false,
            success:function (result) {
                console.log(result);
                if(result.flag=="200"){
                    // show_img.src = result.url;
                    show_img.attr('src',result.url);
                    set_value.val(result.url);
                    set_value.next("h5").text("");
                    show_img.show();
                }else{
                    upload.next("h5").text("上传失败，请重新上传！");
                    show_img.attr('src',"");
                    show_img.hide();
                    set_value.val("");
                }
            }
        });


    }

    // var provinces = ['请选择省份','北京市','上海市','天津市','重庆市','河北省','山西省','内蒙古省','辽宁省','吉林省','黑龙江省','江苏省','浙江省','安徽省','福建省','江西省','山东省','河南省','湖北省','湖南省','广东省','广西省','海南省','四川省','贵州省','云南省','西藏省','陕西省','甘肃省','宁夏省','青海省','新疆省','香港','澳门','台湾'];
    // var citys = [['请选择城市'],
    //     ["东城区", "西城区", "崇文区", "宣武区", "朝阳区", "丰台区", "石景山区", "海淀区", "门头沟区", "房山区", "通州区", "顺义区", "昌平区", "大兴区", "怀柔区", "平谷区", "密云县", "延庆县"],
    //     ["黄浦区", "卢湾区", "徐汇区", "长宁区", "静安区", "普陀区", "虹口区", "杨浦区", "闵行区", "宝山区", "嘉定区", "浦东新区", "金山区", "松江区", "青浦区", "南汇区", "奉贤区", "崇明县"],
    //     ["和平区", "河东区", "河西区", "南开区", "河北区", "红桥区", "塘沽区", "汉沽区", "大港区", "东丽区", "西青区", "津南区", "北辰区", "武清区", "宝坻区", "宁河县", "静海县", "蓟县"],
    //     ["万州区", "涪陵区", "渝中区", "大渡口区", "江北区", "沙坪坝区", "九龙坡区", "南岸区", "北碚区", "万盛区", "双桥区", "渝北区", "巴南区", "黔江区", "长寿区", "綦江县", "潼南县", "铜梁县", "大足县", "荣昌县", "璧山县", "梁平县", "城口县", "丰都县", "垫江县", "武隆县", "忠县", "开县", "云阳县", "奉节县", "巫山县", "巫溪县", "石柱土家族自治县", "秀山土家族苗族自治县", "酉阳土家族苗族自治县", "彭水苗族土家族自治县", "江津市", "合川市", "永川市", "南川市"],
    //     ["石家庄市","张家口市","承德市","秦皇岛市","唐山市","廊坊市","保定市","衡水市","沧州市","邢台市","邯郸市"],
    //     ["太原市","朔州市","大同市","阳泉市","长治市","晋城市","忻州市","晋中市","临汾市","吕梁市","运城市"],
    //     ["呼和浩特市","包头市","乌海市","赤峰市","通辽市","呼伦贝尔市","鄂尔多斯市","乌兰察布市","巴彦淖尔市","兴安盟","锡林郭勒盟","阿拉善盟"],
    //     ["沈阳市","朝阳市","阜新市","铁岭市","抚顺市","本溪市","辽阳市","鞍山市","丹东市","大连市","营口市","盘锦市","锦州市","葫芦岛市"],
    //     ["长春市","白城市","松原市","吉林市","四平市","辽源市","通化市","白山市","延边州"],
    //     ["哈尔滨市","齐齐哈尔市","七台河市","黑河市","大庆市","鹤岗市","伊春市","佳木斯市","双鸭山市","鸡西市","牡丹江市","绥化市","大兴安岭地区"],
    //     ["南京市","徐州市","连云港市","宿迁市","淮安市","盐城市","扬州市","泰州市","南通市","镇江市","常州市","无锡市","苏州市"],
    //     ["杭州市","湖州市","嘉兴市","舟山市","宁波市","绍兴市","衢州市","金华市","台州市","温州市","丽水市"],
    //     ["合肥市","宿州市","淮北市","亳州市","阜阳市","蚌埠市","淮南市","滁州市","马鞍山市","芜湖市","铜陵市","安庆市","黄山市","六安市","巢湖市","池州市","宣城市"],
    //     ["福州市","南平市","莆田市","三明市","泉州市","厦门市","漳州市","龙岩市","宁德市"],
    //     ["南昌市","九江市","景德镇市","鹰潭市","新余市","萍乡市","赣州市","上饶市","抚州市","宜春市","吉安市"],
    //     ["济南市","青岛市","聊城市","德州市","东营市","淄博市","潍坊市","烟台市","威海市","日照市","临沂市","枣庄市","济宁市","泰安市","莱芜市","滨州市","菏泽市"],
    //     ["郑州市","开封市","三门峡市","洛阳市","焦作市","新乡市","鹤壁市","安阳市","濮阳市","商丘市","许昌市","漯河市","平顶山市","南阳市","信阳市","周口市","驻马店市","济源市"],
    //     ["武汉市","十堰市","襄樊市","荆门市","孝感市","黄冈市","鄂州市","黄石市","咸宁市","荆州市","宜昌市","随州市","省直辖县级行政单位","恩施州"],
    //     ["长沙市","张家界市","常德市","益阳市","岳阳市","株洲市","湘潭市","衡阳市","郴州市","永州市","邵阳市","怀化市","娄底市","湘西州"],
    //     ["广州市","深圳市","清远市","韶关市","河源市","梅州市","潮州市","汕头市","揭阳市","汕尾市","惠州市","东莞市","珠海市","中山市","江门市","佛山市","肇庆市","云浮市","阳江市","茂名市","湛江市"],
    //     ["南宁市","桂林市","柳州市","梧州市","贵港市","玉林市","钦州市","北海市","防城港市","崇左市","百色市","河池市","来宾市","贺州市"],
    //     ["海口市","三亚市","省直辖县级行政单位"],
    //     ["成都市","广元市","绵阳市","德阳市","南充市","广安市","遂宁市","内江市","乐山市","自贡市","泸州市","宜宾市","攀枝花市","巴中市","达州市","资阳市","眉山市","雅安市","阿坝州","甘孜州","凉山州"],
    //     ["贵阳市","六盘水市","遵义市","安顺市","毕节地区","铜仁地区","黔东南州","黔南州","黔西南州"],
    //     ["昆明市","曲靖市","玉溪市","保山市","昭通市","丽江市","思茅市","临沧市","德宏州","怒江州","迪庆州","大理州","楚雄州","红河州","文山州","西双版纳州"],
    //     ["拉萨市","那曲地区","昌都地区","林芝地区","山南地区","日喀则地区","阿里地区"],
    //     ["西安市","延安市","铜川市","渭南市","咸阳市","宝鸡市","汉中市","榆林市","安康市","商洛市"],
    //     ["兰州市","嘉峪关市","白银市","天水市","武威市","酒泉市","张掖市","庆阳市","平凉市","定西市","陇南市","临夏州","甘南州"],
    //     ["西宁市","海东地区","海北州","海南州","黄南州","果洛州","玉树州","海西州"],
    //     ["银川市","石嘴山市","吴忠市","固原市","中卫市"],
    //     ["乌鲁木齐市","克拉玛依市","自治区直辖县级行政单位","喀什地区","阿克苏地区","和田地区","吐鲁番地区","哈密地区","克孜勒苏柯州","博尔塔拉州","昌吉州","巴音郭楞州","伊犁州","塔城地区","阿勒泰地区"],
    //     ["香港"],
    //     ["澳门"],
    //     ["台北市","高雄市","台中市","花莲市","基隆市","嘉义市","金门市","连江市","苗栗市","南投市","澎湖市","屏东市","台东市","台南市","桃园市","新竹市","宜兰市","云林市","彰化市"]];
    //
    // function init(){
    //     var province = document.getElementById('provinces');
    //     //给选择框一个高度，可直接写进数据，不然要先创建dom元素option再录值
    //     province.length=provinces.length;
    //     for(var i=0;i<provinces.length;i++){
    //         province.options[i].text=provinces[i];
    //         if(i==0){
    //             province.options[i].value="";
    //         }else{
    //             province.options[i].value=provinces[i];
    //         }
    //     }
    // }
    //
    // function provincechange(n){
    //     var city = document.getElementById('city');
    //     var citystemp=citys[n];
    //     city.length=citystemp.length;
    //     for(var i=0;i<citystemp.length;i++){
    //         city.options[i].text=citystemp[i];
    //         city.options[i].value = citystemp[i];
    //     }
    //     city.options[0].selected=true;
    // }


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