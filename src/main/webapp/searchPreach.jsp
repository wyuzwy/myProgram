<%--
  Created by IntelliJ IDEA.
  User: zhangwenyu
  Date: 2019/11/24
  Time: 17:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false"%>
<html>
<head>
    <title>宣讲查询</title>
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
        #UD span.textbox {
            border: 0;
        }
    </style>
</head>
<body>
<table id="dg4" title="宣讲信息" class="easyui-datagrid" fitColumns="true"
       pagination="true" rownumbers="true" url="preach/selectByConditionAfter" fit="true" toolbar="#tb">
    <thead>
    <tr>
        <%--<th field="cb" checkbox="true"></th>--%>
        <th data-options="field:'companyName',width:70">宣讲单位</th>
        <th data-options="field:'sendId',width:50">发布单位账号</th>
        <th data-options="field:'snedName',width:50">发布单位名称</th>
        <th data-options="field:'createTime',width:70">创建时间</th>
        <th data-options="field:'startTime',width:60">开始时间</th>
        <th data-options="field:'address',width:60">宣讲地点</th>
        <th data-options="field:'status',width:30,formatter:showStatus">状态</th>
        <th data-options="field:'remark',width:30,formatter:createBtn">操作</th>
    </tr>
    </thead>
</table>
<div id="tb" align="center" >
    <table style="margin-top: 10px">
        <tr>
            <td>&nbsp;宣讲单位:&nbsp;</td>
            <td><input class="easyui-textbox" id="companyName1" name="companyName" size="10"/></td>
            <td>&nbsp;发布单位名称:&nbsp;</td>
            <td><input class="easyui-textbox" id="sendName1" name="sendName" size="10"/></td>
            <td>&nbsp;状态:&nbsp;</td>
            <td><select class="easyui-combobox"   id="status1" name="status" editable="false" panelHeight="auto" style="width:100px"  size="60">
                <option value="-1" selected>全部</option>
                <option value="0">待审核</option>
                <option value="1">通过</option>
                <option value="2">不通过</option>
            </select></td>
            <td><button class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="searchPreach()"   style="width:80px;margin-left: 5px">查询</button></td>
            <%--<td><button class="easyui-linkbutton" data-options="iconCls:'icon-edit'" onclick="openDialog()"  style="width:80px;margin-left: 5px">编辑</button></td>--%>
            <%--<td><button class="easyui-linkbutton" data-options="iconCls:'icon-remove'" onclick="deleteDept()"  style="width:80px;margin-left: 5px">删除</button></td>--%>
        </tr>
    </table>
</div>

<div id="dlg" class="easyui-dialog" style="width: 1000px;height:600px;padding: 10px 20px" data-options="modal:true"
     closed="true">
    <h1 style="margin-top: 10px;" align="center" id="title"></h1>
    <div style="margin-top: 10px;padding-left: 20px">
        <form id="signPreach">
            <table>
                <tr hidden>
                    <td>I&nbsp;&nbsp;&nbsp;D：</td>
                    <td><input class="easyui-textbox" id="preachId"  name="preachId" style="width:150px;height:30px;" data-options="readonly:true"></td>
                </tr>
                <tr>
                    <td style="width: 100px">公司名称：</td>
                    <td><div id="companyName"></div></td>
                </tr>
                <tr>
                    <td>发布账号：</td>
                    <td><div id="sendId"></div></td>
                </tr>
                <tr>
                    <td>发布单位：</td>
                    <td><div id="sendName"></div></td>
                </tr>
                <tr>
                    <td>宣讲学校：</td>
                    <td><div id="school"></div></td>
                </tr>
                <tr>
                    <td>宣讲地点：</td>
                    <td><input class="easyui-textbox" id="address"  name="address" style="width:200px;height:30px;"></td>
                </tr>
                <tr>
                    <td>宣讲时间：</td>
                    <td><div id="startTime"></div></td>
                </tr>
                <tr>
                    <td>招聘简章：</td>
                    <td><div id="content"></div></td>
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
            <%--<div style="width: 370px;height: 70px;margin-top: 20px">--%>
                <%--<div style="width: 70px;float: left">审核意见：</div>--%>
                <%--<div style="width: 100px;float: left">--%>
                    <%--<label class="radio-inline">--%>
                        <%--<input type="radio"  value="1" name="status" onchange="checkStatus()">通过--%>
                    <%--</label>--%>
                    <%--<label class="radio-inline">--%>
                        <%--<input type="radio"  value="2" name="status" onchange="checkStatus()">不通过--%>
                    <%--</label>--%>
                <%--</div>--%>
                <%--<div id="showRemark" hidden style="width: 200px;float: right">--%>
                    <%--<textarea id="remark" name="remark" cols="30" rows="4" ></textarea>--%>
                <%--</div>--%>
            <%--</div>--%>
        </form>
        <div style="margin-bottom:20px;margin-left: 30px" ></div>
        <div style="text-align:center;padding:5px 0">
            <button type="button" class="easyui-linkbutton"  data-options="iconCls:'icon-add'" onclick="updateDept()"  style="width:80px">保存</button>
            <button  type="button" class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" onclick="closeDialog()" style="width:80px">关闭</button>
        </div>
    </div>
</div>



<script type="text/javascript">


    function showPreach(preachId) {
        $.ajax({
            url:"preach/searchById",
            data:"preachId="+preachId+"&take=123",
            type:"GET",
            success:function (result) {
                console.log(result);
                if(result.flag=="200"){
                    openDialog(result.preach);
                }else{
                    $.messager.alert("系统提示", "<font color=red>宣讲会不存在，请刷新！</font>");
                }
            }
        });


    }



    function createBtn(val,row) {
        var id = row.preachId;
        var btn="<button class=\"easyui-linkbutton\"  data-options=\"iconCls:'icon-upload'\" onclick='showPreach(\"" +id + "\")' style=\"width:60px;margin-left: 10px\">编辑</button>";
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


    function searchPreach() {
        var companyName=$("#companyName1").val();
        var sendName=$("#sendName1").val();
        var status=$("#status1").val();
        if(companyName==""){
            companyName=null;
        }
        if(sendName==""){
            sendName=null;
        }
        $("#dg4").datagrid('load', {
            companyName:companyName,
            snedName:sendName,
            status:status
        });
    }


    function checkStatus() {
        var status = $('#signPreach input:radio:checked').val();
        if(status=="2"){
            $("#showRemark").show();
        }else{
            $("#showRemark").hide();
        }

    }

    function openDialog(preach) {
        $("#dlg").dialog("open").dialog("setTitle", "审核宣讲会");
        $("#dlg").panel({
            closable:false
        });
        $("#title").append(preach.companyName+"宣讲会");
        $("#preachId").textbox("setValue",preach.preachId);
        // $("#preachId").val(preach.preachId);
        $("#companyName").append(preach.companyName);
        $("#sendId").append(preach.sendId);
        $("#sendName").append(preach.snedName);
        $("#school").append(preach.school);
        // $("#address").val(preach.address);
        $("#address").textbox("setValue",preach.address);
        $("#startTime").append(preach.startTime+"---"+preach.endTime)
        $("#content").append(preach.content);
        var status = preach.status;
        if(status=="0"){
            $("#showRemark").hide();
            $("#currentStatus").append("<font color='red'>待审核</font>");
        }else if(status=="1"){
            $("#showRemark").hide();
            $("#currentStatus").append("<font color='blue'>通过</font>");
        }else {
            $("#currentStatus").append("<font color='#808080'>不通过</font>");
            $("#remark").val(preach.remark);
            $("#showRemark").show();
        }
        // $("input[type='radio']").attr("checked",false);//取消选中
    }


    function updateDept() {
        var status = $('#signPreach input:radio:checked').val();
        if(status==null||status==""||status==undefined){
            $.messager.alert("系统提示", "<font color=red>请选择审核意见！！！！！</font>");
            return false;
        }
        if(status=="1"){
            var address=$("#address").textbox("getValue");
            if(address==""||address==undefined){
                $.messager.alert("系统提示", "<font color=red>请填写宣讲地址！！！！！</font>");
                return false;
            }else{
                $("#remark").val("");
            }
        }else{
            var remark=$("#remark").val();
            if(remark==""||remark==undefined){
                $.messager.alert("系统提示", "<font color=red>请填写拒绝原因！！！！！</font>");
                return false;
            }else{
                $("#address").val("");
            }
        }
        $.ajax({
            url:"preach/changePreachStatus",
            data:$("#signPreach").serialize(),
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
        $("#signPreach div").empty();
        $("#title").empty();
        $("#signPreach ").form('clear');
        $("#dlg").dialog("close");
    }


</script>




</body>
</html>
