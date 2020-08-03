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
    <script charset="utf-8" src="<%request.getContextPath();%>/static/laydate/laydate.js"></script></head>
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
                    <a class="list-group-item active" title="审核生源信息">审核生源信息</a>
                </li>
                <li style="display:block">
                    <a class="list-group-item" title="审核就业信息" href="teacherSignEmp.jsp">审核就业信息</a>
                </li>
                </ul>
        </div>

        <div class="col-md-10">

            <div>
                <h3>审核学生生源信息</h3>
            </div>

            <div class="panel panel-default ">
                <div class="container-fluid">
                    <div style="margin: 20px;height: 550px">
                        <form class=" form-inline"  id="form-search">
                            <label class="form-inline">学号</label>
                            <input type="text" class="form-control" placeholder="学生学号" name="xh" id="xh">
                            <span>&nbsp  </span>
                            <label class="form-inline">姓名</label>
                            <input type="text" class="form-control" placeholder="学生姓名" name="xm" id="xm">
                            <span> &nbsp </span>
                            <label class="form-inline">状态</label>
                            <select id="status" class="form-control " name="status" >
                                <option value="-1" selected>全部</option>
                                <option value="0">待审核</option>
                                <option value="1">通过</option>
                                <option value="2">不通过</option>
                            </select>
                            <span>&nbsp </span>
                            <a id="search_btn" onclick="searchInfo()" class="btn btn-info">搜索</a>
                        </form>
                        <div class="panel panel-default">
                            <ul class="list-group" id="followUser">
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
                                    <tbody id="stuInfo">

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
<div class="modal fade" id="checkInfo" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog" style="width: 900px">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="myModalLabel2">
                    审核学生信息
                </h4>
            </div>
            <div class="modal-body" >

                <div style="margin: 20px;height: 750px;">
                    <form  class="col-md-9 form-horizontal"  id="check_info" >
                        <h3>基本信息</h3>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">学生姓名：</label>
                            <div class="col-sm-4" id="s_xm">
                            </div>
                            <label class="col-sm-2 control-label">性别：</label>
                            <div class="col-sm-4" id="xb">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">身份证号：</label>
                            <div class="col-sm-4" id="sfzh">
                            </div>
                            <label class="col-sm-2 control-label">出生日期：</label>
                            <div class="col-sm-4" id="csrq">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">政治面貌：</label>
                            <div class="col-sm-4" id="zzmm">
                            </div>
                            <label class="col-sm-2 control-label">民族：</label>
                            <div class="col-sm-4" id="mz">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">生源地：</label>
                            <div class="col-sm-4" id="syd">
                            </div>

                        </div>
                        <h3>联系方式</h3>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">手机号码：</label>
                            <div class="col-sm-4" id="sjhm">
                            </div>
                            <label class="col-sm-2 control-label">电子邮箱：</label>
                            <div class="col-sm-4" id="dzyx">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">邮政编码：</label>
                            <div class="col-sm-4" id="jtyb">
                            </div>
                            <label class="col-sm-2 control-label">家庭地址：</label>
                            <div class="col-sm-4" id="jtdz">
                            </div>
                        </div>

                        <h3>学籍信息</h3>

                        <div class="form-group">
                            <label class="col-sm-2 control-label">学生学号：</label>
                            <div class="col-md-4">
                                <input type="text"  class="form-control" name="xh" id="s_xh" readonly/>
                            </div>
                            <label class="col-sm-2 control-label">学校名称：</label>
                            <div class="col-sm-4" id="xxmc">

                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label">所在校区：</label>
                            <div class="col-sm-4" id="xq">

                            </div>
                            <label class="col-sm-2 control-label">所在院系：</label>
                            <div class="col-sm-4" id="xy">

                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">所在专业：</label>
                            <div class="col-sm-4" id="zy">

                            </div>
                            <label class="col-sm-2 control-label">班级：</label>
                            <div class="col-sm-4" id="bj">

                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">学历：</label>
                            <div class="col-sm-4" id="xl">

                            </div>
                            <label class="col-sm-2 control-label">学制：</label>
                            <div class="col-sm-4" id="xz">

                            </div>
                        </div>

                        <div class="form-group" id="showMes" hidden>
                            <input type="text" name="confirmName" id="confirmName" hidden/>
                            <label class="col-sm-2 control-label">审核人员</label>
                            <div class="col-sm-4" id="confirm_name">

                            </div>
                            <label class="col-sm-2 control-label">审核时间</label>
                            <div class="col-sm-4" id="ensure_time">

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
                            <label class="col-sm-2 control-label">当前状态</label>
                            <div class="col-sm-4" id="status1">

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
                <button type="button" class="btn btn-primary" onclick="updateInfo()">
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
        show_info(1);
    });


    function show_info(page) {
        var status = $("#status").val();
        var data = "rows=10&page="+page+"&xy="+dept+"&status="+status;
        var xh = $("#xh").val();
        if(xh!=""&&xh!=undefined){
            data+="&xh="+xh;
        }
        var xm=$("#xm").val();
        if(xm!=""&&xm!=undefined){
            data+="&xm="+xm;
        }

        $.ajax({
            url:"<%request.getContextPath();%>/student/searchByCondition",
            data:data,
            type:"GET",
            success:function (result) {
                console.log(result);
                $("#stuInfo").empty();
                $("#page_info_area").empty();
                $("#page_nav_area").empty();
                if(result.flag=="200"){
                    build_emp_table(result);
                    build_page_info(result);
                    build_page_nav(result);
                }else{
                    var div=$("<div style='color: grey' align='center'></div>").append("暂无记录");
                    div.appendTo("#stuInfo");
                }
            }
        })
    }



    function searchInfo() {
        show_info(1);
    }


    function editInfo(xh) {
        $.ajax({
            url:"<%request.getContextPath();%>/student/searchInfoById",
            data:"xh="+xh,
            type:"GET",
            success:function (result) {
                console.log(result);
                if(result.flag=="200"){
                    $("#checkInfo").modal('show');
                    emptyInfo();
                    show_one_info(result.student);
                }else{

                }
            }
        })
    }


    function show_one_info(student) {
        $("#s_xm").append(student.xm);
        if(student.xb=="1"){
            $("#xb").append("男");
        }else {
            $("#xb").append("女");
        }
        $("#sfzh").append(student.sfzh);
        $("#csrq").append(student.csrq);
        $("#zzmm").append(student.zzmm);
        $("#mz").append(student.mz);
        $("#syd").append(student.syd);
        $("#sjhm").append(student.sjhm);
        $("#dzyx").append(student.dzyx);
        $("#jtdz").append(student.jtdz);
        $("#jtyb").append(student.jtyb);
        $("#s_xh").val(student.xh);
        $("#xxmc").append(student.xxmc);
        $("#xq").append(student.xq);
        $("#xy").append(student.xy);
        $("#zy").append(student.zy);
        $("#bj").append(student.bj);
        $("#xl").append(student.xl);
        $("#xz").append(student.xz);
        $("#confirm_name").append(student.confirmName);
        $("#ensure_time").append(student.ensureTime);
        if(student.status=="1") {
            $("#status1").append("通过");
            $("#showMes").show();
        }else if(student.status=="2"){
            $("#status1").append("不通过");
            $("#remark").val(student.remark);
            $("#showRemark").show();
            $("#showMes").show();
        }else{
            $("#status1").append("待审核");
        }
    }

    function emptyInfo() {
        $("#s_xm").empty();
        $("#xb").empty();
        $("#sfzh").empty();
        $("#csrq").empty();
        $("#zzmm").empty();
        $("#mz").empty();
        $("#syd").empty();
        $("#sjhm").empty();
        $("#dzyx").empty();
        $("#jtdz").empty();
        $("#jtyb").empty();
        $("#s_xh").val("");
        $("#xxmc").empty();
        $("#xq").empty();
        $("#xy").empty();
        $("#zy").empty();
        $("#bj").empty();
        $("#xl").empty();
        $("#xz").empty();
        $("#status1").empty();
        $("#remark").val("");
        $("#confirm_name").empty();
        $("#ensure_time").empty();
        $("input[type='radio']").attr("checked",false);//取消选中
        $("#showRemark").hide();
        $("#showMes").hide();
    }


    function checkStatus() {
        var status = $('#check_info input:radio:checked').val();
        if(status=="2"){
            $("#showRemark").show();
        }else{
            $("#showRemark").hide();
        }

    }


    function updateInfo() {
        $("#confirmName").val(name);
        var xh = $("#s_xh").val();
        if (xh == "" || xh == undefined) {
            layer.msg('登录超时，请重新登录（id）！', {icon: 2});
            return false;
        }

        $("#confirm_name").val(name);
        var confirmName = $("#confirm_name").val();
        if (confirmName == "" || confirmName == undefined) {
            layer.msg('登录超时，请重新登录（name)！', {icon: 2});
            return false;
        }
        var status = $('#check_info input:radio:checked').val();
        if (status == "" || status == undefined) {
            layer.msg('请选择意见！', {icon: 2});
            return false;
        }
        if (status == "2") {
            var remark = $("#remark").val();
            if (remark == "" || remark == undefined) {
                layer.msg('请填写原因！', {icon: 2});
                return false;
            }
        } else {
            $("#remark").val("");
        }
        layer.confirm("是否确认修改？", {btn: ['确定', '取消'], title: "提示"}, function () {
            $.ajax({
                url: "<%request.getContextPath();%>/student/teacherCheck",
                data: $("#check_info").serialize(),
                type: "POST",
                success: function (result) {
                    if (result.flag == "200") {
                        layer.msg('修改成功！', {icon: 1});
                        $("#checkInfo").modal('hide');
                        show_info(1);
                    } else {
                        layer.msg('修改失败，请重试！', {icon: 1});
                    }
                }
            })
        });
    }


    function build_emp_table(result) {
        $("#stuInfo").empty();

        var student = result.pageInfo.list;
        $.each(student,function (index,item) {
            var tr= $("<tr role='row'></tr>");
            var td1 =$("<td></td>").addClass("odd").append(item.xh);
            var td2 = $("<td></td>").addClass("odd").append(item.xm);
            var td3 = $("<td></td>").addClass("odd").append(item.xy);
            var td4 = $("<td></td>").addClass("odd").append(item.zy);
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
            var button = $("<button onclick=\'editInfo("+item.xh+")\'style='width: 50px;height: 25px;' >操作</button>").addClass("btn btn-danger btn-sm");
            td7.append(button);
            tr.append(td1).append(td2).append(td3).append(td4).append(td5).append(td6).append(td7);
            tr.appendTo("#stuInfo");
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
