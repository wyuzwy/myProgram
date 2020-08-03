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
                <h4>个人中心<sup style="border-radius: 5px;font-size: 15px;background-color: #c7ddef;color: blue">学生</sup></h4>
                <li style="display:block">
                    <a class="list-group-item" title="我的信息" href="studentInfo.jsp" >我的信息</a>
                </li>
                <li style="display:block">
                    <a class="list-group-item" title="已投递岗位" href="studentSend.jsp">已投递岗位</a>
                </li>
                <li style="display:block">
                    <a class="list-group-item" title="已关注宣讲会" href="studentFollow.jsp">已关注宣讲会</a>
                </li>
                <li style="display:block">
                    <a class="list-group-item active" title="填写就业信息" >填写就业信息</a>
                </li>
                <li style="display:block">
                    <a class="list-group-item" title="个人简历" href="studentResume.jsp">个人简历</a>
                </li>
            </ul>
        </div>

        <div class="col-md-10">

            <div>
                <h3>就业信息</h3>
            </div>

            <div class="panel panel-default ">
                <div class="container">

                    <div style="margin: 20px">

                        <form  class="col-md-9 form-horizontal"  id="editEmployment" >
                            <div class="form-group">
                                <label class="col-sm-2 control-label">审核状态：</label>
                                <div class="col-sm-2" id="status1" style="margin-top: 7px">

                                </div>
                                <label class="col-sm-2 control-label">审核时间：</label>
                                <div class="col-sm-2" id="ensureTime" style="margin-top: 7px">

                                </div>
                                <label class="col-sm-2 control-label" >审核人员：</label>
                                <div class="col-sm-2" id="confirmName" style="margin-top: 7px">

                                </div>
                            </div>
                            <div class="form-group" id="div1">
                                <label class="col-sm-2 control-label">原因说明：</label>
                                <div class="col-sm-5" id="question" style="margin-top: 7px">

                                </div>
                            </div>
                            <div align="left">
                                <h3>学生信息</h3>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label">学号：</label>
                                <div class="col-sm-4">
                                    <input type="text" readonly class="form-control" name="studentId" id="studentId"/>
                                </div>
                                <div class="col-sm-3">
                                    <h5 id="idH5"  class="help-block" style="color: red"></h5>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">姓名：</label>
                                <div class="col-sm-4">
                                    <input type="text" readonly class="form-control" name="studentName" id="studentName"/>
                                </div>
                                <div class="col-sm-3">
                                    <h5 id="studentH5"  class="help-block" style="color: red"></h5>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">学院：</label>
                                <div class="col-sm-4">
                                    <select class="form-control" name="studentDept" id="studentDept" onchange="showZY()" disabled>
                                        <%--<option selected value="">请选择...</option>--%>
                                        <%--<option value="经济管理学院">经济管理学院</option>--%>
                                    </select>
                                    <%--<input type="text" class="form-control" name="xy" id="xy" readonly/>--%>
                                </div>
                                <div class="col-sm-3">
                                    <h5 id="deptH5"  class="help-block" style="color: red"></h5>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">专业名称：</label>
                                <div class="col-sm-4">
                                    <select class="form-control" name="studentMajor" id="studentMajor" disabled>
                                        <%--<option selected value="">请选择...</option>--%>
                                        <%--<option value="软件工程">软件工程</option>--%>
                                    </select>
                                </div>
                                <div class="col-sm-3">
                                    <h5 id="majorH5"  class="help-block" style="color: red"></h5>
                                </div>
                            </div>
                            <div align="left">
                                    <h3>企业信息</h3>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">公司名称：</label>
                                <div class="col-sm-4">
                                    <input type="text" readonly class="form-control" name="companyName" id="companyName"/>
                                </div>
                                <div class="col-sm-3">
                                    <h5 id="companyH5"  class="help-block" style="color: red"></h5>
                                </div>
                            </div>
                            <div class="form-group">
                                <label  class="col-sm-2 control-label">单位性质：</label>
                                <div class="col-sm-4">
                                    <select class="form-control" name="companyProperty" id="companyProperty"  style="color: #8f8f8f">
                                        <option selected value="">必填，请选择</option>
                                        <option value="机关">机关</option>
                                        <option value="科研设计单位">科研设计单位</option>
                                        <option value="高等教育单位">高等教育单位</option>
                                        <option value="中初教育单位">中初教育单位</option>
                                        <option value="医疗卫生单位">医疗卫生单位</option>
                                        <option value="其他事业单位">其他事业单位</option>
                                        <option value="国有企业">国有企业</option>
                                        <option value="民营企业">民营企业</option>
                                        <option value="三资企业">三资企业</option>
                                        <option value="其他企业">其他企业</option>
                                        <option value="部队">部队</option>
                                        <option value="农村建制村">农村建制村</option>
                                        <option value="城镇社区">城镇社区</option>
                                        <option value="其他">其他</option>
                                    </select>
                                </div>
                                <div class="col-sm-3">
                                    <h5 id="propertyH5"  class="help-block" style="color: red"></h5>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">所属行业：</label>
                                <div class="col-sm-4">
                                    <select class="form-control" name="companyCategory" id="companyCategory"  style="color: #8f8f8f">
                                        <option selected value="">必填，请选择</option>
                                        <option value="农、林、牧、渔业">农、林、牧、渔业</option>
                                        <option value="采矿业">采矿业</option>
                                        <option value="制造业">制造业</option>
                                        <option value="电力、热力、燃气及水生产和供应业">电力、热力、燃气及水生产和供应业</option>
                                        <option value="建筑业">建筑业</option>
                                        <option value="批发和零售业">批发和零售业</option>
                                        <option value="交通运输、仓储和邮政业">交通运输、仓储和邮政业</option>
                                        <option value="住宿和餐饮业">住宿和餐饮业</option>
                                        <option value="住宿和餐饮业">信息传输、软件和信息技术服务业</option>
                                        <option value="金融业">金融业</option>
                                        <option value="房地产业">房地产业</option>
                                        <option value="租赁和商务服务业">租赁和商务服务业</option>
                                        <option value="科学研究和技术服务业">科学研究和技术服务业</option>
                                        <option value="水利、环境和公共设施管理业">水利、环境和公共设施管理业</option>
                                        <option value="居民服务、修理和其他服务业">居民服务、修理和其他服务业</option>
                                        <option value="教育">教育</option>
                                        <option value="卫生和社会工作">卫生和社会工作</option>
                                        <option value="文化、体育和娱乐业">文化、体育和娱乐业</option>
                                        <option value="公共管理、社会保障和社会组织">公共管理、社会保障和社会组织</option>
                                        <option value="国际组织">国际组织</option>
                                        <option value="军队">军队</option>
                                    </select>
                                </div>
                                <div class="col-sm-3">
                                    <h5 id="categoryH5"  class="help-block" style="color: red"></h5>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">所在省份：</label>
                                <div class="col-sm-4">
                                    <select class="form-control" name="companyProvinces" id="companyProvinces" onchange="provincechange(this.selectedIndex)" style="width: 150px">
                                        <%--<option value="">请选择...</option>--%>
                                        <%--<option value="学生">学生</option>--%>
                                        <%--<option value="教师">教师</option>--%>
                                    </select>
                                </div>
                                <div class="col-sm-3">
                                    <h5 id="provincesH5"  class="help-block" style="color: red"></h5>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">所在城市：</label>
                                <div class="col-sm-4">
                                    <select class="form-control" name="companyCity" id="companyCity" style="width: 150px">
                                        <%--<option value="学生">学生</option>--%>
                                        <%--<option value="教师">教师</option>--%>
                                    </select>
                                </div>
                                <div class="col-sm-3">
                                    <h5 id="cityH5"  class="help-block" style="color: red"></h5>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">详细地址：</label>
                                <div class="col-sm-4">
                                    <input type="text" class="form-control" name="companyAddress" id="companyAddress"/>
                                </div>
                                <div class="col-sm-3">
                                    <h5 id="addressH5"  class="help-block" style="color: red"></h5>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">岗位名称：</label>
                                <div class="col-sm-4">
                                    <input type="text" class="form-control" name="jobName" id="jobName"/>
                                </div>
                                <div class="col-sm-3">
                                    <h5 id="jobH5"  class="help-block" style="color: red"></h5>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">专业是否对口：</label>
                                <div class="col-sm-4">
                                    <select class="form-control" name="jobCounterpart" id="jobCounterpart" style="width: 150px">
                                        <option value="" selected>请选择...</option>
                                        <option value="1">是</option>
                                        <option value="0">不是</option>
                                    </select>
                                </div>
                                <div class="col-sm-3">
                                    <h5 id="counterpartH5"  class="help-block" style="color: red"></h5>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">签约日期：</label>
                                <div class="col-sm-4">
                                    <input  class="form-control" name="signTime" id="signTime" readonly/>
                                </div>
                                <div class="col-sm-3">
                                    <h5 id="signH5"  class="help-block" style="color: red"></h5>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">企业联系人：</label>
                                <div class="col-sm-4">
                                    <input  class="form-control" name="companyMan" id="companyMan" readonly/>
                                </div>
                                <div class="col-sm-3">
                                    <h5 id="manH5"  class="help-block" style="color: red"></h5>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">联系人手机：</label>
                                <div class="col-sm-4">
                                    <input  class="form-control" name="manPhone" id="manPhone" readonly/>
                                </div>
                                <div class="col-sm-3">
                                    <h5 id="phoneH5"  class="help-block" style="color: red"></h5>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">联系人电话：</label>
                                <div class="col-sm-4">
                                    <input  class="form-control" name="manTelephone" id="manTelephone" readonly/>
                                </div>
                                <div class="col-sm-3">
                                    <h5 id="telephoneH5"  class="help-block" style="color: red"></h5>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">联系人邮箱：</label>
                                <div class="col-sm-4">
                                    <input  class="form-control" name="manEmail" id="manEmail" readonly/>
                                </div>
                                <div class="col-sm-3">
                                    <h5 id="emailH5"  class="help-block" style="color: red"></h5>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">企业邮编：</label>
                                <div class="col-sm-4">
                                    <input  class="form-control" name="companyPostcode" id="companyPostcode" readonly/>
                                </div>
                                <div class="col-sm-3">
                                    <h5 id="postcodeH5"  class="help-block" style="color: red"></h5>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">工作薪酬：</label>
                                <div class="col-sm-3">
                                    <input  class="form-control" name="money" id="money" style="width: 200px" readonly/>
                                </div>
                                <div class="col-sm-1" style="margin-top: 7px">元/月</div>
                                <div class="col-sm-3">
                                    <h5 id="moneyH5"  class="help-block" style="color: red"></h5>
                                </div>
                            </div>
                            <div class="form-group" id="create_time">
                                <label class="col-sm-2 control-label">创建时间：</label>
                                <div class="col-sm-2" id="createTime" style="margin-top: 7px">

                                </div>
                            </div>
                            <input name="status" id="status" hidden/>
                            <div class="form-group">
                                <div class="col-sm-offset-2 col-sm-10">
                                    <button type="button" class="btn btn-default" id="update_btn">编辑</button>
                                    <button type="button" class="btn btn-default" id="save_btn">保存</button>
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


<script type="text/javascript">


    laydate.render({
        elem:'#signTime',
        type:'date',
        format:'yyyy-MM-dd',
        theme:'molv'

    });
    $(function () {
        showXY();
        init();
        load_this_view();
    });


    function showXY() {
        $.ajax({
            url:"/college/getListByPid",
            data:"pid=0",
            type:"GET",
            async: false,
            success:function (result) {
                console.log(result);
                if(result.flag=="200"){
                    showCollege(result.list);
                }else{
                    console.log("搜索不到！");
                }
            }
        })
    }


    function showCollege(list) {
        $("#studentDept").empty();
        var optionEle = $("<option></option>").append("请选择").attr("value","");
        optionEle.appendTo("#studentDept");
        $.each(list,function (index,item) {
            var optionEle = $("<option></option>").append(item.name).attr("value",item.name);
            optionEle.appendTo("#studentDept");
        });
    }

    function showZY(){
        var xy =$("#studentDept").val();
        if(xy==""||xy==undefined){
            $("#studentMajor").empty();
            var optionEle = $("<option></option>").append("请选择").attr("value","");
            optionEle.appendTo("#studentMajor");
            return false;
        }
        $.ajax({
            url:"/college/getListByName",
            data:"name="+xy,
            type:"GET",
            async: false,
            success:function (result) {
                console.log(result);
                if(result.flag=="200"){
                    showDept(result.list);
                }else{
                    console.log("搜索不到！");
                }
            }
        });

    }


    function showDept(list){
        $("#studentMajor").empty();
        var optionEle = $("<option></option>").append("请选择").attr("value","");
        optionEle.appendTo("#studentMajor");
        $.each(list,function (index,item) {
            var optionEle = $("<option></option>").append(item.name).attr("value",item.name);
            optionEle.appendTo("#studentMajor");
        });
    }



    function load_this_view(){
        divEmpty();
        var id="${currentUser.id}";
        $.ajax({
            url:"emp/searchById",//查询某个学生就业信息url
            data:"studentId="+id,
            type:"GET",
            success:function (result) {
                if(result.flag=="200"){
                    show_view(result.employment);
                }else{
                    defaults_view();
                }
            }


        });
    }
    function divEmpty(){
        $("#status1").empty();
        $("#ensureTime").empty();
        $("#confirmName").empty();
        $("#createTime").empty();
        $("#question").empty();
        $("#div1").hide();
        $("#create_time").hide();
        $("#save_btn").hide();
        $("#update_btn").show();
        $("#cancel_btn").hide();
        $("#editEmployment input").attr("readonly",true);
        $("#editEmployment select").attr("disabled",true);
    }

    function show_view(employment){
        $("#studentId").val(employment.studentId);
        $("#studentName").val(employment.studentName);
        $("#studentDept").val(employment.studentDept);
        $("#studentDept").trigger('change');
        // showZY();
        //TODO 检查这里
        // var sel = document.getElementById('studentDept');
        // sel.value = employment.studentDept;
        // sel.addEventListener("change", showZY(), false);
        // $("#studentDept").trigger("select");
        // var sel2 = document.getElementById('studentMajor');
        // sel2.value = employment.studentMajor;
        $("#studentMajor").val(employment.studentMajor);
        // $("#studentMajor").trigger("change");
        $("#companyName").val(employment.companyName);
        $("#companyProperty").val(employment.companyProperty);
        $("#companyCategory").val(employment.companyCategory);
        $("#companyProvinces").val(employment.companyProvinces);
        // //TODO 检查这里
         $("#companyProvinces").trigger("change");
        $("#companyCity").val(employment.companyCity);
        // $("#companyCity").trigger("change");
        $("#companyAddress").val(employment.companyAddress);
        $("#jobName").val(employment.jobName);
        $("#jobCounterpart").val(employment.jobCounterpart);
        $("#signTime").val(employment.signTime);
        $("#companyMan").val(employment.companyName);
        $("#manPhone").val(employment.manPhone);
        $("#manTelephone").val(employment.manTelephone);
        $("#manEmail").val(employment.manEmail);
        $("#companyPostcode").val(employment.companyPostcode);
        $("#money").val(employment.money);
        $("#createTime").append(employment.createTime);
        $("#status1").val(employment.status);
        if(employment.status=="0"){
            $("#status1").append("待审核");

        }else if(employment.status=="1"){
            $("#status1").append("审核通过");
            $("#confirmName").append(employment.checkMan);
            $("#ensureTime").append(employment.chaeckTime);
            $("#update_btn").hide();
        }else{
            $("#status1").append("审核未通过");
            $("#confirmName").append(employment.checkMan);
            $("#ensureTime").append(employment.chaeckTime);
            $("#question").append(employment.remake);
            $("#div1").show();
        }
    }

    function defaults_view(){
        $("#status1").append("未填报");
        $("#studentId").val("${currentUser.id}");
        $("#studentName").val("${currentUser.userName}");
        $("#studentDept").val("${currentUser.userDept}");
        $("#studentDept").trigger("change");
    }



    $("#update_btn").click(function () {
        $("#save_btn").show();
        $("#update_btn").hide();
        $("#cancel_btn").show();
        $("#editEmployment input").attr("readonly",false);
        $("#editEmployment select").attr("disabled",false);
        // $("#studentDept").attr("disabled",true);
        $("#studentId").attr("readonly",true);
        $("#studentName").attr("readonly",true);
        // $("#studentDept").attr("readonly",true);
    });


    $("#save_btn").click(function () {
        $("#editEmployment h5").text("");

        if($("#studentDept").val()==""){
            $("#deptH5").text("请选择学院！");
            $("#studentDept").focus();
            return false;
        }

        if($("#studentMajor").val()==""){
            $("#majorH5").text("请选择专业！");
            $("#studentMajor").focus();
            return false;
        }


        if($("#companyName").val()==""){
            $("#companyH5").text("请输入公司名称!");
            $("#companyName").focus();
            return false;
        }
        if($("#companyProperty").val()==""){
            $("#propertyH5").text("请选择单位性质！");
            $("#companyProperty").focus();
            return false;
        }
        if($("#companyCategory").val()==""){
            $("#categoryH5").text("请选择所属行业！");
            $("#companyCategory").focus();
            return false;
        }
        if($("#companyProvinces").val()==""){
            $("#provincesH5").text("请选择所在省份！");
            $("#companyProvinces").focus();
            return false;
        }
        if($("#companyCity").val()==""){
            $("#cityH5").text("请选择所在城市！");
            $("#companyCity").focus();
            return false;
        }
        if($("#companyAddress").val()==""){
            $("#addressH5").text("请填写详细地址！");
            $("#companyAddress").focus();
            return false;
        }
        if($("#jobName").val()==""){
            $("#jobH5").text("请填写岗位名称！");
            $("#jobName").focus();
            return false;
        }
        if($("#jobCounterpart").val()==""){
            $("#counterpartH5").text("请选择！");
            $("#jobCounterpart").focus();
            return false;
        }
        if($("#signTime").val()==""){
            $("#signH5").text("请选择签约时间！");
            $("#signTime").focus();
            return false;
        }
        if($("#signTime").val()==""){
            $("#signH5").text("请选择签约时间！");
            $("#signTime").focus();
            return false;
        }
        if($("#companyMan").val()==""){
            $("#manH5").text("请填写企业联系人！");
            $("#companyMan").focus();
            return false;
        }
        var manPhone = $("#manPhone").val();
        var resPhone = /^1(3|4|5|6|7|8|9)\d{9}$/;
        if(manPhone==""){
            $("#phoneH5").text("请填写联系人手机！");
            $("#manPhone").focus();
            return false;
        }else if(!resPhone.test(manPhone)){
            $("#phoneH5").text("请填写有效的手机号码！");
            $("#manPhone").focus();
            return false;
        }
        var manTelephone = $("#manTelephone").val();
        var resTele = /(^(0[0-9]{2,3}\-)?([2-9][0-9]{6,7})+(\-[0-9]{1,4})?$)/;
        if(manTelephone==""){
            $("#telephoneH5").text("请填写座机号码！");
            $("#manTelephone").focus();
            return false;
        }else if(!resTele.test(manTelephone)){
            $("#telephoneH5").text("请填写有效的座机号码！");
            $("#manTelephone").focus();
            return false;
        }
        var manEmail = $("#manEmail").val();
        var resEmail= /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;
        if(manEmail==""){
            $("#emailH5").text("请填写联系人邮箱！");
            $("#manEmail").focus();
            return false;
        }else if(!resEmail.test(manEmail)){
            $("#emailH5").text("请填写有效的邮箱！");
            $("#manEmail").focus();
            return false;
        }
        var companyPostcode = $("#companyPostcode").val();
        if(companyPostcode.length!=6){
            $("#postcodeH5").text("请填写6位邮政编码！");
            $("#companyPostcode").focus();
            return false;
        }
        if($("#money").val()==""){
            $("#moneyH5").text("请填写工作薪酬！");
            $("#money").focus();
            return false;
        }
        layer.confirm("是否确认修改？", {btn: ['确定', '取消'], title: "提示"}, function () {
            $.ajax({
                url: "emp/insertOrUpdate",//修改或添加就业信息的url
                data: $("#editEmployment").serialize(),
                type: "POST",
                success: function (result) {
                    console.log(result);
                    if (result.flag == "200") {
                        layer.msg('操作成功', {icon: 1});
                        load_this_view();
                    } else {
                        layer.msg('操作失败，请重试！', {icon: 2});
                    }
                },
                error: function () {
                    layer.msg('请求超时，请稍后。。。', {icon: 5});
                }
            });
        });

    });



    var provinces = ['请选择省份','北京市','上海市','天津市','重庆市','河北省','山西省','内蒙古省','辽宁省','吉林省','黑龙江省','江苏省','浙江省','安徽省','福建省','江西省','山东省','河南省','湖北省','湖南省','广东省','广西省','海南省','四川省','贵州省','云南省','西藏省','陕西省','甘肃省','宁夏省','青海省','新疆省','香港','澳门','台湾'];
    var citys = [['请选择城市'],
        ["东城区", "西城区", "崇文区", "宣武区", "朝阳区", "丰台区", "石景山区", "海淀区", "门头沟区", "房山区", "通州区", "顺义区", "昌平区", "大兴区", "怀柔区", "平谷区", "密云县", "延庆县"],
        ["黄浦区", "卢湾区", "徐汇区", "长宁区", "静安区", "普陀区", "虹口区", "杨浦区", "闵行区", "宝山区", "嘉定区", "浦东新区", "金山区", "松江区", "青浦区", "南汇区", "奉贤区", "崇明县"],
        ["和平区", "河东区", "河西区", "南开区", "河北区", "红桥区", "塘沽区", "汉沽区", "大港区", "东丽区", "西青区", "津南区", "北辰区", "武清区", "宝坻区", "宁河县", "静海县", "蓟县"],
        ["万州区", "涪陵区", "渝中区", "大渡口区", "江北区", "沙坪坝区", "九龙坡区", "南岸区", "北碚区", "万盛区", "双桥区", "渝北区", "巴南区", "黔江区", "长寿区", "綦江县", "潼南县", "铜梁县", "大足县", "荣昌县", "璧山县", "梁平县", "城口县", "丰都县", "垫江县", "武隆县", "忠县", "开县", "云阳县", "奉节县", "巫山县", "巫溪县", "石柱土家族自治县", "秀山土家族苗族自治县", "酉阳土家族苗族自治县", "彭水苗族土家族自治县", "江津市", "合川市", "永川市", "南川市"],
        ["石家庄市","张家口市","承德市","秦皇岛市","唐山市","廊坊市","保定市","衡水市","沧州市","邢台市","邯郸市"],
        ["太原市","朔州市","大同市","阳泉市","长治市","晋城市","忻州市","晋中市","临汾市","吕梁市","运城市"],
        ["呼和浩特市","包头市","乌海市","赤峰市","通辽市","呼伦贝尔市","鄂尔多斯市","乌兰察布市","巴彦淖尔市","兴安盟","锡林郭勒盟","阿拉善盟"],
        ["沈阳市","朝阳市","阜新市","铁岭市","抚顺市","本溪市","辽阳市","鞍山市","丹东市","大连市","营口市","盘锦市","锦州市","葫芦岛市"],
        ["长春市","白城市","松原市","吉林市","四平市","辽源市","通化市","白山市","延边州"],
        ["哈尔滨市","齐齐哈尔市","七台河市","黑河市","大庆市","鹤岗市","伊春市","佳木斯市","双鸭山市","鸡西市","牡丹江市","绥化市","大兴安岭地区"],
        ["南京市","徐州市","连云港市","宿迁市","淮安市","盐城市","扬州市","泰州市","南通市","镇江市","常州市","无锡市","苏州市"],
        ["杭州市","湖州市","嘉兴市","舟山市","宁波市","绍兴市","衢州市","金华市","台州市","温州市","丽水市"],
        ["合肥市","宿州市","淮北市","亳州市","阜阳市","蚌埠市","淮南市","滁州市","马鞍山市","芜湖市","铜陵市","安庆市","黄山市","六安市","巢湖市","池州市","宣城市"],
        ["福州市","南平市","莆田市","三明市","泉州市","厦门市","漳州市","龙岩市","宁德市"],
        ["南昌市","九江市","景德镇市","鹰潭市","新余市","萍乡市","赣州市","上饶市","抚州市","宜春市","吉安市"],
        ["济南市","青岛市","聊城市","德州市","东营市","淄博市","潍坊市","烟台市","威海市","日照市","临沂市","枣庄市","济宁市","泰安市","莱芜市","滨州市","菏泽市"],
        ["郑州市","开封市","三门峡市","洛阳市","焦作市","新乡市","鹤壁市","安阳市","濮阳市","商丘市","许昌市","漯河市","平顶山市","南阳市","信阳市","周口市","驻马店市","济源市"],
        ["武汉市","十堰市","襄樊市","荆门市","孝感市","黄冈市","鄂州市","黄石市","咸宁市","荆州市","宜昌市","随州市","省直辖县级行政单位","恩施州"],
        ["长沙市","张家界市","常德市","益阳市","岳阳市","株洲市","湘潭市","衡阳市","郴州市","永州市","邵阳市","怀化市","娄底市","湘西州"],
        ["广州市","深圳市","清远市","韶关市","河源市","梅州市","潮州市","汕头市","揭阳市","汕尾市","惠州市","东莞市","珠海市","中山市","江门市","佛山市","肇庆市","云浮市","阳江市","茂名市","湛江市"],
        ["南宁市","桂林市","柳州市","梧州市","贵港市","玉林市","钦州市","北海市","防城港市","崇左市","百色市","河池市","来宾市","贺州市"],
        ["海口市","三亚市","省直辖县级行政单位"],
        ["成都市","广元市","绵阳市","德阳市","南充市","广安市","遂宁市","内江市","乐山市","自贡市","泸州市","宜宾市","攀枝花市","巴中市","达州市","资阳市","眉山市","雅安市","阿坝州","甘孜州","凉山州"],
        ["贵阳市","六盘水市","遵义市","安顺市","毕节地区","铜仁地区","黔东南州","黔南州","黔西南州"],
        ["昆明市","曲靖市","玉溪市","保山市","昭通市","丽江市","思茅市","临沧市","德宏州","怒江州","迪庆州","大理州","楚雄州","红河州","文山州","西双版纳州"],
        ["拉萨市","那曲地区","昌都地区","林芝地区","山南地区","日喀则地区","阿里地区"],
        ["西安市","延安市","铜川市","渭南市","咸阳市","宝鸡市","汉中市","榆林市","安康市","商洛市"],
        ["兰州市","嘉峪关市","白银市","天水市","武威市","酒泉市","张掖市","庆阳市","平凉市","定西市","陇南市","临夏州","甘南州"],
        ["西宁市","海东地区","海北州","海南州","黄南州","果洛州","玉树州","海西州"],
        ["银川市","石嘴山市","吴忠市","固原市","中卫市"],
        ["乌鲁木齐市","克拉玛依市","自治区直辖县级行政单位","喀什地区","阿克苏地区","和田地区","吐鲁番地区","哈密地区","克孜勒苏柯州","博尔塔拉州","昌吉州","巴音郭楞州","伊犁州","塔城地区","阿勒泰地区"],
        ["香港"],
        ["澳门"],
        ["台北市","高雄市","台中市","花莲市","基隆市","嘉义市","金门市","连江市","苗栗市","南投市","澎湖市","屏东市","台东市","台南市","桃园市","新竹市","宜兰市","云林市","彰化市"]];

    function init(){
        var province = document.getElementById('companyProvinces');
        //给选择框一个高度，可直接写进数据，不然要先创建dom元素option再录值
        province.length=provinces.length;
        for(var i=0;i<provinces.length;i++){
            province.options[i].text=provinces[i];
            if(i==0){
                province.options[i].value="";
            }else{
                province.options[i].value=provinces[i];
            }
        }
    }

    function provincechange(n){
        var city = document.getElementById('companyCity');
        var citystemp=citys[n];
        city.length=citystemp.length;
        for(var i=0;i<citystemp.length;i++){
            city.options[i].text=citystemp[i];
            city.options[i].value = citystemp[i];
        }
        city.options[0].selected=true;
    }
</script>
</body>
</html>
