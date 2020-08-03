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
<%@ page language="java" contentType="text/html;charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
    <meta charset="UTF-8">
    <title>毕业生信息平台</title>
    <base href="<%=basePath%>">
    <link rel="icon" href="<%request.getContextPath();%>/static/favicon.ico" type="image/x-icon">
    <script type="text/javascript" src="<%request.getContextPath();%>/static/js/jquery-3.2.1.min.js"></script>
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
                    <a class="list-group-item active" title="我的信息" >我的信息</a>
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
                    <a class="list-group-item" title="个人简历" href="studentResume.jsp">个人简历</a>
                </li>
            </ul>
        </div>

        <div class="col-md-10">
            <div>
                <table style="width: 900px">
                    <tr>
                        <td style="width: 500px"><h3>${currentUser.userName}</h3></td>

                        <td style="width: 400px;margin-bottom: 2px" align="right"><a style="color: #2446AB" href="javascript:void(0);"  onClick="upload_pw_modal()">修改密码</a></td>
                    </tr>
                </table>
            </div>
            <%--<div>--%>
                <%--<h3>我的信息<sup style="border-radius: 5px;font-size: 15px;background-color: #c7ddef;color: blue">学生</sup></h3>--%>
            <%--</div>--%>

            <div class="panel panel-default ">
                <div class="container">

                    <div style="margin: 20px">

                        <form  class="col-md-9 form-horizontal"  id="editStudent" >
                            <div class="form-group">
                                <label class="col-sm-2 control-label">审核状态：</label>
                                <div class="col-sm-2" id="status" style="margin-top: 7px">

                                </div>
                                <label class="col-sm-2 control-label">审核时间：</label>
                                <div class="col-sm-2" id="ensureTime" style="margin-top: 7px">

                                </div>
                                <label class="col-sm-2 control-label" >审核人员：</label>
                                <div class="col-sm-2" id="confirmName" style="margin-top: 7px">

                                </div>
                            </div>
                            <div align="left">
                                <h3>基本信息</h3>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label">姓名：</label>
                                <div class="col-sm-4">
                                    <input type="text" readonly class="form-control" name="xm" id="xm" value="${currentUser.userName}"/>
                                </div>
                                <div class="col-sm-3">
                                    <h5 id="xmH5"  class="help-block" style="color: red"></h5>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">性别：</label>
                                <div class="col-sm-4">
                                    <select  class="form-control" name="xb" id="xb" disabled  >
                                        <option selected value="">请选择...</option>
                                        <option value="1">男</option>
                                        <option value="0">女</option>
                                    </select>
                                </div>
                                <div class="col-sm-3">
                                    <h5 id="xbH5"  class="help-block" style="color: red"></h5>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">身份证号：</label>
                                <div class="col-sm-4">
                                    <input type="text" class="form-control" name="sfzh" id="sfzh" readonly/>
                                </div>
                                <div class="col-sm-3">
                                    <h5 id="sfH5"  class="help-block" style="color: red"></h5>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label">出生日期：</label>
                                <div class="col-sm-4">
                                    <input  class="form-control" name="csrq" id="csrq" readonly/>
                                </div>
                                <div class="col-sm-3">
                                    <h5 id="csH5"  class="help-block" style="color: red"></h5>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label">政治面貌：</label>
                                <div class="col-sm-4">
                                    <select  class="form-control" name="zzmm" id="zzmm" disabled  >
                                        <option selected value="">请选择...</option>
                                        <option value="中共党员">中共党员</option>
                                        <option value="预备党员">预备党员</option>
                                        <option value="共青团员">共青团员</option>
                                        <option value="群众">群众</option>
                                        <option value="其他">其他</option>
                                    </select>
                                </div>
                                <div class="col-sm-3">
                                    <h5 id="zzH5"  class="help-block" style="color: red"></h5>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">民族：</label>
                                <div class="col-sm-4">
                                    <select  class="form-control" name="mz" id="mz" disabled  >
                                        <option selected value="">请选择。。。</option>
                                        <option value="汉族">汉族</option>
                                        <option value="蒙古族">蒙古族</option>
                                        <option value="回族">回族</option>
                                        <option value="藏族">藏族</option>
                                        <option value="维吾尔族">维吾尔族</option>
                                        <option value="苗族">苗族</option>
                                        <option value="彝族">彝族</option>
                                        <option value="壮族">壮族</option>
                                        <option value="布依族">布依族</option>
                                        <option value="朝鲜族">朝鲜族</option>
                                        <option value="满族">满族</option>
                                        <option value="侗族">侗族</option>
                                        <option value="瑶族">瑶族</option>
                                        <option value="白族">白族</option>
                                        <option value="土家族">土家族</option>
                                        <option value="哈尼族">哈尼族</option>
                                        <option value="哈萨克族">哈萨克族</option>
                                        <option value="傣族">傣族</option>
                                        <option value="黎族">黎族</option>
                                        <option value="傈僳族">傈僳族</option>
                                        <option value="佤族">佤族</option>
                                        <option value="畲族">畲族</option>
                                        <option value="高山族">高山族</option>
                                        <option value="拉祜族">拉祜族</option>
                                        <option value="水族">水族</option>
                                        <option value="东乡族">东乡族</option>
                                        <option value="纳西族">纳西族</option>
                                        <option value="景颇族">景颇族</option>
                                        <option value="柯尔克孜族">柯尔克孜族</option>
                                        <option value="土族">土族</option>
                                        <option value="达斡尔族">达斡尔族</option>
                                        <option value="仫佬族">仫佬族</option>
                                        <option value="羌族">羌族</option>
                                        <option value="布朗族">布朗族</option>
                                        <option value="撒拉族">撒拉族</option>
                                        <option value="毛南族">毛南族</option>
                                        <option value="仡佬族">仡佬族</option>
                                        <option value="锡伯族">锡伯族</option>
                                        <option value="阿昌族">阿昌族</option>
                                        <option value="普米族">普米族</option>
                                        <option value="塔吉克族">塔吉克族</option>
                                        <option value="怒族">怒族</option>
                                        <option value="乌孜别克族">乌孜别克族</option>
                                        <option value="俄罗斯族">俄罗斯族</option>
                                        <option value="鄂温克族">鄂温克族</option>
                                        <option value="德昂族">德昂族</option>
                                        <option value="保安族">保安族</option>
                                        <option value="裕固族">裕固族</option>
                                        <option value="京族">京族</option>
                                        <option value="塔塔尔族">塔塔尔族</option>
                                        <option value="独龙族">独龙族</option>
                                        <option value="鄂伦春族">鄂伦春族</option>
                                        <option value="赫哲族">赫哲族</option>
                                        <option value="门巴族">门巴族</option>
                                        <option value="珞巴族">珞巴族</option>
                                        <option value="基诺族">基诺族</option>
                                    </select>
                                </div>
                                <div class="col-sm-3">
                                    <h5 id="mzH5"  class="help-block" style="color: red"></h5>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">生源地：</label>
                                <div class="col-sm-4">
                                    <input type="text" class="form-control" name="syd" id="syd" readonly placeholder="例如：广东省惠州市" />
                                </div>
                                <div class="col-sm-3">
                                    <h5 id="syH5"  class="help-block" style="color: red"></h5>
                                </div>
                            </div>
                            <div align="left">
                                <h3>联系方式</h3>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">手机号码：</label>
                                <div class="col-sm-4">
                                    <input type="text" class="form-control" name="sjhm" id="sjhm" readonly/>
                                </div>
                                <div class="col-sm-3">
                                    <h5 id="sjH5"  class="help-block" style="color: red"></h5>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">电子邮箱：</label>
                                <div class="col-sm-4">
                                    <input type="text" class="form-control" name="dzyx" id="dzyx" readonly/>
                                </div>
                                <div class="col-sm-3">
                                    <h5 id="dzH5"  class="help-block" style="color: red"></h5>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">家庭地址：</label>
                                <div class="col-sm-4">
                                    <input type="text" class="form-control" name="jtdz" id="jtdz" readonly placeholder="xx区xx镇xx村xx号"/>
                                </div>
                                <div class="col-sm-3">
                                    <h5 id="jtH5"  class="help-block" style="color: red"></h5>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">家庭邮编：</label>
                                <div class="col-sm-4">
                                    <input type="text" class="form-control" name="jtyb" id="jtyb" readonly/>
                                </div>
                                <div class="col-sm-3">
                                    <h5 id="ybH5"  class="help-block" style="color: red"></h5>
                                </div>
                            </div>

                            <div align="left">
                                <h3>学籍信息</h3>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">学号：</label>
                                <div class="col-sm-4">
                                    <input type="text" class="form-control" name="xh" id="xh" value="${currentUser.id}" readonly/>
                                </div>
                                <div class="col-sm-3">
                                    <h5 id="xhH5"  class="help-block" style="color: red"></h5>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">学校名称：</label>
                                <div class="col-sm-4">
                                    <input type="text" class="form-control" name="xxmc" id="xxmc" readonly value="五邑大学"/>
                                </div>
                                <div class="col-sm-3">
                                    <h5 id="xxH5"  class="help-block" style="color: red"></h5>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">校区：</label>
                                <div class="col-sm-4">
                                    <input type="text" class="form-control" name="xq" id="xq" readonly value="主校区"/>
                                </div>
                                <div class="col-sm-3">
                                    <h5 id="xqH5"  class="help-block" style="color: red"></h5>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="xy" class="col-sm-2 control-label">学院：</label>
                                <div class="col-sm-4">
                                    <select class="form-control" name="xy" id="xy" disabled onchange="showZY(this.value)"  title="学院">

                                    </select>
                                    <%--<input type="text" class="form-control" name="xy" id="xy" readonly/>--%>
                                </div>
                                <div class="col-sm-3">
                                    <h5 id="xyH5"  class="help-block" style="color: red"></h5>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="zy" class="col-sm-2 control-label">专业：</label>
                                <div class="col-sm-4">
                                    <select class="form-control" name="zy" id="zy" disabled   title="专业">

                                    </select>
                                </div>
                                <div class="col-sm-3">
                                    <h5 id="zyH5"  class="help-block" style="color: red"></h5>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">班级：</label>
                                <div class="col-sm-4">
                                    <input type="text" class="form-control" name="bj" id="bj" readonly/>
                                </div>
                                <div class="col-sm-3">
                                    <h5 id="bjH5"  class="help-block" style="color: red"></h5>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">学历：</label>
                                <div class="col-sm-4">
                                    <%--<input type="text" class="form-control" name="xl" id="xl" readonly/>--%>
                                    <select class="form-control" name="xl" id="xl" disabled>
                                        <option selected value="">请选择...</option>
                                        <option value="博士">博士</option>
                                        <option value="硕士">硕士</option>
                                        <option value="本科">本科</option>
                                        <option value="大专">大专</option>
                                        <option value="高中">高中</option>
                                        <option value="初中">初中</option>
                                        <option value="小学">小学</option>
                                    </select>
                                </div>
                                <div class="col-sm-3">
                                    <h5 id="xlH5"  class="help-block" style="color: red"></h5>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">学制：</label>
                                <div class="col-sm-4">
                                    <select class="form-control" name="xz" id="xz" disabled>
                                        <option selected value="">请选择...</option>
                                        <option  value="2">2</option>
                                        <option  value="3">3</option>
                                        <option  value="4">4</option>
                                        <option  value="5">5</option>
                                        <option  value="6">6</option>
                                        <option  value="7">7</option>
                                        <option  value="8">8</option>
                                    </select>
                                    <%--<input type="text" class="form-control" name="xz" id="xz" readonly/>--%>
                                </div>
                                <div class="col-sm-3">
                                    <h5 id="xzH5"  class="help-block" style="color: red "></h5>
                                </div>
                            </div>


                            <div class="form-group" id="remarkDiv" hidden>
                                <label class="col-sm-2 control-label">备注：</label>
                                <div class="col-sm-4" id="remark">

                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-offset-3 col-sm-10" >
                                    <button type="button" class="btn btn-default" id="update_btn">编辑</button>
                                    <button type="button" class="btn btn-primary" id="save_btn">确认</button>
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

    $(function () {
        showXY();
        var role="${currentUser.role}";
        if(role!="1"){
            window.location.href = "index.jsp";
        }

        $("#save_btn").hide();
        $("#update_btn").show();
        $("#cancel_btn").hide();
        first();
    });



    function first(){
        var xh = "${currentUser.id}";
        $("#status").empty();
        $("#ensureTime").empty();
        $("#confirmName").empty();
        $.ajax({
            url: "/student/searchInfoById",//查询该学生信息url
            data:"xh="+xh,
            type: "GET",
            success:function (result) {
                console.log(result);
                if(result.flag=="200"){
                    show_student_with_xh(result.student);
                }else{
                    show_student_without_xh();
                }
            }
        });
    }


    // $("#xy").change(function () {
    //     showZY();
    // });

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
        });
    }


    // $("#xy").on("change",function () {
    //    showZY();
    // });


    function showCollege(list) {
        $("#xy").empty();
        // var optionEle = $("<option></option>").append("请选择").attr("value","");
        var optionEle = $("<option value=''>请选择</option>");
        optionEle.appendTo("#xy");
        $.each(list,function (index,item) {
            var optionEle2 = $("<option value='"+item.name+"'>"+item.name+"</option>");//.append(item.name).attr("value",item.name);
            optionEle2.appendTo("#xy");
        });
        // var optionEle = $("<option></option>").append("请选择").attr("value","");
        // optionEle.appendTo("#xy");
        // $.each(list,function (index,item) {
        //     var optionEle = $("<option></option>").append(item.name).attr("value",item.name);
        //     optionEle.appendTo("#xy");
        // });
    }

    function showZY(xy){
        // var xy =$("#xy").val();
        // alert(xy);
        if(xy==""||xy==undefined){
            $("#zy").empty();
            var optionEle = $("<option value=''>请选择</option>");
            optionEle.appendTo("#zy");
            return;
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


    function showDept(list2){
        // console.log(list2);
        $("#zy").empty();
        // var optionEle = $("<option></option>").append("请选择").attr("value","");
        var optionEle = $("<option value=''>请选择</option>");
         optionEle.appendTo("#zy");
        $.each(list2,function (index,item) {
            var optionEle2 = $("<option value='"+item.name+"'>"+item.name+"</option>");//.append(item.name).attr("value",item.name);
            optionEle2.appendTo("#zy");
        });
    }

    laydate.render({
        elem:'#csrq',
        type:'date',
        format:'yyyy-MM-dd',
        theme:'molv'

    });


    function show_student_without_xh() {
        var $xy=$("#xy");
        $("#xm").val("${currentUser.userName}");
        $("#xh").val("${currentUser.id}");
        $xy.val("${currentUser.userDept}");
        $xy.trigger("change");
        var status = $("<span style=\"color: red\"></span>").append("未填写");
        status.appendTo("#status");
        // $("#status").append("未填写");
    }


    function show_student_with_xh(student){
        var $xy=$("#xy");

        // $xy.find("option[value = '"+student.xy+"']").attr("selected","selected");
        $xy.val(student.xy);
        // //TODO 检查这里
        $xy.trigger("change");
        $("#xm").val(student.xm);
        $("#xb").val(student.xb);
        $("#sfzh").val(student.sfzh);
        $("#csrq").val(student.csrq);
        $("#zzmm").val(student.zzmm);
        $("#mz").val(student.mz);
        $("#syd").val(student.syd);
        $("#sjhm").val(student.sjhm);
        $("#dzyx").val(student.dzyx);
        $("#jtdz").val(student.jtdz);
        $("#jtyb").val(student.jtyb);
        $("#xh").val(student.xh);
        $("#xxmc").val(student.xxmc);
        $("#xq").val(student.xq);

        var $zy=$("#zy");
        $zy.val(student.zy);
        // $zy.find("option[text = '"+student.zy+"']").attr("selected","selected");
        // $("#zy").attr("text",student.zy);
        $zy.trigger("change");
        // var s=$("#zy").val();
        // alert(s);

        // $("#zy").find("option[text="+student.zy+"]").attr("selected", "selected");
        $("#bj").val(student.bj);
        $("#xl").val(student.xl);
        $("#xz").val(student.xz);
        if(student.status==1){
            $("#update_btn").hide();
            var status = $("<span style=\"color: green\"></span>").append("通过");
            status.appendTo("#status");
        }else if(student.status==2){
            var status = $("<span style=\"color: black\"></span>").append("不通过");
            status.appendTo("#status");
        }else{
            var status = $("<span style=\"color: blue\"></span>").append("待审核");
            status.appendTo("#status");
        }
        if(student.ensureTime != null&&student.ensureTime!=""){

            $("#ensureTime").append(student.ensureTime);
        }
        if(student.confirmName != null&&student.confirmName!=""){

            $("#confirmName").append(student.confirmName);
        }

    }


    $("#update_btn").click(function () {
        $("#save_btn").show();
        $("#update_btn").hide();
        $("#cancel_btn").show();
        $("#editStudent input").attr("readonly",false);
        $("#editStudent select").attr("disabled",false);
        var sfzh=$("#sfzh").val();
        if(sfzh !=""){
            $("#sfzh").attr("readonly",true);
        }
        $("#xh").attr("readonly",true);
        $("#xxmc").attr("readonly",true);
        $("#xq").attr("readonly",true);
        // $("#user_name").attr("readonly",false);
        // $("#user_sex").attr("disabled",false);
        // $("#user_birth").attr("disabled",false);
        // $("#user_class").attr("readonly",false);
        // $("#user_desc").attr("readonly",false);
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

    // $(function () {
    //     $("#save_btn").hide();
    //     $("#update_btn").show();
    //     $("#cancel_btn").hide();
    //     $("#xy").change(function () {
    //         showZY();
    //     });
    // });

    $(document).on("click","#save_btn",function () {
        $("#editStudent h5").text("");
        var xm = $("#xm").val();
        if (xm == "") {
            $("#xmH5").text("请填写姓名！");
            $("#xm").focus();
            return false;
        }

        var xb = $("#xb").val();
        if (xb == "") {
            $("#xbH5").text("请选择性别！");
            $("#xb").focus();
            return false;
        }

        var sfzh = $("#sfzh").val();
        if (sfzh == "") {
            $("#sfH5").text("请填写身份证号！");
            $("#sfzh").focus();
            return false;
        }

        var csrq = $("#csrq").val();
        if (csrq == "") {
            $("#csH5").text("请选择出生日期！");
            $("#csrq").focus();
            return false;
        }
        var zzmm = $("#zzmm").val();
        if (zzmm == "") {
            $("#zzH5").text("请选择政治面貌！");
            $("#zzmm").focus();
            return false;
        }

        var mz = $("#mz").val();
        if (mz == "") {
            $("#mzH5").text("请选择民族！");
            $("#mz").focus();
            return false;
        }

        var syd = $("#syd").val();
        if (syd == "") {
            $("#syH5").text("请填写生源地！");
            $("#syd").focus();
            return false;
        }

        var sjhm = $("#sjhm").val();
        var resPhone = /^1(3|4|5|6|7|8|9)\d{9}$/;
        if (sjhm == "") {
            $("#sjH5").text("请填写手机号码！");
            $("#sjhm").focus();
            return false;
        } else if (!resPhone.test(sjhm)) {
            $("#sjH5").text("无效手机号码！");
            $("#sjhm").focus();
            return false;
        }

        var dzyx = $("#dzyx").val();
        var resEmail = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;
        if (dzyx == "") {
            $("#dzH5").text("请填写电子邮箱！");
            $("#dzyx").focus();
            return false;
        } else if (!resEmail.test(dzyx)) {
            $("#dzH5").text("邮箱格式不正确！");
            $("#dzyx").focus();
            return false;
        }

        var jtdz = $("#jtdz").val();
        if (jtdz == "") {
            $("#jtH5").text("请填写家庭地址！");
            $("#jtdz").focus();
            return false;
        }


        var jtyb = $("#jtyb").val();
        if (jtyb == "") {
            $("#ybH5").text("请填写家庭邮编！");
            $("#jtyb").focus();
            return false;
        } else if (jtyb.length != 6) {
            $("#ybH5").text("邮编编号格式不正确！");
            $("#jtyb").focus();
            return false;
        }

        var xy = $("#xy").val();
        if (xy == "") {
            $("#xyH5").text("请选择学院！");
            $("#xy").focus();
            return false;
        }

        var zy = $("#zy").val();
        if (zy == "") {
            $("#zyH5").text("请选择专业！");
            $("#zy").focus();
            return false;
        }

        var bj = $("#bj").val();
        if (bj == "") {
            $("#bjH5").text("请填写班级！");
            $("#bj").focus();
            return false;
        }

        var xl = $("#xl").val();
        if (xl == "") {
            $("#xlH5").text("请选择学历！");
            $("#xl").focus();
            return false;
        }

        var xz = $("#xz").val();
        if (xz == "") {
            $("#xzH5").text("请选择学制！");
            $("#xz").focus();
            return false;
        }


        layer.confirm("是否确认修改？", {btn: ['确定', '取消'], title: "提示"}, function () {
            $.ajax({
                url: "/student/insertOrUpdate",//修改学生信息url
                type: "POST",
                data: $("#editStudent").serialize(),
                success: function (result) {
                    console.log(result);
                    if(result.flag=="200") {
                        layer.msg(result.msg, {icon: 1});
                        javascript:location.reload();
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
