<%--
  Created by IntelliJ IDEA.
  User: zhangwenyu
  Date: 2019/8/3
  Time: 22:24
  To change this template use File | Settings | File Templates.
--%>
<%
    request.setCharacterEncoding("utf-8");
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!doctype html>
<head>
    <title>招聘详情</title>
    <base href="<%=basePath%>">
    <link rel="icon" href="<%request.getContextPath();%>/static/favicon.ico" type="image/x-icon">
    <script type="text/javascript" src="<%request.getContextPath();%>/static/js/jquery-1.12.4.min.js"></script>
    <link href="<%request.getContextPath();%>/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="<%request.getContextPath();%>/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="<%request.getContextPath();%>/static/layer_v3.1.1/3.1.1/layer.js"></script>
</head>
<body>

<header>
    <nav class="navbar navbar-default " role="navigation">
        <div class="navbar container-fluid navbar-default  navbar-fixed-top">
            <div class="navbar-header">
                <h4 class="logo navbar-text "><a href="#" title="毕业生信息平台">毕业生信息平台</a></h4>
            </div>

            <div id="login-info">
                <c:choose>
                    <c:when test="${not empty sessionScope.get('currentUser')}">
                        <ul class="nav navbar-nav navbar-right">
                            <li title="个人中心"><a href="<%request.getContextPath();%>/returnToMyInfo"><span
                                    class="glyphicon glyphicon-user"></span>${currentUser.id}</a>
                            </li>
                            <li title="退出"><a href="<%request.getContextPath();%>/exit"><span class="glyphicon glyphicon-log-in"></span>注销</a></li>
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
                    <li title="首页"><a href="#">首页</a></li>
                    <li title="宣讲会"><a href="preach.jsp">宣讲会</a></li>
                    <li title="在线招聘" class="active"><a href="job.jsp">在线招聘</a></li>
                    <li title="公告栏"><a href="bulletin.jsp">公告栏</a></li>
                </ul>
            </div>
        </div>
    </nav>
</header>
<section class="container">
    <%--panel panel-default--%>
    <div class="row">

        <div class="col-md-1"></div>

        <div class="col-md-10">
            <div>
                <ul class="breadcrumb">
                    <li>
                        <a href="javascript:history.back(-1);">返回</a>
                    </li>
                    <li class="active">
                        招聘岗位详情
                    </li>
                </ul>
            </div>



            <div class="panel panel-default">
                <ul class="list-group">
                    <li style="display:block" class="list-group-item">
                        <h3 style="height: 30px">
                            <span class="navbar-left" id="JN"></span>
                            <span id="TD" hidden><button  title="投递简历" id="addJob"
                                           class="btn btn-danger btn-sm navbar-right" onclick="send()">投递简历</button></span>
                        </h3>
                    </li>
                    <li style="display:block" class="list-group-item">
                        <h4>基本信息</h4>
                        <div style="margin-top: 20px;margin-left: 20px">
                            <table>
                                <tr>
                                    <td>招聘单位：</td>
                                    <td id="zpdw"></td>
                                    <td>学历要求：</td>
                                    <td id="xlyq"></td>
                                </tr>
                                <tr>
                                    <td>工作薪酬：</td>
                                    <td id="gzxc"></td>
                                    <td>职位福利：</td>
                                    <td id="zwfl"></td>
                                </tr>
                                <tr>
                                    <td>发布日期：</td>
                                    <td id="fbrq"></td>
                                    <td>截止日期：</td>
                                    <td id="jzrq"></td>
                                </tr>
                                <tr>
                                    <td>工作地点：</td>
                                    <td id="gzdd"></td>
                                </tr>
                            </table>

                        </div>
                        <h4>职位描述</h4>
                        <div id="zwms" style="margin-top: 20px;margin-left: 20px">

                        </div>
                        <h4 id="dwjj">
                            公司简介
                        </h4>
                        <div id="dwjj2" style="margin-top: 20px;margin-left: 20px">

                        </div>


                    </li>
                    <li style="display:block" class="list-group-item">
                        <div style="height: 30px">
                            <span class="navbar-left" id="fbdw"><i class="glyphicon glyphicon-user"></i>发布单位：${job.sendName}</span>
                            <span style="padding-left: 10px;"><a class="btn btn-info btn-sm"
                                      onclick="openDialog()"  id="searchCompany">查看公司</a></span>
                            <%--<span class="muted "><i class="glyphicon glyphicon-user"></i>${preach.sendName}</span>--%>
                            <span class="navbar-right" id="djrc"><i class="glyphicon glyphicon-eye-open"></i>点击人次：${job.click}</span>
                        </div>
                    </li>
                </ul>
            </div>
            <div>
                <ul class="container-fluid">

                    <form class=" form-horizontal" id="sendComment">
                        <input type="text" id="sendId" name="sendId" hidden value="${currentUser.id}"/>
                        <input type="text" id="jobId" name="jobId" hidden value="${param.id}"/>
                        <input type="text" id="sendName" name="sendName" hidden value="${currentUser.userName}"/>
                        <div align="center" class="form-group">
                            <div>
                                <textarea class="form-control" name="commentText" id="comment_text" rows="4"
                                          style="resize: none;font-size: 20px;" maxlength="150" placeholder="在此处留下你的评论(150字以内)"  oninput="onTextChange()"></textarea>
                                <span id="tips" style="float: left;color: grey;">&nbsp;</span>
                            </div>
                        </div>
                        <div class="form-group">
                            <div>
                                <button type="button" disabled style="margin-right: 10px" class="btn btn-info navbar-right"
                                        id="save_btn" onclick="addComment()">提交评论
                                </button>
                            </div>
                        </div>
                    </form>
                </ul>
            </div>
            <div class="widget widget_hot">
                        <h3>全部评论</h3>

                <ul id="show_comment">
                    <%--<c:forEach var="comment" items="${post.comment }" varStatus="status">--%>
                        <%--<li style="display:block" class="row">--%>
                            <%--<div class="list-group-item col-md-11" title="${comment.commentText}">--%>
                                <%--<h5 class="list-group-item-heading">${comment.commentText}</h5>--%>
                                <%--<span><p></p></span>--%>
                                <%--<span style="width: 15%" class="muted"><i--%>
                                        <%--class="glyphicon glyphicon-user"></i>${comment.commentUid}</span>--%>
                                <%--<span>&nbsp &nbsp</span>--%>
                                <%--<span class="muted"><i--%>
                                        <%--class="glyphicon glyphicon-time"></i><fmt:formatDate value="${comment.commentTime}"--%>
                                                                                             <%--pattern="yyyy-MM-dd"/></span>--%>
                            <%--</div>--%>
                        <%--</li>--%>
                    <%--</c:forEach>--%>
                </ul>
            </div>
            <div style="height: 30px"></div>
        </div>
    </div>
    </div>
</section>
<%--查看公司详情模态框--%>
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog" style="width: 800px">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="myModalLabel">
                    公司详情
                </h4>
            </div>
            <div class="modal-body" >
                <div  id="details">
                    <h3>基本信息</h3>
                    <div style="margin-left: 10px">
                        <img src="" id="logo" style="border:1px solid #eee;width:84px;height:84px;line-height:84px;text-align:center;">
                        <div style="display:inline-block;margin-left:20px;vertical-align:middle;">
                            <h4 style="margin-bottom:9px;font-weight:normal;" id="companyName"></h4>
                            <p style="margin-bottom:9px;">
                                <span style="margin-right:50px;display:inline-block;" id="category"></span>
                                <span id="scale"></span>
                            </p>
                            <p>
                                <span style="margin-right:50px;display:inline-block;" id="telephone"></span>
                                <span id="address"></span>
                            </p>
                        </div>
                    </div>
                    <h3>公司简介</h3>
                    <div style="margin-left: 10px" id="introduction">

                    </div>
                </div>

            </div>
            <%--<div class="modal-footer">--%>
            <%--<button type="button" class="btn btn-default" data-dismiss="modal">关闭--%>
            <%--</button>--%>
            <%--<button type="button" class="btn btn-primary" id="upload_btn">--%>
            <%--提交更改--%>
            <%--</button>--%>
            <%--</div>--%>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
<script type="text/javascript">

    var jobId = "${param.id}";
    var companyEmail="";

        $(function () {
            $.ajax({
                url:"<%request.getContextPath();%>/job/searchById",
                data:"jobId="+jobId,
                type:"GET",
                success:function (result) {
                    if(result.flag==200){
                        companyEmail=result.job.companyId;
                        show_data(result.job);
                        get_comment();
                    }else{
                        history.back();
                    }
                }
            });


        });


        function get_comment(){
            $.ajax({
                url:"job/searchCom",
                data:"jobId="+jobId,
                type:"GET",
                success:function (result) {
                    if(result.flag=="200"){
                        show_comment(result.comment);
                    }else if(result.flag=="20"){
                        no_comment();
                    }else{
                        console.log("请求失败！");
                    }
                }
            });
        }


        function show_comment(comment) {
            $("#show_comment").empty();
            var userId = "${currentUser.id}";
            $.each(comment,function (index,item) {
                var li = $("<div></div>").addClass("list-group-item");
                var div = $(" <div></div>");
                var h5 = $("<h5></h5>").addClass("list-group-item-heading");
                var name = $("<font style='color:darkorange'></font>").append(item.sendName+"：");
                h5.append(name).append(item.commentText);
                // var p = $("<span><p></p></span>");
                // h5.append(p);
                div.append(h5);
                var div2 = $("<div style='width: 100%'></div>");
                var span_left = $("<div style=\" width: 75%;float: left;\"></div>").append("&nbsp;");
                if(userId==item.sendId) {
                    var a = $("<a href='javascript:del("+item.commentId+")'></a>").append("删除");
                    span_left.append(a);

                }
                var span_rigth= $("<div style=\" width:25%;float: right; \"></div>").addClass("muted");
                var time = $("<i></i>").addClass("glyphicon glyphicon-time").append(item.createTime);
                div2.append(span_left);
                div2.append(span_rigth).append(time);
                div.append(div2);
                li.append(div);
                li.appendTo("#show_comment");
            });
        }


        function no_comment() {
            $("#show_comment").empty();
            var div = $("<div style='width: 100%;color: grey' align='center'></div>").append("暂无评论");
            div.appendTo("#show_comment");
        }


        function del(commentId) {
            $.ajax({
                url:"job/delComment",
                data:"commentId="+commentId,
                type:"GET",
                success:function (result) {
                    if(result.flag=="200"){
                        layer.msg('删除成功！', {icon: 1});
                        get_comment();
                    }else{
                        layer.msg('删除失败，请重试！！', {icon: 5});
                    }
                }
            })
        }


        function onTextChange() {
            var text = $("#comment_text").val().length;
            $("#tips").empty();
            var s = 150-text;
            $("#tips").text("还剩"+s+"字");
            if(text==0){
                $("#save_btn").attr("disabled", "disabled");
                $("#tips").empty();
                $("#tips").append("&nbsp;");
            }else{
                $("#save_btn").removeAttr("disabled");
            }

        }


        function addComment () {
            var  d = $("#sendId").val();
            if(d==""|| d==undefined){
                layer.msg('登录后方可评论！', {icon: 5});
                return false;
            }
            $.ajax({
                url:"<%request.getContextPath();%>/job/insertComment",
                data:$("#sendComment ").serialize(),
                type:"POST",
                success:function (result) {
                    if(result.flag=="200"){
                        layer.msg('评论成功', {icon: 1});
                        $("#comment_text").val("");
                        $("#tips").empty();
                        get_comment();
                    }else{
                        layer.msg('评论失败，请重试', {icon: 2});
                    }

                }

            });
        }
        function openDialog() {
            if(companyEmail==""||companyEmail==undefined){
                layer.msg('发生错误，请重新刷新页面！', {icon: 4});
                return false
            }
            $.ajax({
                url:"<%request.getContextPath();%>/company/searchInfoById",//查询某个公司的url
                data:"companyEmail="+companyEmail,
                type:"GET",
                success:function (result) {
                    console.log(result);
                    if(result.flag=="200"){
                        $("#myModal").modal('show');
                        showMessage(result.company);
                    }else{
                        layer.msg('操作失败，请重试！', {icon: 2});
                    }
                },
                error:function () {
                    layer.msg('请求超时，请稍后！', {icon: 5});
                }

            });

        }


        function show_data(job) {
            $("#JN").append(job.jobName);
            var flag = $("<sup style=\"border-radius: 5px;font-size: 15px;background-color: #c7ddef;color: red\"></sup>").append(job.category);
            flag.appendTo("#JN");
            $("#zpdw").append(job.companyName+"&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;");
            $("#xlyq").append(job.educational);
            $("#gzxc").append(job.money+"&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;");
            $("#zwfl").append(job.jobWelfare);
            $("#fbrq").append(job.createTime+"&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;");
            $("#jzrq").append(job.endTime);
            $("#gzdd").append(job.address);
            $("#zwms").append(job.jobDescribe);
            if(job.introduction==""||job.introduction==undefined) {
                $("#dwjj").hide();
                $("#dwjj2").hide();
                $("#TD").show();
            }else{
                $("#searchCompany").hide();
                $("#TD").hide();
                $("#dwjj2").append(job.introduction);
            }
            $("#fbdw").append(job.sendName);
            $("#djrc").append(job.click);
        }




        function showMessage(company) {
            $("#introduction").empty();
            $("#logo").attr("src",company.logo);
            $("#companyName").text(company.companyName);
            $("#category").text("领域："+company.companyCategory);
            $("#scale").text("规模："+company.scale);
            $("#telephone").text("电话："+company.telephone);
            $("#address").text("地址："+company.provinces+company.city+company.address);
            $("#introduction").append(company.introduction);

        }

        function send() {
            var role = "${currentUser.role}";
            if(role==undefined||role==""){
                layer.msg('请登录！！', {icon: 4});
                return false;
            }else if(role != "1"){
                layer.msg('非学生用户不可投递！！', {icon: 4});
                return false;
            }

            var studentId = "${currentUser.id}";
            $.ajax({
                url: "job/addSend",
                type: "POST",
                data: {
                    'studentId': studentId,
                    'jobId': jobId
                },
                success: function (result) {
                    if(result.flag=="200"){
                        layer.msg('投递成功', {icon: 1});
                    }else{
                        layer.msg(result.msg, {icon: 2});
                    }
                }
            });
        }

</script>

</body>
</html>
