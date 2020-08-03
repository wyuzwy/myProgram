<%--
  Created by IntelliJ IDEA.
  User: zhangwenyu
  Date: 2019/11/24
  Time: 17:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false"%>
<html>
<head>
    <title>查询岗位</title>
    <link rel="icon" href="<%request.getContextPath();%>/static/favicon.ico" type="image/x-icon">
    <script type="text/javascript" src="login_style/js/jquery-1.8.2.min.js"></script>
    <link rel="stylesheet" type="text/css" href="easyui/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="easyui/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="easyui/demo/demo.css">
    <script type="text/javascript" src="easyui/jquery.min.js"></script>
    <script type="text/javascript" src="easyui/jquery.easyui.min.js"></script>
    <link rel="stylesheet" href="login_style/css/supersized.css">
    <link rel="stylesheet" href="login_style/css/login.css">
    <script type="text/javascript" src="easyui/locale/easyui-lang-zh_CN.js"></script>
    <style type="text/css">
        #UJ span.textbox {
            border: 0;
        }
    </style>
</head>
<body>
<table id="dg4" title="岗位信息" class="easyui-datagrid" fitColumns="true"
       pagination="true" rownumbers="true" url="job/searchByConditionAfter" fit="true" toolbar="#tb">
    <thead>
    <tr>
        <th data-options="field:'companyName',width:70">招聘单位</th>
        <th data-options="field:'sendName',width:50">发布单位名称</th>
        <th data-options="field:'jobName',width:50">岗位名称</th>
        <th data-options="field:'category',width:30,formatter:formateCategory">岗位类型</th>
        <th data-options="field:'createTime',width:60">创建时间</th>
        <th data-options="field:'educational',width:50">学历要求</th>
        <th data-options="field:'status',width:30,formatter:showStatus">状态</th>
        <th data-options="field:'remark',width:30,formatter:createBtn">操作</th>
    </tr>
    </thead>
</table>
<div id="tb" >
    <table style="margin-top: 10px" align="center">
        <tr>
            <td>&nbsp;招聘单位:&nbsp;</td>
            <td><input class="easyui-textbox" id="companyName1" name="companyName" size="10"/></td>
            <td>&nbsp;发布单位名称:&nbsp;</td>
            <td><input class="easyui-textbox" id="sendName1" name="sendName" size="10"/></td>
            <td>&nbsp;岗位名称:&nbsp;</td>
            <td><input class="easyui-textbox" id="jobName1" name="jobName1" size="10"/></td>
            <td>&nbsp;岗位类型:&nbsp;</td>
            <td><select class="easyui-combobox"   id="category1" name="category1" editable="false" panelHeight="auto" style="width:100px"  size="60">
                <option value="" selected>全部</option>
                <option value="实习">实习</option>
                <option value="正式">正式</option>
            </select></td>
            <td>&nbsp;状态:&nbsp;</td>
            <td><select class="easyui-combobox"   id="status1" name="status" editable="false" panelHeight="auto" style="width:100px"  size="60">
                <option value="-1" selected>全部</option>
                <option value="0">待审核</option>
                <option value="1">通过</option>
                <option value="2">不通过</option>
            </select></td>
            <td><button class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="searchJob()"   style="width:80px;margin-left: 5px">查询</button></td>
        </tr>
    </table>
</div>

<div id="dlg" class="easyui-dialog" style="width: 1000px;height: 600px;padding: 10px 20px" data-options="modal:true"
     closed="true">
    <h1 style="margin-top: 10px;" align="center" id="title"></h1>
    <div style="margin-top: 10px;padding-left: 20px">
    <form id="signJob">
        <table>
            <tr hidden>
                <td>I&nbsp;&nbsp;&nbsp;D：</td>
                <td><input class="easyui-textbox" id="jobId"  name="jobId" style="width:150px;height:30px;" data-options="readonly:true"></td>
            </tr>
            <tr>
                <td  style="width: 100px">公司名称：</td>
                <td><div id="companyName"></div></td>
            </tr>
            <tr>
                <td>发布者账号：</td>
                <td><div id="sendId"></div></td>
            </tr>
            <tr>
                <td>发布单位：</td>
                <td><div id="sendName"></div></td>
            </tr>
            <tr>
                <td>工作类型：</td>
                <td><div id="category"></div></td>
            </tr>
            <tr>
                <td>工作地点：</td>
                <td><div id="address"></div></td>
            </tr>
            <tr>
                <td>工作薪酬：</td>
                <td><div id="money"></div></td>
            </tr>
            <tr>
                <td>工作福利：</td>
                <td><div id="jobWelfare"></div></td>
            </tr>
            <tr>
                <td>学历要求：</td>
                <td><div id="education"></div></td>
            </tr>
            <tr>
                <td>截止日期：</td>
                <td><div id="endTime"></div></td>
            </tr>
            <tr>
                <td>招聘简章：</td>
                <td><div id="jobDescribe"></div></td>
            </tr>
            <tr>
                <td>当前状态：</td>
                <td><div id="currentStatus"></div></td>
            </tr>
            <tr>
                <td>审核意见：</td>
                <td><label class="radio-inline">
                    <input type="radio"  value="1" name="status" onchange="checkStatus()">通过
                </label>
                    <label class="radio-inline">
                        <input type="radio"  value="2" name="status" onchange="checkStatus()">不通过
                    </label>
                </td>
            </tr>
            <tr id="showRemark" hidden>
                <td>拒绝原因：</td>
                <td><textarea id="remark" name="remark" cols="30" rows="4" ></textarea></td>
            </tr>
        </table>
    </form>
        <div style="margin-bottom:20px;margin-left: 30px" ></div>
        <div style="text-align:center;padding:5px 0">
            <button type="button" class="easyui-linkbutton"  data-options="iconCls:'icon-add'" onclick="updateJob()"  style="width:80px">保存</button>
            <button  type="button" class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" onclick="closeDialog()" style="width:80px">关闭</button>
        </div>
    </div>
</div>



<script>

    function searchJob() {
        var companyName=$("#companyName1").val();
        var sendName=$("#sendName1").val();
        var jobName=$("#jobName1").val();
        var category=$("#category1").val();
        var status=$("#status1").val();
        if(companyName==""){
            companyName=null;
        }
        if(sendName==""){
            sendName=null;
        }
        if(jobName==""){
            jobName=null;
        }
        if(category==""){
            category=null;
        }
        $("#dg4").datagrid('load', {
            companyName:companyName,
            sendName:sendName,
            jobName:jobName,
            category:category,
            status:status
        });
    }

    function showJob(jobId) {
        $.ajax({
            url:"job/searchById",
            data:"jobId="+jobId+"&take=123",
            type:"GET",
            success:function (result) {
                console.log(result);
                if(result.flag=="200"){
                    openDialog(result.job);
                }else{
                    $.messager.alert("系统提示", "<font color=red>宣讲会不存在，请刷新！</font>");
                }
            }
        });
    }

    function formateCategory(val,row) {
        var text;
        if(val=="实习"){
            text = "<font color='purple'>"+val+"</font>";
        }else{
            text = "<font color='red'>"+val+"</font>";
        }
        return text;
    }

    function createBtn(val,row) {
        var id = row.jobId;
        var btn="<button class=\"easyui-linkbutton\"  data-options=\"iconCls:'icon-upload'\" onclick='showJob(\"" +id + "\")' style=\"width:60px;margin-left: 10px\">编辑</button>";
        return btn;
    }

    function showStatus(val,row) {
        var text;
        if(val=="0"){
            text="<font color='red'>待审核</font>";
        }else if(val=="1") {
            text="<font color='blue'>通过</font>";
        }else{
            text="<font color='#808080'>不通过</font>";
        }
        return text;
    }

    function checkStatus() {
        var status = $('#signJob input:radio:checked').val();
        if(status=="2"){
            $("#showRemark").show();
        }else{
            $("#showRemark").hide();
        }

    }

    function openDialog(job) {

        $("#dlg").dialog("open").dialog("setTitle", "审核岗位信息");
        $("#dlg").panel({
            closable:false
        });

        $("#title").append(job.jobName);
        $("#jobId").textbox("setValue",job.jobId);
        // $("#preachId").val(preach.preachId);
        $("#companyName").append(job.companyName);
        $("#sendId").append(job.sendId);
        $("#sendName").append(job.sendName);
        $("#category").append(job.category);
        $("#address").append(job.address);
        $("#money").append(job.money);
        $("#jobWelfare").append(job.jobWelfare);
        $("#education").append(job.educational);
        $("#endTime").append(job.endTime);
        $("#jobDescribe").append(job.jobDescribe);
        var status = job.status;
        if(status=="0"){
            $("#showRemark").hide();
            $("#currentStatus").append("<font color='red'>待审核</font>");
        }else if(status=="1"){
            $("#showRemark").hide();
            $("#currentStatus").append("<font color='blue'>通过</font>");
        }else {
            $("#currentStatus").append("<font color='#808080'>不通过</font>");
            $("#remark").val(job.remark);
            $("#showRemark").show();
        }

    }



    function updateJob() {
        var status = $('#signJob input:radio:checked').val();
        if(status==null||status==""||status==undefined){
            $.messager.alert("系统提示", "<font color=red>请选择审核意见！！！！！</font>");
            return false;
        }
        if(status=="1"){

            $("#remark").val("");
        }else{
            var remark=$("#remark").val();
            if(remark==""||remark==undefined){
                $.messager.alert("系统提示", "<font color=red>请填写拒绝原因！！！！！</font>");
                return false;
            }
        }

        $.ajax({
            url:"job/insertOrUpdate",
            data:$("#signJob").serialize(),
            type:"POST",
            success:function (result) {
                if(result.flag=="200"){
                    $.messager.alert("系统提示", "<font color=green>审核成功</font>");
                    closeDialog();
                    $('#dg4').datagrid('reload');
                }else{
                    $.messager.alert("系统提示", "<font color=red>审核失败，请重试！</font>");
                }
            }
        });
    }

    function closeDialog() {
        $("#title").empty();
        $("#signJob div").empty();
        $("#signJob").form('clear');
        $("#dlg").dialog("close");
    }


</script>




</body>
</html>
