<%--
  Created by IntelliJ IDEA.
  User: zhangwenyu
  Date: 2019/8/6
  Time: 14:39
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
<html>
<head>
    <title>登录入口</title>
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
                            <li title="个人中心" class="active"><a href="<%request.getContextPath();%>/returnToMyInfo"><span
                                    class="glyphicon glyphicon-user"></span>${currentUser.id}</a>
                            </li>
                            <li title="退出"><a href="<%request.getContextPath();%>/exit"><span class="glyphicon glyphicon-log-in"></span>退出</a></li>
                        </ul>
                    </c:when>
                    <c:otherwise>
                        <ul class="nav navbar-nav navbar-right">
                            <li title="企业注册"><a href="register.jsp"><span class="glyphicon glyphicon-user"></span> 企业注册</a></li>
                            <li title="登录" class="active"><a><span class="glyphicon glyphicon-log-in"></span> 登录</a></li>
                        </ul>
                    </c:otherwise>
                </c:choose>
            </div>


            <div class="navbar-collapse collapse" style="text-align: center">
                <ul class="nav navbar-nav nav-pills" style="display: inline-block;float: none">
                    <li title="首页"><a href="#">首页</a></li>
                    <li title="宣讲会"><a href="preach.jsp">宣讲会</a></li>
                    <li title="在线招聘"><a href="job.jsp">在线招聘</a></li>
                    <li title="公告栏"><a href="bulletin.jsp">公告栏</a></li>
                </ul>
            </div>
        </div>
    </nav>
</header>
<section class=" container">
    <div class="panel panel-default" style="margin: 50px">
        <div class="row clearfix">
            <div class="col-md-12" style="text-align: center"> <h2>用户登录</h2></div>
            <div class="col-md-12 column" style="margin: 20px">


                <div class="col-md-3"></div>

                <form class="col-md-9 form-horizontal" id="loginUser">
                    <div class="form-group">
                        <label for="id" class="col-sm-2 control-label">账号</label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control" name="id" id="id" oninput="onTextChange()" style="width: 200px"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="password" class="col-sm-2 control-label">密码</label>
                        <div class="col-sm-4">
                            <input type="password" class="form-control" name="password" id="password" oninput="onTextChange()" style="width: 200px"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="verify" class="col-sm-2 control-label">验证码</label>
                        <div class="col-sm-2">
                            <input type="text" class="form-control" name="verify" id="verify" oninput="onTextChange()" autocomplete="off" style="width: 130px"/>
                            <%--<img id="vCode" alt="" title="点击更换" src = "<c:url value='/setVerify?name=registCode&'/>"  onClick="changeVerifyCode(this)" >--%>
                        </div>
                        <div class="col-sm-1">
                            <img id="vCode" alt="" title="点击更换" src = "<%request.getContextPath();%>/setVerify?name=registerCode"  onClick="changeVerifyCode(this)" style="width: 70px;height: 34px;">
                        </div>
                    </div>
                    <div class="form-group">
                        <a href="javascript:showFetch();" class="col-sm-offset-5">忘记密码</a>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-offset-3 col-sm-10">
                            <input id="submit_btn" type="button"  style="width: 100px;height: 37px; cursor: not-allowed;" value="登&nbsp;&nbsp;&nbsp;录" disabled="disabled" onclick="login()"/>
                            <%--<button type="button" class="btn btn-default" style="color: #2446AB;width: 100px;height: 37px;" onClick="showFetch()">忘记密码</button>--%>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</section>

<script type="text/javascript">
    function onTextChange() {
        var id=$("#id").val();
        var password=$("#password").val();
        var verify=$("#verify").val();
        if(id!=""&&id!=null&&password!=""&&password!=null&&verify!=""&&verify!=null){
            $("#submit_btn").removeAttr("disabled");
            $("#submit_btn").css("cursor","pointer");
            $("#submit_btn").css("background-color","#6abeed");
            $("#submit_btn").css("color","white");
        }else{
            $("#submit_btn").attr("disabled", "disabled");
            $("#submit_btn").css("cursor","not-allowed");
            $("#submit_btn").css("background-color","");
            $("#submit_btn").css("color","");
        }
    }

   function login() {
        $.ajax({
            url:"/login",
            data:$("#loginUser").serialize(),
            type:"POST",
            success:function (result) {
                changeVoce();
                if(result.flag=="200"){
                    window.location.href = result.data;
                    layer.msg('登录成功，正在跳转。。。', {
                        time : 1000
                    });
                }else{
                    layer.msg(result.msg, {
                        time : 3000
                    });
                }

            }
        });
    }


    //忘记密码窗口
    function showFetch() {
        var times = new Date().getTime();
        layer
            .open({
                type : 1,//Page层类型
                area : [ '500px', '300px' ],
                skin : "",
                // btn: ['按钮1', '按钮2'],
                title : [ '找回密码',
                    'border:none; background:#CAE1FF; color:#000;text-align:left;' ],
                shade : 0.6, //遮罩透明度
                maxmin : false, //允许全屏最小化
                anim : 0, //0-6的动画形式，-1不开启
                content : '<div align="center"  style="margin-top:40px;"><table>'
                    + '<tr style="line-height: 35px;"><td>账&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;号：</td><td><input style="height: 23px;width: 160px" type="text" id="f_number" value=""  tabIndex="1" placeholder="请输入账号"></td></tr>'
                    + '<tr style="line-height: 35px;"><td >手机号码：</td><td><input style="height: 23px;width: 160px" type="text" id="f_phone" value=""  tabIndex="2" placeholder="请输入手机号码"></td></tr>'
                    + '<tr style="line-height: 35px;"><td >验&nbsp;&nbsp;证&nbsp;&nbsp;码：</td><td><input style="height: 23px;width: 90px" id="f_verify"  tabIndex="3"  value=""  type="text" maxlength=4 placeholder="请输入验证码">'
                    +'<img id="fvCode" alt="" title="点击更换" src = "<%request.getContextPath();%>/setVerify?name=registerCode&time="'+times+'  onClick="changeVerifyCode(this)" style="width: 70px;height: 27px;">'
                    // + '<img src="yzm?d='
                    // + currentTime
                    // + '" class="j_captcha verifytxt" onClick="changeVerifyCode()"/>
                    +'</td>'
                    +'</tr>'
                    + '</table></div>'
                    // +'<div  style="margin-top:30px;width:100px height="35px"><a align="center" class="button button-blue"  onclick="findPw()"  style="width: 100px;height: 37px;">找&nbsp;&nbsp;&nbsp;回</a></div>',
                    +'<div align="center" style="margin-top:30px;width:100px height="35px"><input   type="button" onclick="findPw()" value="找&nbsp;&nbsp;&nbsp;回"  style="width: 100px;height: 37px;background-color:#6abeed;color:white"></div>',//background-color:#6abeed
                end:function () {
                    //即时更新验证码
                    var id= document.getElementById("vCode");
                     changeVerifyCode(id);
                }
            });
    }

    function changeVoce() {
        var $v = $("#vCode");
        $v.attr("src","");
        $v.attr("src","<c:url value='/setVerify?name=registerCode'/>" + new Date().getTime());
    }


    function changeVerifyCode(obj) {
        obj.src="";
        obj.src = "<c:url value='/setVerify?name=registerCode'/>" + new Date().getTime();

    }

    //找回密码
    function findPw() {
        var number = $("#f_number").val();
        var verify = $("#f_verify").val();
        var phone = $("#f_phone").val();

        if (number == "") {
            layer.msg('请输入账号！', {
                time : 1000
            });
            $('#f_number').focus();
            return false;
        }

        if (phone == "") {
            layer.msg('请输入您的手机号码!', {
                time : 1000
            });
            $('#f_phone').focus();
            return false;
        }

        if (verify == "") {
            layer.msg('请输入验证码！', {
                time : 1000
            });
            $('#f_verify').focus();
            return false;
        }

        var l_index = layer.load(1, {
            shade : [ 0.1, '#fff' ]
            //0.1透明度的白色背景
        });

        $.ajax({
            url:"/forgetPassword",
            type:"POST",
            data : {
                id : number,
                phone : phone,
                verify : verify
            },
            dataType : "json",
            complete : function() {
                layer.close(l_index);
                // var id= document.getElementById("vCode");
                // changeVerifyCode(id);
            },
            success:function (result) {
                if(result.flag=="200"){//成功
                    layer.alert(result.msg + "，<br>登陆后请尽快修改",
                        7, function() {
                            layer.closeAll();
                        }
                    );
                }else{//失败！
                    //即时更新验证码
                    var id= document.getElementById("fvCode");
                    changeVerifyCode(id);
                    layer.alert(result.msg);
                }
            },
            error:function () {
                layer.alert("连接超时，请稍后重试！");
            }
        });

    }
</script>
</body>
</html>
