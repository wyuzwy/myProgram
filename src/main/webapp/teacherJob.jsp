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
    String htmlData = request.getParameter("jobDescribe") != null ? request.getParameter("jobDescribe") : "";
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
                    <a class="list-group-item" title="宣讲会申请" href="teacherPreach.jsp">申请宣讲会</a>
                </li>
                <li style="display:block">
                    <a class="list-group-item active" title="发布在线招聘">发布在线招聘</a>
                <li style="display:block">
                    <a class="list-group-item " title="审核生源信息" href="teacherSignInfo.jsp">审核生源信息</a>
                </li>
                <li style="display:block">
                    <a class="list-group-item" title="审核就业信息" href="teacherSignEmp.jsp">审核就业信息</a>
                </li>
                </li>
            </ul>
        </div>

        <div class="col-md-10">

            <div>
                <h3>发布在线招聘</h3>
            </div>

            <div class="panel panel-default ">
                <div class="container">

                    <div style="margin: 20px;height: 550px">

                        <form  class="col-md-9 form-horizontal"  id="teacherJob" >

                            <div class="form-group" id="info">
                                <input type="text" id="sendName" class="form-control" name="sendName" value="${currentUser.userDept}"/>
                                <input type="text" id="sendId" class="form-control" name="sendId" value="${currentUser.id}"/>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">公司名称：</label>
                                <div class="col-sm-4">
                                    <input type="text"  class="form-control" name="companyName" id="companyName" placeholder="请输入公司全称"/>
                                </div>
                                <div class="col-sm-4">
                                    <h5 id="h5Company"  class="help-block" style="color: red"></h5>
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
                                <label class="col-sm-2 control-label">职位名称：</label>
                                <div class="col-sm-4">
                                    <input type="text"  class="form-control" name="jobName" id="jobName" />
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
                                    <input type="text" class="form-control" name="address" id="address" placeholder="例：江门市"/>
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
                                    <input type="text" class=" form-control" autocomplete="off" name="endTime" id="endTime"/>

                                </div>
                                <div class="col-sm-4">
                                    <h5 id="h5Time"  class="help-block" style="color: red"></h5>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label">职位描述：</label>
                                <div class="col-sm-4">
                                    <textarea  id="jobDescribe" name="jobDescribe" cols="50" rows="8" style="width:675px;height: 400px; visibility: hidden;" ><%=htmlspecialchars(htmlData)%></textarea>
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

                            <div class="form-group" style="margin-top: 20px">
                                <div class=" col-sm-10" align="center">
                                    <button type="button" class="btn btn-primary" id="sendJob">确认</button>
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
        elem: '#endTime',
        type: 'date',
        format: 'yyyy-MM-dd',
        theme: 'molv'
    });
    var editor1;
    KindEditor.ready(function(K) {
        editor1 = K.create('textarea[name="jobDescribe"]', {
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
        $("#info").hide();

    });


    function check(){
        $("#h5Introduction").text("");
        var introduction = $("#introduction").val();
        $("#h5Introduction").append("<font color='gray'>已输入"+introduction.length+"字</font>");
        // $("#introduction").next("h5").text("已输入"+introduction.length+"字");
    }


    $("#sendJob").click(function () {
        $("#teacherJob h5").text("");

        var companyName = $("#companyName").val();
        if(companyName==""){
            $("#h5Company").text("请输入公司名称！");
            $("#companyName").focus();
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


        var jobName = $("#jobName").val();
        if(jobName==""){
            $("#h5Name").text("请输入职位名称！");
            $("#jobName").focus();
            return false;
        }

        var category = $("#category").val();
        if(category==""){
            $("#h5Cate").text("请选择职位类别！");
            $("#category").focus();
            return false;
        }

        var address =$("#address").val();
        if(address==""){
            $("#h5Add").text("请输入工作地点！");
            $("#address").focus();
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

        var endTime = $("#endTime").val();
        if(endTime==""){
            $("#h5Time").text("请输入截止日期！");
            $("#endTime").focus();
            return false;
        }

        editor1.sync();
        var describe = $("#jobDescribe").val();
        if(describe==""){
            $("#jobDescribe").next("h5").text("请输入职业描述！");
            $("#jobDescribe").focus();
            return false;
        }



        layer.confirm("是否确认发布在线招聘？",{btn:['确定','取消'],title:"提示"},function () {
            $.ajax({
                url:"job/insertOrUpdate",//教师发布在线招聘url
                data:$("#teacherJob").serialize(),
                type:"POST",
                success:function (result) {
                    if(result.flag=="200"){
                        layer.msg('发布成功！', {icon: 1});
                        clearInput();
                    }else{
                        layer.msg('发布失败，请重试！', {icon: 2});
                    }
                },
                error:function () {
                    layer.msg('服务请求超时！！！', {icon: 2});
                }
            });
        });

    });

    $("#cancel_btn").click(function () {
        clearInput();
    });


    function clearInput(){
        window.location.reload();
    }










    $(document).on("click","#save_btn",function () {
        //alert($("#editUser").serialize());
        ///alert($("#editUser form").serialize());
        $.ajax({
            url:"<%request.getContextPath();%>/user/edit/"+value,
            type:"PUT",
            data:$("#editUser").serialize(),
            success:function (result) {
                javascript:location.reload();
                show_msg(result);

            }
        });
    });


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