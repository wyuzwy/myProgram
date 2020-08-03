<%--
  Created by IntelliJ IDEA.
  User: zhangwenyu
  Date: 2019/8/9
  Time: 14:40
  To change this template use File | Settings | File Templates.
--%>

<%
    request.setCharacterEncoding("utf-8");
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<%
    request.setCharacterEncoding("utf-8");
    String htmlData = request.getParameter("introduction") != null ? request.getParameter("introduction") : "";
%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<head>
    <title>企业注册界面</title>
    <base href="<%=basePath%>">
    <link rel="icon" href="<%request.getContextPath();%>/static/favicon.ico" type="image/x-icon">
    <script type="text/javascript" src="<%request.getContextPath();%>/static/js/jquery-3.2.1.min.js"></script>
    <link href="<%request.getContextPath();%>/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="<%request.getContextPath();%>/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
    <script src="<%request.getContextPath();%>/static/bootstrap-3.3.7-dist/js/made_confirm.js"></script>
    <link rel="stylesheet" href="<%request.getContextPath();%>/static/kindeditor/themes/default/default.css" />
    <link rel="stylesheet" href="<%request.getContextPath();%>/static/kindeditor/plugins/code/prettify.css" />
    <script charset="utf-8" src="<%request.getContextPath();%>/static/kindeditor/kindeditor.js"></script>
    <script charset="utf-8" src="<%request.getContextPath();%>/static/kindeditor/lang/zh-CN.js"></script>
    <script charset="utf-8" src="<%request.getContextPath();%>/static/kindeditor/plugins/code/prettify.js"></script>
    <script type="text/javascript" src="<%request.getContextPath();%>/static/layer_v3.1.1/3.1.1/layer.js"></script>
    <%--<script charset="UTF-8" src="<%request.getContextPath();%>/static/bootstrap-3.3.7-dist/bootstrap-fileinput-master/js/fileinput.js"></script>--%>
    <%--<script charset="UTF-8" src="<%request.getContextPath();%>/static/bootstrap-3.3.7-dist/bootstrap-fileinput-master/css/fileinput.css"></script>--%>
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
                            <li title="个人中心" class="active"><a href="<%request.getContextPath();%>/returnToMyInfo"><span
                                    class="glyphicon glyphicon-user"></span>${currentUser.id}</a>
                            </li>
                            <li title="退出"><a href="<%request.getContextPath();%>/exit"><span class="glyphicon glyphicon-log-in"></span>退出</a></li>
                        </ul>
                    </c:when>
                    <c:otherwise>
                        <ul class="nav navbar-nav navbar-right">
                            <li title="企业注册" class="active" ><a><span class="glyphicon glyphicon-user"></span> 企业注册</a>
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
                    <li title="公告栏"><a href="bulletin.jsp">公告栏</a></li>
                </ul>
            </div>
        </div>
    </nav>
</header>

<section class=" container">
    <div class="panel panel-default" style="margin: 50px">
        <div class="row clearfix">
            <div class="col-md-12" style="text-align: center"><h2>企业注册</h2></div>
            <div class="col-md-12 column" style="margin: 20px" id="text_span">


                <div class="col-md-3"></div>

                <form class="col-md-9 form-horizontal" id="register">
                    <div class="form-group">
                        <label for="companyEmail" class="col-sm-2 control-label">公司邮箱：</label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control"  name="companyEmail" id="companyEmail" onchange="checkEmail()"/>
                            <h5  class="help-block" style="color: red"></h5>
                        </div>

                    </div>
                    <div class="form-group">
                        <label for="companyName" class="col-sm-2 control-label">公司名称：</label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control" name="companyName" id="companyName" />
                            <h5  class="help-block" style="color: red"></h5>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="userName" class="col-sm-2 control-label">用户名称：</label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control" name="userName" id="userName" />
                            <h5  class="help-block" style="color: red"></h5>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="phone" class="col-sm-2 control-label">手机号码：</label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control" name="phone" id="phone" />
                            <h5  class="help-block" style="color: red"></h5>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="password" class="col-sm-2 control-label">密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码：</label>
                        <div class="col-sm-4">
                            <input type="password" class="form-control" name="password" id="password"/>
                            <h5  class="help-block" style="color: red"></h5>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="password_confirm" class="col-sm-2 control-label">确认密码：</label>
                        <div class="col-sm-4">
                            <input type="password" class="form-control"
                                   id="password_confirm"/>
                            <h5  class="help-block" style="color: red"></h5>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="provinces" class="col-sm-2 control-label">所在省份：</label>
                        <div class="col-sm-4">
                            <select class="form-control" name="provinces" id="provinces" onchange="provincechange(this.selectedIndex)" style="width: 150px">

                            </select>
                            <h5  class="help-block" style="color: red"></h5>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="city" class="col-sm-2 control-label">所在城市：</label>
                        <div class="col-sm-4">
                            <select class="form-control" name="city" id="city"  style="width: 150px">
                                <option>请选择城市</option>
                                <%--<option value="教师">教师</option>--%>
                            </select>
                            <h5  class="help-block" style="color: red"></h5>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="address" class="col-sm-2 control-label">详细地址：</label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control" name="address" id="address"/>
                            <h5  class="help-block" style="color: red"></h5>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="telephone" class="col-sm-2 control-label">固定电话：</label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control" name="telephone" id="telephone" />
                            <h5  class="help-block" style="color: red"></h5>
                        </div>
                    </div>


                    <div class="form-group">
                        <label for="jobEmail" class="col-sm-2 control-label">招聘邮箱：</label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control" name="jobEmail" id="jobEmail" />
                            <h5  class="help-block" style="color: red"></h5>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="companyProperty" class="col-sm-2 control-label">单位性质：</label>
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
                            <h5  class="help-block" style="color: red"></h5>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="companyCategory" class="col-sm-2 control-label">所属行业：</label>
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
                            <h5  class="help-block" style="color: red"></h5>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="scale" class="col-sm-2 control-label">单位规模：</label>
                        <div class="col-sm-4">
                            <select class="form-control" name="scale" id="scale" style="color: #8f8f8f">
                                <option selected value="">必填，请选择</option>
                                <option value="少于50人">少于50人</option>
                                <option value="50-150人">50-150人</option>
                                <option value="150-500人">150-500人</option>
                                <option value="500-1000人">500-1000人</option>
                                <option value="1000-5000人">1000-5000人</option>
                                <option value="5000-10000人">5000-10000人</option>
                                <option value="10000人以上">10000人以上</option>
                            </select>
                            <h5  class="help-block" style="color: red"></h5>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="registerMoney" class="col-sm-2 control-label">注册资金：</label>
                        <div class="col-sm-4">
                            <select class="form-control" name="registerMoney" id="registerMoney" style="color: #8f8f8f">
                                <option selected value="">必填，请选择</option>
                                <option value="10万以下">10万以下</option>
                                <option value="10-50万">10-50万</option>
                                <option value="50-100万">50-100万</option>
                                <option value="100-1000万">100-1000万</option>
                                <option value="1000万以上">1000万以上</option>
                                <option value="无">无</option>
                            </select>
                            <h5  class="help-block" style="color: red"></h5>
                        </div>
                    </div>

                    <div class="form-group">
                        <label  class="col-sm-2 control-label">公司简介：</label>
                        <div class="col-sm-offset-1 col-sm-11">
                            <textarea  id="introduction" name="introduction" cols="50" rows="8" style="width:675px;height: 400px; visibility: hidden;" ><%=htmlspecialchars(htmlData)%></textarea>
                            <h5  class="help-block" style="color: red"></h5>
                        </div>
                    </div>
                    <div class="form-group" id="logo_value">
                        <label  class="col-sm-2 control-label">企业logo：</label>
                        <div class="col-sm-4">
                            <input accept="image/*" type="file"  id="logo_file" onchange="upload_img('logo_file','logo_show','logo')"/>
                            <img src="" id="logo_show" class="img-rounded" style="margin-top: 7px;width: 50px;height: 50px" hidden>
                            <input type="text" id="logo" name="logo" hidden>
                            <h5  class="help-block" style="color: red"></h5>
                        </div>
                    </div>
                    <div class="form-group" id="license">
                        <label  class="col-sm-2 control-label">营业执照：</label>
                        <div class="col-sm-4">
                            <input accept="image/*" type="file"   id="license_file" onchange="upload_img('license_file','license_show','companyLicense')" />
                            <img src="" id="license_show" class="img-rounded" style="margin-top: 7px;width: 150px;height: 200px"  hidden>
                            <input type="text" id="companyLicense" name="companyLicense" hidden>
                            <h5  class="help-block" style="color: red"></h5>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-10">
                            <input type="button" class="btn btn-default" id="saveUser" value="注&nbsp;&nbsp;&nbsp;册" onclick="register()"/>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</section>

<script type="text/javascript">

    $(function () {
        init();
    });

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


    function checkEmail() {
        var c_email = $("#companyEmail").val();
        if(c_email==""){
            return false;
        }
        $.ajax({
            url:"/checkUser",
            data:"id="+c_email,
            type:"GET",
            success:function (result) {
                console.log(result);
                if(result.flag=="200"){
                    parent.layer.alert("账号："+c_email+"已存在！",{icon: 2});
                    $("#companyEmail").val("");
                    $("#companyEmail").focus();
                }
            }
        });
    }

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





    function register(){
        $("#text_span h5").text("");
        var c_email = $("#companyEmail").val();
        var resEmail= /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;
        if(c_email==""){
            $("#companyEmail").focus();
            // $.messager.alert("系统提示", "<font color=red>邮箱不能为空！</font>");
            // layer.alert('邮箱不能为空！', {
            //     icon:6
            // });
              $("#companyEmail").next("h5").text("邮箱不能为空！");
            return false;
        }else if(!resEmail.test(c_email)){
            // layer.msg('请输入有效的邮箱！', {
            //     time : 1000
            // });
            $("#companyEmail").next("h5").text("请输入有效的邮箱！");
            $("#companyEmail").focus();
            return false;
        }

        var c_name = $("#companyName").val();
        if(c_name==""){
            // layer.msg('请输入公司名称！', {
            //     time : 1000
            // });
            $("#companyName").next("h5").text("请输入公司名称！");
            $("#companyName").focus();
            return false;
        }

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

        var password = $("#password").val();
        var regPass =  /(^[a-zA-Z0-9_-]{6,12}$)/;
        if(password==""){
            // layer.msg('请输入密码！', {
            //     time : 1000
            // });
            $("#password").next("h5").text("请输入密码！");
            $("#password").focus();
            return false;
        }else if(!regPass.test(password)){
            // layer.msg('密码必须为6-12位英文或数字！', {
            //     time : 1000
            // });
            $("#password").next("h5").text("密码必须为6-12位英文或数字！");
            $("#password").focus();
            return false;
        }

        var password_confirm = $("#password_confirm").val();
        if(password_confirm==""){
            $("#password_confirm").next("h5").text("请输入确认密码！");
            $("#password_confirm").focus();
            return false;
        }else if(password_confirm != password){
            // layer.msg('两次密码不正确，请重新输入！！！！', {
            //     time : 1000
            // });
            $("#password_confirm").next("h5").text("两次密码不正确，请重新输入！");
            $("#password_confirm").focus();
            return false;
        }

        var provinces = $("#provinces").val();
        if(provinces==""){
            // layer.msg('请选择省份', {
            //     time : 1000
            // });
            $("#provinces").next("h5").text("请选择省份！");
            $("#provinces").focus();
            return false;
        }

        var city = $("#city").val();
        if(city==""){
            // layer.msg('请选择城市', {
            //     time : 1000
            // });
            $("#city").next("h5").text("请选择城市！");
            $("#city").focus();
            return false;
        }

        var address = $("#address").val();
        if(address==""){
            // layer.msg('请输入详细地址', {
            //     time : 1000
            // });
            $("#address").next("h5").text("请输入详细地址！");
            $("#address").focus();
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

        var c_property = $("#companyProperty").val();
        if(c_property==""){
            // layer.msg('请选择单位性质！', {
            //     time : 1000
            // });
            $("#companyProperty").next("h5").text("请选择单位性质！");
            $("#companyProperty").focus();
            return false;
        }

        var c_category = $("#companyCategory").val()
        if(c_category==""){
            // layer.msg('请选择所属行业！', {
            //     time : 1000
            // });
            $("#companyCategory").next("h5").text("请选择所属行业！");
            $("#companyCategory").focus();
            return false;
        }

        var scale = $("#scale").val();
        if(scale==""){
            // layer.msg('请选择单位规模！', {
            //     time : 1000
            // });
            $("#scale").next("h5").text("请选择单位规模！");
            $("#scale").focus();
            return false;
        }

        var r_money = $("#registerMoney").val();
        if(r_money==""){
            // layer.msg('请选择注册资金！', {
            //     time : 1000
            // });
            $("#registerMoney").next("h5").text("请选择注册资金！");
            $("#registerMoney").focus();
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

        $.ajax({
            url:"/company/insert",
            data:$("#register").serialize(),
            type:"POST",
            success:function (result) {
                console.log(result);
                if(result.flag=="200"){
                    //TODO 有bug
                    // window.location.href="http://localhost:8080/register.jsp";
                    // layer.alert("注册成功,请等待管理员审核");
                    // KindEditor.instances[0].html("");
                    // // $('#register').form('clear');
                    // $('#register input').val("");
                    // alert("注册成功,请等待管理员审核");
                    // window.location.href="http://localhost:8080/register.jsp";
                    // layer.msg('注册成功,请等待管理员审核', {
                    //     time : 2000
                    // });
                    // parent.layer.alert("注册成功,请等待管理员审核",{icon: 6},function() {
                   layer.alert("注册成功,请等待管理员审核",{icon: 6},function() {
                        window.location.reload();
                   });
                }else{
                    // layer.alert("注册失败，请重试！");
                    layer.alert(result.msg,{icon: 2});
                }
            }
        });

    }


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
        var province = document.getElementById('provinces');
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
        var city = document.getElementById('city');
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
<%!
    private String htmlspecialchars(String str) {
        str = str.replaceAll("&", "&amp;");
        str = str.replaceAll("<", "&lt;");
        str = str.replaceAll(">", "&gt;");
        str = str.replaceAll("\"", "&quot;");
        return str;
    }
%>