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
                    <a class="list-group-item " href="teacherSearch.jsp" title="查询所有发布" >查询所有发布</a>
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
                    <a class="list-group-item active" title="审核就业信息">审核就业信息</a>
                </li>
                </ul>
        </div>

        <div class="col-md-10">

            <div>
                <h3>审核学生就业信息</h3>
            </div>

            <div class="panel panel-default ">
                <div class="container-fluid">
                    <div style="margin: 20px;height: 550px">

                        <form class=" form-inline"  id="form-search">
                            <label class="form-inline">学号</label>
                            <input type="text" class="form-control" placeholder="学生学号" name="studentId" id="studentId">
                            <span>&nbsp  </span>
                            <label class="form-inline">姓名</label>
                            <input type="text" class="form-control" placeholder="学生姓名" name="studentName" id="studentName">
                            <span> &nbsp </span>
                            <label class="form-inline">状态</label>
                            <select id="status" class="form-control " name="status" >
                                <option value="-1" selected>全部</option>
                                <option value="0">待审核</option>
                                <option value="1">通过</option>
                                <option value="2">不通过</option>
                            </select>
                            <span>&nbsp </span>
                            <a id="search_btn" onclick="searchEmp()" class="btn btn-info">搜索</a>
                        </form>
                        <div class="panel panel-default">
                            <ul class="list-group" id="followUser">
                                <%--<table id="job_list" class="table table-bordered table-striped dataTable no-footer" width="100%" role="grid" aria-describedby="job_list_info" style="width: 100%;">--%>
                                    <%--<thead>--%>
                                    <%--<tr role="row"><th name="id" class="sorting_disabled" rowspan="1" colspan="1" style="width: 26px;">任务ID</th><th name="jobDesc" class="sorting_disabled" rowspan="1" colspan="1" style="width: 101px;">任务描述</th><th name="glueType" class="sorting_disabled" rowspan="1" colspan="1" style="width: 99px;">运行模式</th><th name="jobCron" class="sorting_disabled" rowspan="1" colspan="1" style="width: 30px;">Cron</th><th name="author" class="sorting_disabled" rowspan="1" colspan="1" style="width: 27px;">负责人</th><th name="jobStatus" class="sorting_disabled" rowspan="1" colspan="1" style="width: 36px;">状态</th><th class="sorting_disabled" rowspan="1" colspan="1" style="width: 60px;">操作</th></tr>--%>
                                    <%--</thead>--%>
                                    <%--<tbody><tr role="row" class="odd"><td>33</td><td>同步Tbl_DOItemInfo</td><td>BEAN：DOItemInfoHandler</td><td>0/6 * * * * ? *</td><td>廖辉荣</td><td><small class="label label-default"><i class="fa fa-clock-o"></i>PAUSED</small></td><td><p id="33"><button class="btn btn-primary btn-xs job_trigger" type="button">执行</button>  <button class="btn btn-primary btn-xs job_operate" _type="job_resume" type="button">恢复</button>  <button class="btn btn-primary btn-xs" type="job_del" onclick="javascript:window.open('/xxl-job-admin/joblog?jobId=33')">日志</button><br>  <button class="btn btn-warning btn-xs update" type="button">编辑</button>  <button class="btn btn-danger btn-xs job_operate" _type="job_del" type="button">删除</button>  </p></td></tr><tr role="row" class="even"><td>31</td><td>同步wm_tbl_workreport</td><td>BEAN：WorkReportHandler</td><td>0/6 * * * * ? *</td><td>廖辉荣</td><td><small class="label label-default"><i class="fa fa-clock-o"></i>PAUSED</small></td><td><p id="31"><button class="btn btn-primary btn-xs job_trigger" type="button">执行</button>  <button class="btn btn-primary btn-xs job_operate" _type="job_resume" type="button">恢复</button>  <button class="btn btn-primary btn-xs" type="job_del" onclick="javascript:window.open('/xxl-job-admin/joblog?jobId=31')">日志</button><br>  <button class="btn btn-warning btn-xs update" type="button">编辑</button>  <button class="btn btn-danger btn-xs job_operate" _type="job_del" type="button">删除</button>  </p></td></tr><tr role="row" class="odd"><td>20</td><td>test</td><td>BEAN：JobServiceHandler</td><td>0/5 * * * * ?</td><td>hyland</td><td><small class="label label-default"><i class="fa fa-clock-o"></i>PAUSED</small></td><td><p id="20"><button class="btn btn-primary btn-xs job_trigger" type="button">执行</button>  <button class="btn btn-primary btn-xs job_operate" _type="job_resume" type="button">恢复</button>  <button class="btn btn-primary btn-xs" type="job_del" onclick="javascript:window.open('/xxl-job-admin/joblog?jobId=20')">日志</button><br>  <button class="btn btn-warning btn-xs update" type="button">编辑</button>  <button class="btn btn-danger btn-xs job_operate" _type="job_del" type="button">删除</button>  </p></td></tr></tbody>--%>
                                    <%--<tfoot></tfoot>--%>
                                <%--</table>--%>
                                <table class="table table-bordered table-striped dataTable no-footer" style="width: 100%;">
                                    <thead>
                                    <tr role="row" class="odd">
                                        <td>学号</td>
                                        <td>姓名</td>
                                        <td>学院</td>
                                        <td>专业</td>
                                        <td>时间</td>
                                        <td>状态</td>
                                        <td>操作</td>
                                    </tr>
                                    </thead>
                                    <tbody id="empInfo">

                                    </tbody>
                                </table>
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

<div class="modal fade" id="checkEmp" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
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

                <div style="margin: 20px;height: 650px;">
                    <form  class="col-md-9 form-horizontal"  id="check_emp" >
                        <h3>学生信息</h3>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">学生学号：</label>
                            <div class="col-md-4">
                                <input type="text"  class="form-control" name="studentId" id="student_id" readonly/>
                            </div>
                            <label class="col-sm-2 control-label">学生姓名：</label>
                            <div class="col-sm-4" id="student_name">

                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">所在院系：</label>
                            <div class="col-sm-4" id="student_dept">

                            </div>
                            <label class="col-sm-2 control-label">所在专业：</label>
                            <div class="col-sm-4" id="student_major">

                            </div>
                        </div>
                        <h3>企业信息</h3>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">公司名称：</label>
                            <div class="col-sm-4" id="company_name">

                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">单位性质：</label>
                            <div class="col-sm-4" id="company_property">

                            </div>
                            <label class="col-sm-2 control-label">所属行业：</label>
                            <div class="col-sm-4" id="company_category">

                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label">公司地址：</label>
                            <div class="col-sm-4" id="company_address">

                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">职位名称</label>
                            <div class="col-sm-4" id="job_name">

                            </div>
                            <label class="col-sm-2 control-label">是否对口</label>
                            <div class="col-sm-4" id="job_counterpart">

                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">签约时间</label>
                            <div class="col-sm-4" id="sign_time">

                            </div>
                            <label class="col-sm-2 control-label">创建时间</label>
                            <div class="col-sm-4" id="create_time">

                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">企业联系人</label>
                            <div class="col-sm-4" id="company_man">

                            </div>
                            <label class="col-sm-2 control-label">联系人手机</label>
                            <div class="col-sm-4" id="man_phone">

                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">联系人电话</label>
                            <div class="col-sm-4" id="man_telephone">

                            </div>
                            <label class="col-sm-2 control-label">联系人邮箱</label>
                            <div class="col-sm-4" id="man_email">

                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">企业邮编</label>
                            <div class="col-sm-4" id="company_postcode">

                            </div>
                            <label class="col-sm-2 control-label">工作薪酬</label>
                            <div class="col-sm-4" id="money">

                            </div>
                        </div>
                        <div class="form-group" id="showMes" hidden>
                            <input type="text" name="checkMan" id="checkMan" hidden/>
                            <label class="col-sm-2 control-label">审核人员</label>
                            <div class="col-sm-4" id="check_man">

                            </div>
                            <label class="col-sm-2 control-label">审核时间</label>
                            <div class="col-sm-4" id="check_time">

                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">审核意见</label>
                            <div class="col-sm-4">
                                <label class="radio-inline">
                                    <input type="radio"  value="1" name="status" onchange="checkStatus()">通过
                                </label>
                                <label class="radio-inline">
                                    <input type="radio"  value="2" name="status" onchange="checkStatus()">不通过
                                </label>
                            </div>
                        </div>
                        <div class="form-group" id="showRemark" hidden>
                            <label class="col-sm-2 control-label">不通过原因</label>
                            <div class="col-sm-4">
                                <textarea  id="remark" name="remark" cols="30" rows="4" ></textarea>
                                <h5  class="help-block" style="color: red"></h5>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" onclick="updateEmp()">
                    提交更改
                </button>
                <%--<button type="button" class="btn btn-danger" onclick="deleteJob()" id="delete_job">删除岗位--%>
                <%--</button>--%>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>

<script type="text/javascript">
    var id = "${currentUser.id}";
    var dept = "${currentUser.userDept}";
    var name = "${currentUser.userName}";
    $(function () {
        show_emp(1);
    });


    function show_emp(page) {
        var status = $("#status").val();
        var data = "rows=10&page="+page+"&studentDept="+dept+"&status="+status;
        var studentId = $("#studentId").val();
        if(studentId!=""&&studentId!=undefined){
            data+="&studentId="+studentId;
        }
        var studentName=$("#studentName").val();
        if(studentName!=""&&studentName!=undefined){
            data+="&studentName="+studentName;
        }

        $.ajax({
            url:"<%request.getContextPath();%>/emp/searchByCondition",
            data:data,
            type:"GET",
            success:function (result) {
                console.log(result);
                $("#empInfo").empty();
                $("#page_info_area").empty();
                $("#page_nav_area").empty();
                if(result.flag=="200"){
                    build_emp_table(result);
                    build_page_info(result);
                    build_page_nav(result);
                }else{
                    var div=$("<div style='color: grey' align='center'></div>").append("暂无记录");
                    div.appendTo("#empInfo");
                }
            }
        })
    }



    function searchEmp() {
        show_emp(1);
    }


    function updateEmp() {
        var studentId = $("#student_id").val();
        if(studentId==""||studentId==undefined){
            layer.msg('登录超时，请重新登录（id）！', {icon: 2});
            return false;
        }

        $("#checkMan").val(name);
        var checkMan=$("#checkMan").val();
        if(checkMan==""||checkMan==undefined){
            layer.msg('登录超时，请重新登录（name)！', {icon: 2});
            return false;
        }
        var status = $('#check_emp input:radio:checked').val();
        if(status==""||status==undefined){
            layer.msg('请选择意见！', {icon: 2});
            return false;
        }
        if(status=="2"){
            var remark = $("#remark").val();
            if(remark==""||remark==undefined){
                layer.msg('请填写原因！', {icon: 2});
                return false;
            }
        }else{
            $("#remark").val("");
        }
        layer.confirm("是否确认修改？",{btn:['确定','取消'],title:"提示"},function () {
            $.ajax({
                url: "<%request.getContextPath();%>/emp/teacherCheck",
                data: $("#check_emp").serialize(),
                type: "POST",
                success: function (result) {
                    if (result.flag == "200") {
                        layer.msg('修改成功！', {icon: 1});
                        $("#checkEmp").modal('hide');
                        show_emp(1);
                    } else {
                        layer.msg('修改失败，请重试！', {icon: 1});
                    }
                }
            })
        });



    }

    function editEmp(studentId) {
        $.ajax({
            url:"<%request.getContextPath();%>/emp/searchById",
            data:"studentId="+studentId,
            type:"GET",
            success:function (result) {
                console.log(result);
                if(result.flag=="200"){
                    $("#checkEmp").modal('show');
                    emptyEmp();
                    show_one_emp(result.employment);
                }else{

                }
            }
        });
    }


    function show_one_emp(emp) {
        $("#student_id").val(emp.studentId);
        $("#student_name").append(emp.studentName);
        $("#student_dept").append(emp.studentDept);
        $("#student_major").append(emp.studentMajor);
        $("#company_name").append(emp.companyName);
        $("#company_property").append(emp.companyProperty);
        $("#company_category").append(emp.companyCategory);
        $("#company_address").append(emp.companyProvinces+emp.companyCity+emp.companyAddress);
        $("#job_name").append(emp.jobName);
        $("#job_counterpart").append(emp.jobCounterpart);
        $("#sign_time").append(emp.signTime);
        $("#create_time").append(emp.createTime);
        $("#company_man").append(emp.companyMan);
        $("#man_phone").append(emp.manPhone);
        $("#man_telephone").append(emp.manTelephone);
        $("#man_email").append(emp.manEmail);
        $("#company_postcode").append(emp.companyPostcode);
        $("#money").append(emp.money);
        $("#check_man").append(emp.checkMan);
        $("#check_time").append(emp.chaeckTime);
        if(emp.status=="1"){
            // $("input[name='status'][value='1']").attr("checked",true);
            $("#showMes").show();
            // $("[name='status'][value='1']").parent().addClass('checked').prop("checked",true)
        }else if(emp.status=="2"){
            // $("input[name='status'][value='2']").attr("checked",true);
           $("#showRemark").show();
            $("#showMes").show();
            $("#remark").val(emp.remark);
            // $("radio[name='status'][value='2']").parent().addClass('checked').prop("checked",true)
        }else{
            // $("input[name='status'][value='1']").attr("checked",false);
            // $("input[name='status'][value='2']").attr("checked",false);
        }
        //$("input[type='radio']").is(":checked");判断是否被选中
    }

    function emptyEmp() {
        $("#student_id").val("");
        $("#student_name").empty();
        $("#student_dept").empty();
        $("#student_major").empty();
        $("#company_name").empty();
        $("#company_property").empty();
        $("#company_category").empty();
        $("#company_address").empty();
        $("#job_name").empty();
        $("#job_counterpart").empty();
        $("#sign_time").empty();
        $("#create_time").empty();
        $("#company_man").empty();
        $("#man_phone").empty();
        $("#man_telephone").empty();
        $("#man_email").empty();
        $("#company_postcode").empty();
        $("#money").empty();
        $("#check_man").empty();
        $("#check_time").empty();
        $("#remark").val("");
        // $("input[type='radio']").attr("checked",false);//取消选中
        $("#showRemark").hide();
        $("#showMes").hide();
    }



    function checkStatus() {
        var status = $('#check_emp input:radio:checked').val();
        if(status=="2"){
            $("#showRemark").show();
        }else{
            $("#showRemark").hide();
        }

    }





    function build_emp_table(result) {
        $("#empInfo").empty();

        var student = result.pageInfo.list;
        $.each(student,function (index,item) {
           var tr= $("<tr role='row'></tr>");
           var td1 =$("<td></td>").addClass("odd").append(item.studentId);
           var td2 = $("<td></td>").addClass("odd").append(item.studentName);
           var td3 = $("<td></td>").addClass("odd").append(item.studentDept);
           var td4 = $("<td></td>").addClass("odd").append(item.studentMajor);
           var td5 = $("<td></td>").addClass("odd").append(item.createTime);
           var status;
           if(item.status=="0"){
               status=$("<font style=\"background-color: red\" color='white'>待审核</font>");
           }else if(item.status=="1"){
               status=$("<font style=\"background-color: blue\" color='white'>通过</font>");
           }else if(item.status=="2"){
               status=$("<font style=\"background-color: black\" color='white'>不通过</font>");
           }else{
               status=$("<font style=\"background-color: black\" color='white'>其他</font>");
           }
           var td6 = $("<td></td>").addClass("odd").append(status);
           var td7 = $("<td></td>").addClass("odd");
           var button = $("<button onclick=\'editEmp("+item.studentId+")\'style='width: 50px;height: 25px;' >操作</button>").addClass("btn btn-danger btn-sm");
           td7.append(button);
           tr.append(td1).append(td2).append(td3).append(td4).append(td5).append(td6).append(td7);
           tr.appendTo("#empInfo");
        });
    }


    function build_page_info(result){
        $("#page_info_area").empty();
        $("#page_info_area").append("第 "+result.pageInfo.pageNum+" 页（总共 "+
            result.pageInfo.pages+" 页,"+
            result.pageInfo.total+" 条记录）");
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
