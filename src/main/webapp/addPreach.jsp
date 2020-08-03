<%--
  Created by IntelliJ IDEA.
  User: zhangwenyu
  Date: 2019/11/24
  Time: 17:45
  To change this template use File | Settings | File Templates.
--%>
<%
    request.setCharacterEncoding("utf-8");
    String htmlData = request.getParameter("content") != null ? request.getParameter("content") : "";
%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>添加宣讲会</title>
    <link rel="icon" href="<%request.getContextPath();%>/static/favicon.ico" type="image/x-icon">
    <link rel="stylesheet" type="text/css" href="easyui/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="easyui/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="easyui/demo/demo.css">
    <script type="text/javascript" src="login_style/js/jquery-1.8.2.min.js"></script>
    <script type="text/javascript" src="easyui/jquery.min.js"></script>
    <script type="text/javascript" src="easyui/jquery.easyui.min.js"></script>
    <link rel="stylesheet" href="login_style/css/supersized.css">
    <link rel="stylesheet" href="login_style/css/login.css">
    <link rel="stylesheet" href="static/kindeditor/themes/default/default.css" />
    <link rel="stylesheet" href="static/kindeditor/plugins/code/prettify.css" />
    <script charset="utf-8" src="static/kindeditor/kindeditor.js"></script>
    <script charset="utf-8" src="static/kindeditor/lang/zh-CN.js"></script>
    <script charset="utf-8" src="static/kindeditor/plugins/code/prettify.js"></script>
    <script type="text/javascript" src="easyui/locale/easyui-lang-zh_CN.js"></script>
    <script charset="utf-8" src="<%request.getContextPath();%>/static/laydate/laydate.js"></script>
    </head>
<body style="margin-left:10px; border: none;background: white">
<%--<div style="margin:20px 0; border: none"></div>--%>
<div class="easyui-panel" id="addUserForm" title="添加宣讲会" style="padding:30px 60px;">
    <div style="padding-left: 20px">
        <h2 align="center">添加宣讲会</h2>
        <form id="addPreach" >
            <div hidden>
                <input type="text" id="snedName" name="snedName" value="${user.userDept}"/>
                <input type="text" id="sendId" name="sendId" value="${user.id}"/>
            </div>
            <table>
                <tr style="height:40px;">
                    <td>公司名称：</td>
                    <td>
                        <input type="text" style="height: 30px;"  autocomplete="off" name="companyName" id="companyName" placeholder="请输入公司全称"/>
                    </td>

                </tr>
                <tr>
                    <td></td>
                    <td></td>
                </tr>
                <tr style="height:40px;">
                    <td>宣讲地点：</td>
                    <td>
                        <input type="text" style="height: 30px;" autocomplete="off" name="address" id="address" placeholder="例：黄浩川202"/>
                    </td>
                    <%--<div class="col-sm-2">--%>
                        <%--<h5 id="addressH5"  class="help-block" style="color: red ;margin-left: 5px"></h5>--%>
                    <%--</div>--%>
                </tr>
                <tr style="height:40px;">
                    <td>公司简介：</td>
                    <td>
                        <textarea cols="100" rows="12"  name="introduction" id="introduction" oninput="check()" placeholder="字数不能超过400字..."></textarea>
                    </td>
                </tr>
                <tr style="height:40px;">
                    <td>开始时间：</td>
                    <td>
                    <div>
                        <%--<input type="text" class="timeInput form-control" name="endTime" id="endTime"/>--%>
                        <input type="text" style="height: 30px;" autocomplete="off"  name="startTime" id="startTime" style="width: 139px"/>
                    </div>
                    </td>
                </tr>
                <tr style="height:40px;">
                    <%--<div class="col-sm-2">--%>
                        <%--<h5 id="startH5"  class="help-block" style="color: red;margin-left: 5px"></h5>--%>
                    <%--</div>--%>
                     <td>结束时间：</td>
                    <td>
                        <div>
                            <%--<input type="text" class="timeInput form-control" name="endTime" id="endTime"/>--%>
                            <input type="text" style="height: 30px;"  autocomplete="off" name="endTime" id="endTime" style="width: 139px"/>
                        </div>
                    </td>
                    <%--<div class="col-sm-2">--%>
                        <%--<h5 id="endH5"  class="help-block" style="color: red ;margin-left: 5px"></h5>--%>
                    <%--</div>--%>
                </tr>

                <tr style="height:40px;">
                    <td>招聘简章：</td>
                    <td></td>

                </tr>
                <tr>
                    <td></td>
                    <td><div class="col-sm-4">
                        <textarea  id="content" name="content" cols="50" rows="8" style="width:675px;height: 400px; visibility: hidden;" ><%=htmlspecialchars(htmlData)%></textarea>
                        <%--<h5  class="help-block" style="color: red"></h5>--%>
                    </div></td>
                </tr>
                <tr style="height:40px;">
                    <td>发布状态：</td>
                    <td>
                        <select id="status" style="height: 30px;" class="form-control " name="status">
                            <option value="1" selected>显示</option>
                            <option value="2">不显示</option>
                        </select>
                    </td>
                </tr>
            </table>
            <%--<div class="form-group">--%>
                <%--<div class=" col-sm-10" align="center">--%>
                    <%--<button type="button" class="btn btn-primary" id="companyPreach_ask">申请</button>--%>
                    <%--<button type="button" class="btn btn-default" id="cancel_btn">重置</button>--%>
                <%--</div>--%>
            <%--</div>--%>
        </form>
        <div style="margin-bottom:20px;margin-left: 30px" ></div>
        <div style="text-align:center;padding:5px 0">
            <button type="button" class="easyui-linkbutton"  data-options="iconCls:'icon-add'" onclick="addPreach()"  style="width:80px">添加</button>
            <button  type="button" class="easyui-linkbutton" data-options="iconCls:'icon-clear'" onclick="clearForm()" style="width:80px">重置</button>
        </div>
    </div>
</div>
<script type="text/javascript">


    laydate.render({
        elem:'#startTime',
        type:'datetime',
        format:'yyyy-MM-dd HH:mm',
        theme:'molv'
    });

    laydate.render({
        elem:'#endTime',
        type:'time',
        format:'HH:mm',
        theme:'molv'

    });


    var editor1;
    KindEditor.ready(function(K) {
        editor1 = K.create('textarea[name="content"]', {
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

    function addPreach() {
        var companyName = $("#companyName").val();
        if(companyName==""){
            $.messager.alert("系统提示", "<font color=red>请输入公司名称！</font>");
            // $("#companyName").focus();
            return false;
        }

        var address = $("#address").val();
        if(address==""){
            $.messager.alert("系统提示", "<font color=red>请输入宣讲地点！</font>");
            // $("#addressH5").text("请输入宣讲地点！");
            //$("#address").focus();
            return false;
        }

        var introduction = $("#introduction").val();
        if(introduction==""){
            // $("#introduction").next("h5").text("请输入公司简介！");
            $.messager.alert("系统提示", "<font color=red>请输入公司简介！</font>");
            // $("#h5Introduction").append("<font color='red'>请输入公司简介</font>");
           // $("#introduction").focus();
            return false;
        }else if(introduction.length>400){
            // $("#introduction").next("h5").text("字数已超过限制！");
            $.messager.alert("系统提示", "<font color=red>字数已超过限制！</font>");
            // $("#h5Introduction").append("<font color='red'>字数已超过限制</font>");
            //$("#introduction").focus();
            return false;
        }

        var startTime = $("#startTime").val();
        if(startTime==""){
            $.messager.alert("系统提示", "<font color=red>请选择开始时间！</font>");
            // $("#startH5").text("请选择开始时间");
            //$("#startTime").focus();
            return false;
        }
        var endTime =$("#endTime").val();
        if(endTime==""){
            $.messager.alert("系统提示", "<font color=red>请选择开始时间！</font>");
            // $("#endH5").text("请选择开始时间");
            //$("#endTime").focus();
            return false;
        }

        editor1.sync();
        var content = $("#content").val();
        if(content==""){
            $.messager.alert("系统提示", "<font color=red>请输入招聘简章！！！！</font>");
            // $("#content").next('h5').text("请输入招聘简章！！！");
            //$("#content").focus();
            return false;
        }
        $.messager.confirm("系统提示", "您是否添加该宣讲会？", function (r) {
            if(r) {
                $.ajax({
                    url:"preach/insertOrUpdate",
                    data:$("#addPreach").serialize(),
                    type:"POST",
                    success:function (result) {
                        console.log(result);
                        if(result.flag=="200"){
                            $.messager.alert("系统提示", "<font color=green>添加成功</font>");
                            clearForm();
                        }else{
                            $.messager.alert("系统提示", "<font color=red>添加失败，请重试！</font>");
                        }
                    }
                });
                    }
        });
    }

    function clearForm(){
        $('#addPreach input').val("");
        $('#addPreach textarea').val("");
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