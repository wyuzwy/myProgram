<%--suppress ALL --%>
<%--
  Created by IntelliJ IDEA.
  User: zhangwenyu
  Date: 2019/11/24
  Time: 14:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<head>
    <title>添加用户</title>
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
</head>
<body>
<table id="dg4" title="用户审核" class="easyui-datagrid" fitColumns="true"
       pagination="true" rownumbers="true" url="/searchByCondition" fit="true" toolbar="#tb">
    <thead>
    <tr>
        <%--<th field="cb" checkbox="true"></th>--%>
        <th data-options="field:'id',width:100">用户账号</th>
        <th data-options="field:'userDept',width:100">用户所属单位</th>
        <th data-options="field:'userName',width:50">用户姓名</th>
        <th data-options="field:'role',width:30,formatter:showRole">用户角色</th>
        <th data-options="field:'status',width:30,formatter:showStatus">状态</th>
        <th data-options="field:'backup',width:100">备注</th>
        <th data-options="field:'todo',width:30,formatter:createBtn">操作</th>
    </tr>
    </thead>
</table>
<div id="tb" align="center" >
    <table style="margin-top: 10px">
        <tr>
            <td>&nbsp;账号:&nbsp;</td>
            <td><input class="easyui-textbox" id="id1" name="id" size="10"/></td>
            <td>&nbsp;所在单位:&nbsp;</td>
            <td><input class="easyui-textbox" id="userDept1" name="userDept" size="10"/></td>
            <td>&nbsp;用户姓名:&nbsp;</td>
            <td><input class="easyui-textbox" id="userName1" name="userName1" size="10"/></td>
            <td>&nbsp;角色:&nbsp;</td>
            <td><select class="easyui-combobox"   id="role1" name="role" editable="false" panelHeight="auto" style="width:100px"  size="60">
                <option value="" selected>全部</option>
                <option value="1">学生</option>
                <option value="2">教师</option>
                <option value="3">企业</option>
            </select></td>
            <td>&nbsp;状态:&nbsp;</td>
            <td><select class="easyui-combobox"   id="status1" name="status" editable="false" panelHeight="auto" style="width:100px"  size="60">
                <option value="" selected>全部</option>
                <option value="0">待审核</option>
                <option value="1">通过</option>
                <option value="2">不通过</option>
            </select></td>
            <td><button class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="searchUser()"   style="width:80px;margin-left: 5px">查询</button></td>
            <td><button class="easyui-linkbutton" data-options="iconCls:'icon-print'" onclick="printUser()"   style="width:80px;margin-left: 5px">导出</button></td>
            <td><button class="easyui-linkbutton" data-options="iconCls:'icon-add'" onclick="addUserFromExcel()"   style="width:80px;margin-left: 5px">导入</button></td>
            <td><input id="addExcel" type="file" onchange="addExcel()" style="display: none" accept="*.xls,*.xlsx" hidden/></td>
            <%--<td><button class="easyui-linkbutton" data-options="iconCls:'icon-edit'" onclick="openDialog()"  style="width:80px;margin-left: 5px">编辑</button></td>--%>
            <%--<td><button class="easyui-linkbutton" data-options="iconCls:'icon-remove'" onclick="deleteDept()"  style="width:80px;margin-left: 5px">删除</button></td>--%>
        </tr>
    </table>
</div>
<div id="dlg" class="easyui-dialog" style="width:450px;height: 400px;padding: 10px 20px" data-options="modal:true"
     closed="true">
    <h1 style="margin-top: 10px;" align="center" id="title"></h1>
    <div style="margin-top: 10px;padding-left: 20px">
        <form id="userInfo">
            <table>
                <tr>
                    <td>用户账号：</td>
                    <td><input class="easyui-textbox" id="id2"   name="id" style="width:200px;height:30px;" data-options="readonly:true"></td>
                </tr>
                <tr>
                    <td>用户所在单位：</td>
                    <td><input class="easyui-textbox" id="userDept2"  name="userDept" style="width:200px;height:30px;" ></td>
                </tr>
                <tr>
                    <td>用户姓名：</td>
                    <td><input class="easyui-textbox" id="userName2"  name="userName" style="width:200px;height:30px;" ></td>
                </tr>
                <tr>
                    <td>用户角色：</td>
                    <td><select class="easyui-combobox"   id="role2" name="role" editable="false" panelHeight="auto" style="width:100px"  size="60">
                        <option value="1">学生</option>
                        <option value="2">教师</option>
                        <option value="3">企业</option>
                    </select></td>
                </tr>
                <tr>
                    <td>当前状态：</td>
                    <td><div id="status2"></div></td>
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
                    <td><textarea id="backup" name="backup" cols="30" rows="4" ></textarea></td>
                </tr>
            </table>
        </form>
        <div style="margin-bottom:20px;margin-left: 30px" ></div>
        <div style="text-align:center;padding:5px 0">
            <button type="button" class="easyui-linkbutton"  data-options="iconCls:'icon-add'" onclick="updateUser()"  style="width:80px">保存</button>
            <button  type="button" class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" onclick="closeDialog()" style="width:80px">关闭</button>
        </div>
    </div>
</div>
<script type="text/javascript">

    function showUser(id) {
        $.ajax({
            url:"searchById",
            data:"id="+id,
            type:"GET",
            success:function (result) {
                if(result.flag=="200"){
                    openDialog(result.user);
                }else{

                }
            }
        })
    }



    function addUserFromExcel() {
        $.messager.confirm("系统提示", "是否需要导入Excel表格，表格样式请" +
            "<a href='http://localhost:8080/Images\\userTest.jpg' target='_blank'> 点击此处</a>", function (r) {
            if(r){
                document.getElementById("addExcel").click();
            }
        });
    }

    function addExcel() {
        var files = $("#addExcel").prop('files');
        var fileInput = $('#addExcel').get(0).files[0];
        console.info(fileInput);
        if(fileInput){
            var data=new FormData();
            data.append('userExcel',files[0]);
            $.ajax({
                url:"/addUserFromExcel",
                type:"POST",
                data:data,
                cache:false,
                processData:false,
                contentType:false,
                success:function (result) {
                    console.log(result);
                    if(result.flag==200){
                        $.messager.alert("系统提示", "<font color=green>"+result.info+"</font>");

                    }else {
                        $.messager.alert("系统提示", "<font color=red>"+result.info+"</font>");
                    }
                    $("#addExcel").val("");
                }
            });
        }else{
            return false;
        }
    }


    function updateUser() {
        var userDept = $("#userDept2").val();
        if(userDept==""){
            $.messager.alert("系统提示", "<font color=red>请输入用户所在单位！！！！！</font>");
            return false;
        }
        var userName = $("#userName2").val();
        if(userName==""){
            $.messager.alert("系统提示", "<font color=red>请输入用户姓名！！！！！</font>");
            return false;
        }
        var status = $('#userInfo input:radio:checked').val();
        if(status=="2"){
            var backup=$("#backup").val();
            if(backup==""){
                $.messager.alert("系统提示", "<font color=red>请填写拒绝原因！！！！！</font>");
                return false;
            }
        }else{
            $("#backup").val("");
        }

        $.messager.confirm("系统提示", "您确认要修改？", function (r) {
            if (r) {
                $.ajax({
                    url:"/updateUser",
                    data:$("#userInfo").serialize(),
                    type:"POST",
                    success:function (result) {
                        console.log(result);
                        if(result.flag=="200"){
                            $.messager.alert("系统提示", "<font color=green>审核成功！！！！！</font>");
                            closeDialog();
                            $('#dg4').datagrid('reload');
                        }else {
                            $.messager.alert("系统提示", "<font color=red>修改失败，请重试！</font>");
                        }
                    }
                })


            }
        });
    }


    function searchUser() {
        var id = $("#id1").val();
        var userDept = $("#userDept1").val();
        var userName = $("#userName1").val();
        var role = $("#role1").val();
        var status = $("#status1").val();
        if (id == "") {
            id = null;
        }
        if (userDept == "") {
            userDept = null;
        }

        if (userName == "") {
            userName = null;
        }
        if (role == "") {
            role = null;
        }
        if (status == "") {
            status = null;
        }

        $("#dg4").datagrid('load', {
            id: id,
            userDept: userDept,
            userName: userName,
            role: role,
            status: status
        });
    }

    function printUser() {

        var data=$('#dg4').datagrid('getData');
        if(data.total==0){
            $.messager.alert("系统提示", "<font color=red>暂无记录可导出！</font>");
            return false;
        }


        var id = $("#id1").val();
        var userDept = $("#userDept1").val();
        var userName = $("#userName1").val();
        var role = $("#role1").val();
        var status = $("#status1").val();
        var params = {id:id,userDept:userDept,userName:userName,role:role,status:status};
        var url="/getUserExcel";
        var form = $("<form method='post'></form>");
        var input;
        form.attr({"action":url});
        $.each(params,function (key,value) {
            input = $("<input type='hidden'>");
            input.attr({"name":key});
            input.val(value);
            form.append(input);
        });
        $(document.body).append(form);
        form.submit();
    }


    function showStatus(val,row) {
        var text;
        if(val=="0"){
            text="待审核";
        }else if(val=="1"){
            text="通过";
        }else{
            text="不通过";
        }
        return text;
    }

    function createBtn(val,row) {

        if (row.role != "0"){

            var id = row.id;
            var btn = "<button class=\"easyui-linkbutton\"  data-options=\"iconCls:'icon-upload'\" onclick='showUser(\"" + id + "\")' style=\"width:60px;margin-left: 10px\">编辑</button>";
            return btn;
        }

    }

    function showRole(val,row) {
        var text;
        if(val=="0"){
            text="管理员";
        }else if(val=="1"){
            text="学生";
        }else if(val=="2"){
            text="教师";
        }else if(val=="3"){
            text="企业";
        }
        return text;
    }

    function openDialog(user) {

        $("#dlg").dialog("open").dialog("setTitle", "审核/修改用户信息");
        $("#dlg").panel({
            closable: false
        });
        $("#userInfo").form("load", user);
        var val=user.status;
        var text;
        if(val=="0"){
            text="待审核";
            $("#showRemark").hide();
        }else if(val=="1"){
            text="通过";
            $("#showRemark").hide();
        }else{
            text="不通过";
            $("#showRemark").show();
        }
        $("#status2").append(text);
    }


    function checkStatus() {
        var status = $('#userInfo input:radio:checked').val();
        if(status=="2"){
            $("#showRemark").show();
        }else{
            $("#showRemark").hide();
        }

    }


    function closeDialog(){
        // window.location.reload();
        $('#userInfo').form('clear');
        $("#status2").empty();
        $("#dlg").dialog("close");
    }




</script>
</body>
</html>
