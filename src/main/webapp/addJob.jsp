<%--
  Created by IntelliJ IDEA.
  User: zhangwenyu
  Date: 2019/11/24
  Time: 17:48
  To change this template use File | Settings | File Templates.
--%>
<%
    request.setCharacterEncoding("utf-8");
    String htmlData = request.getParameter("jobDescribe") != null ? request.getParameter("jobDescribe") : "";
%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>添加职位</title>
    <link rel="icon" href="<%request.getContextPath();%>/static/favicon.ico" type="image/x-icon">
    <link rel="stylesheet" type="text/css" href="easyui/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="easyui/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="easyui/demo/demo.css">
    <script type="text/javascript" src="login_style/js/jquery-1.8.2.min.js"></script>
    <script type="text/javascript" src="easyui/jquery.min.js"></script>
    <script type="text/javascript" src="easyui/jquery.easyui.min.js"></script>
    <link rel="stylesheet" href="login_style/css/supersized.css">
    <link rel="stylesheet" href="login_style/css/login.css">
    <script type="text/javascript" src="easyui/locale/easyui-lang-zh_CN.js"></script>
    <link rel="stylesheet" href="static/kindeditor/themes/default/default.css" />
    <link rel="stylesheet" href="static/kindeditor/plugins/code/prettify.css" />
    <script charset="utf-8" src="static/kindeditor/kindeditor.js"></script>
    <script charset="utf-8" src="static/kindeditor/lang/zh-CN.js"></script>
    <script charset="utf-8" src="static/kindeditor/plugins/code/prettify.js"></script>
    <script type="text/javascript" src="easyui/locale/easyui-lang-zh_CN.js"></script>
    <script charset="utf-8" src="<%request.getContextPath();%>/static/laydate/laydate.js"></script>
</head>
<body style="margin-left:10px; border: none;background: white">
<div style="margin:20px 0; border: none"></div>
<div class="easyui-panel" id="addUserForm" title="添加职位" style="padding:30px 60px;">
    <div style="padding-left: 20px">
        <h2 align="center">添加在线招聘</h2>
        <form id="addJob" >
            <div hidden>
                <input type="text" id="sendName" class="form-control" name="sendName" value="${user.userDept}"/>
                <input type="text" id="sendId" class="form-control" name="sendId" value="${user.id}"/>
            </div>
            <table>
                <tr style="height:40px;">
                    <td>公司名称：</td>
                    <td >
                        <input type="text" style="height: 30px;" name="companyName" id="companyName" placeholder="请输入公司全称"/>
                    </td>
                    <%--<div class="col-sm-4">--%>
                        <%--<h5 id="h5Company"  class="help-block" style="color: red"></h5>--%>
                    <%--</div>--%>
                </tr>
                <tr style="height:40px;">
                    <td>公司简介：</td>
                    <td>
                        <textarea cols="100" rows="12"  name="introduction" id="introduction" oninput="check()" placeholder="字数不能超过400字..."></textarea>
                        <%--<h5  class="help-block" id="h5Introduction"></h5>--%>
                    </td>
                </tr>
                <tr style="height:40px;">
                    <td>职位名称：</td>
                    <td>
                        <input type="text" style="height: 30px;"  class="form-control" name="jobName" id="jobName" />
                    </td>
                    <%--<div class="col-sm-4">--%>
                        <%--<h5 id="h5Name"  class="help-block" style="color: red"></h5>--%>
                    <%--</div>--%>
                </tr>
                <tr style="height:40px;">
                    <td>职位类别：</td>
                    <td>
                        <select style="height: 30px;" name="category" id="category">
                            <option selected value="">请选择。。。</option>
                            <option value="正式">正式岗位</option>
                            <option value="实习">实习岗位</option>
                        </select>
                    </td>
                    <%--<div class="col-sm-4">--%>
                        <%--<h5 id="h5Cate"  class="help-block" style="color: red"></h5>--%>
                    <%--</div>--%>
                </tr>
                <tr style="height:40px;">
                    <td>工作地点：</td>
                    <td>
                        <input type="text" style="height: 30px;" name="address" id="address" placeholder="例：江门市"/>
                    </td>
                    <%--<td>--%>
                        <%--<h5 id="h5Add"  class="help-block" style="color: red"></h5>--%>
                    <%--</td>--%>
                </tr>
                <tr style="height:40px;">
                    <td>工作薪酬：</td>
                    <td>
                        <input type="text" style="height: 30px;" name="money" id="money" placeholder="例：5000元/月"/>
                    </td>
                </tr>

                <tr style="height:40px;">
                    <td>职位福利：</td>
                    <td>
                        <input type="text" style="height: 30px;" class="form-control" name="jobWelfare" id="jobWelfare" placeholder="例：包五险一金"/>
                    </td>
                    <%--<div class="col-sm-4">--%>
                        <%--<h5 id="h5Wel"  class="help-block" style="color: red"></h5>--%>
                    <%--</div>--%>
                </tr>

                <tr style="height:40px;">
                    <td >学历要求：</td>
                    <td>
                        <select  style="height: 30px;" name="educational" id="educational">
                            <option selected value="">请选择。。。</option>
                            <option value="大专及以下">大专及以下</option>
                            <option value="大专及以上">大专及以上</option>
                            <option value="本科及以上">本科及以上</option>
                            <option value="硕士及以上">硕士及以上</option>
                            <option value="博士及以上">博士及以上</option>
                        </select>
                    </td>
                    <%--<div class="col-sm-4">--%>
                        <%--<h5 id="h5Edu"  class="help-block" style="color: red"></h5>--%>
                    <%--</div>--%>
                </tr>

                <tr style="height:40px;">
                    <td >截止日期：</td>
                    <td id="searchDate">
                        <input type="text" autocomplete="off" style="height: 30px;" name="endTime" id="endTime"/>

                    </td>
                    <%--<div class="col-sm-4">--%>
                        <%--<h5 id="h5Time"  class="help-block" style="color: red"></h5>--%>
                    <%--</div>--%>
                </tr>

                <tr>
                    <td>职位描述：</td>
                   <td></td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <textarea  id="jobDescribe" name="jobDescribe" cols="50" rows="8" style="width:675px;height: 400px; visibility: hidden;" ><%=htmlspecialchars(htmlData)%></textarea>
                        <h5  class="help-block" style="color: red"></h5>
                    </td>
                </tr>
                <tr style="height:40px;">
                    <td>发布状态：</td>
                    <td>
                        <select style="height: 30px;" id="status" name="status">
                            <option value="1" selected>显示</option>
                            <option value="2">不显示</option>
                        </select>
                    </td>
                </tr>
            </table>
        </form>
        <div style="margin-bottom:20px;margin-left: 30px" ></div>
        <div style="text-align:center;padding:5px 0">
            <button type="button" class="easyui-linkbutton"  data-options="iconCls:'icon-add'" onclick="addJob()"  style="width:80px">保存</button>
            <button  type="button" class="easyui-linkbutton" data-options="iconCls:'icon-clear'" onclick="clearForm()" style="width:80px">重置</button>
        </div>
    </div>
</div>
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
    function addJob() {

        var companyName = $("#companyName").val();
        if(companyName==""){
            $.messager.alert("系统提示", "<font color=red>请输入公司名称！！！！</font>");
            // $("#h5Company").text("请输入公司名称！");
            // $("#companyName").focus();
            return false;
        }

        var introduction = $("#introduction").val();
        if(introduction==""){
            $.messager.alert("系统提示", "<font color=red>请输入公司简介！！！！</font>");
            // $("#introduction").next("h5").text("请输入公司简介！");
            // $("#h5Introduction").append("<font color='red'>请输入公司简介</font>");
            // $("#introduction").focus();
            return false;
        }else if(introduction.length>400){
            $.messager.alert("系统提示", "<font color=red>字数已超过限制！！！！</font>");
            // $("#introduction").next("h5").text("字数已超过限制！");
            // $("#h5Introduction").append("<font color='red'>字数已超过限制</font>");
            // $("#introduction").focus();
            return false;
        }


        var jobName = $("#jobName").val();
        if(jobName==""){
            $.messager.alert("系统提示", "<font color=red>请输入职位名称！！！！</font>");
            // $("#h5Name").text("请输入职位名称！");
            // $("#jobName").focus();
            return false;
        }

        var category = $("#category").val();
        if(category==""){
            $.messager.alert("系统提示", "<font color=red>请选择职位类别！！！！</font>");
            // $("#h5Cate").text("请选择职位类别！");
            // $("#category").focus();
            return false;
        }

        var address =$("#address").val();
        if(address==""){
            $.messager.alert("系统提示", "<font color=red>请输入工作地点！！！！</font>");
            // $("#h5Add").text("请输入工作地点！");
            // $("#address").focus();
            return false;
        }

        var money =$("#money").val();
        if(money==""){
            $.messager.alert("系统提示", "<font color=red>请输入工作薪酬！！！！</font>");
            // $("#h5Money").text("请输入工作薪酬！");
            // $("#money").focus();
            return false;
        }
        var jobWelfare = $("#jobWelfare").val();
        if(jobWelfare ==""){
            $.messager.alert("系统提示", "<font color=red>请输入职位福利！！！！</font>");
            // $("#h5Wel").text("请输入工作福利！");
            // $("#jobWelfare").focus();
            return false;
        }
        var educational = $("#educational").val();
        if(educational==""){
            $.messager.alert("系统提示", "<font color=red>请选择学历要求！！！！</font>");
            // $("#h5Edu").text("请选择学历要求！");
            // $("#educational").focus();
            return false;
        }

        var endTime = $("#endTime").val();
        if(endTime==""){
            $.messager.alert("系统提示", "<font color=red>请选择截止日期！！！！</font>");
            // $("#h5Time").text("请输入截止日期！");
            // $("#endTime").focus();
            return false;
        }

        editor1.sync();
        var describe = $("#jobDescribe").val();
        if(describe==""){
            $.messager.alert("系统提示", "<font color=red>请输入职业描述！！！！</font>");
            // $("#jobDescribe").next("h5").text("请输入职业描述！");
            // $("#jobDescribe").focus();
            return false;
        }


        $.messager.confirm("系统提示", "您是否添加该在线招聘？", function (r) {
            if (r) {
                $.ajax({
                    url: "job/insertOrUpdate",
                    data: $("#addJob").serialize(),
                    type: "POST",
                    success: function (result) {
                        console.log(result);
                        if (result.flag == "200") {
                            $.messager.alert("系统提示", "<font color=green>职位： <span>" + name + "</span>  添加成功</font>");
                            clearForm();
                        } else {
                            $.messager.alert("系统提示", "<font color=red>职位添加失败，请重试！</font>");
                        }
                    }
                });
            }
        });
    }

    function clearForm(){
        $('#addJob input').val("");
        $('#addJob textarea').val("");
        KindEditor.instances[0].html("");
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