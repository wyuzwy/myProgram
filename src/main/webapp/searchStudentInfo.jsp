<%--
  Created by IntelliJ IDEA.
  User: zhangwenyu
  Date: 2019/11/24
  Time: 17:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>查看生源信息</title>
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
<table id="dg4" title="生源信息" class="easyui-datagrid" fitColumns="true"
       pagination="true" rownumbers="true" url="/student/searchByCondition" fit="true" toolbar="#tb">
    <%--findEmp--%>
    <thead>
    <tr>
        <%--<th field="cb" checkbox="true"></th>--%>
        <th data-options="field:'xh',width:50" >学号</th>
        <th data-options="field:'xm',width:50">姓名</th>
        <th data-options="field:'xb',width:30,formatter:formatSex">性别</th>
        <th data-options="field:'xy',width:100">学院</th>
        <th data-options="field:'zy',width:100">专业</th>
        <th data-options="field:'status',width:30,formatter:showStatus">状态</th>
        <th data-options="field:'remark',width:100">备注</th>
        <th data-options="field:'todo',width:30,formatter:createBtn">操作</th>

    </tr>
    </thead>
</table>
<div id="tb" align="center">
    <table style="margin-top: 10px">
        <tr>
            <td>&nbsp;学号:&nbsp;</td>
            <td><input class="easyui-textbox"id="xh1" name="xh" size="10"/></td>
            <td>&nbsp;姓名:&nbsp;</td>
            <td><input class="easyui-textbox"id="xm1" name="xm" size="10"/></td>
            <td>&nbsp;&nbsp;学院：&nbsp;</td>
            <td><select class="easyui-combobox"   id="xy1" name="xy" editable="false" panelHeight="auto" style="width:180px"  size="60"
                        data-options="valueField:'value', textField:'text',editable:false,onBeforeLoad:function(){showCollege();}">
                <%--<option value="0" selected>请选择...</option>--%>
            </select>
            </td>
            <td>&nbsp;状态:&nbsp;</td>
            <td><select class="easyui-combobox"   id="status1" name="status" editable="false" panelHeight="auto" style="width:100px"  size="60">
                <option value="-1" selected>全部</option>
                <option value="0">待审核</option>
                <option value="1">通过</option>
                <option value="2">不通过</option>
            </select></td>
            <td><button  class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="searchStudentInfo()"  style="width:80px;margin-left: 5px">查询</button></td>
            <td><button  class="easyui-linkbutton" data-options="iconCls:'icon-print'" onclick="printStu()"  style="width:80px;margin-left: 5px">导出</button></td>
            <%--<td><button  class="easyui-linkbutton" data-options="iconCls:'icon-edit'" onclick="openDialog()"  style="width:80px;margin-left: 5px">编辑</button></td>--%>
            <%--<td><button  class="easyui-linkbutton" data-options="iconCls:'icon-remove'" onclick="deleteEmp()"  style="width:80px;margin-left: 5px">删除</button></td>--%>
        </tr>
    </table>
    <div style="margin-bottom:10px"></div>

</div>

<div id="dlg" class="easyui-dialog" style="width: 800px;height: 600px;padding: 10px 20px" data-options="modal:true"
     closed="true">
    <h2 align="center" id="title"></h2>
    <form id="studentInfo">
        <div align="left">
            <h3>审核信息</h3>
        </div>
        <table style="margin-left: 30px">
            <%--<div style="width: 600px">--%>
            <tr style="padding-bottom: 20px">
                <%--<div  style="width: 300px;float: left">--%>
                <td>审核人员：</td><td><input class="easyui-textbox" data-options="readonly:true" id="confirmName" name="confirmName" /></td>
                <%--</div>--%><td>&nbsp;</td>
                <%--<div  style="width: 300px;float: right">--%>
                <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;审核时间：</td><td><input class="easyui-textbox" data-options="readonly:true" id="ensureTime" name="ensureTime" /></td>
                <%--</div>--%>
            </tr>
            <%--</div>--%>
            <tr style="padding-bottom: 20px">
                <%--<div  style="width: 600px">--%>
                <%--<div  style="width: 300px;float: left">--%>
                <td>审核状态：</td><td><input class="easyui-textbox" data-options="readonly:true" id="status" /></td>
                <%--</div>--%><td>&nbsp;</td>
                <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;备&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;注：</td><td>
                <div id="question" style="width: 300px;float: right">

                </div>
            </td>
                <%--</div>--%>
            </tr>
        </table>

        <div align="left">
            <h3>基本信息</h3>
        </div>

        <table style="margin-left: 30px">
            <tr>
                <td>姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名：</td><td><input class="easyui-textbox" data-options="readonly:true" name="xm" id="xm"/></td>


                <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别：</td><td><input  class="easyui-textbox" data-options="readonly:true" name="sex" id="sex"/></td>

            </tr>
            <tr>
                <td>身份证号：</td><td><input class="easyui-textbox" data-options="readonly:true" name="sfzh" id="sfzh"/></td>



                <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;出生日期：</td><td><input  class="easyui-textbox" data-options="readonly:true" name="csrq" id="csrq"/></td>

            </tr>
            <tr>
                <td>政治面貌：</td><td><input  class="easyui-textbox" data-options="readonly:true" name="zzmm" id="zzmm" ></td>
                <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;民&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;族：</td><td><input  class="easyui-textbox" data-options="readonly:true" name="mz" id="mz" ></td>
            </tr>
            <tr>
                <td>生&nbsp;源&nbsp;地&nbsp;：</td><td><input class="easyui-textbox" data-options="readonly:true" name="syd" id="syd"/></td>
            </tr>
        </table>
            <div align="left">
                <h3>联系方式</h3>
            </div>
        <table style="margin-left: 30px">
            <tr>
                <td>手机号码：</td><td><input class="easyui-textbox" data-options="readonly:true" name="sjhm" id="sjhm"/></td>
                <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;电子邮箱：</td><td><input type="text" class="form-control" name="dzyx" id="dzyx"/></td>
            </tr>
            <tr>
                <td>家庭地址：</td><td><input class="easyui-textbox" data-options="readonly:true" name="jtdz" id="jtdz"/></td>
                <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;家庭邮编：</td><td><input class="easyui-textbox" data-options="readonly:true" name="jtyb" id="jtyb"/></td>
            </tr>
        </table>
            <div align="left">
                <h3>学籍信息</h3>
            </div>
        <table style="margin-left: 30px">
            <tr>
                <td>学&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;号：</td><td><input class="easyui-textbox" data-options="readonly:true" name="xh" id="xh"/></td>
                <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;学校名称：</td><td><input class="easyui-textbox" data-options="readonly:true" name="xxmc" id="xxmc"/></td>
            </tr>
            <tr>
                <td>校&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;区：</td><td><input class="easyui-textbox" data-options="readonly:true" name="xq" id="xq" /></td>
                <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;学&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;院：</td><td><input class="easyui-textbox" data-options="readonly:true" name="xy" id="xy"/></td>
            </tr>
            <tr>
                <td>学校专业：</td><td><input class="easyui-textbox" data-options="readonly:true" name="zy" id="zy" /></td>
                <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;班&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;级：</td><td><input class="easyui-textbox" data-options="readonly:true" name="bj" id="bj"/></td>
            </tr>
            <tr>
                <td>学&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;历：</td><td><input class="easyui-textbox" data-options="readonly:true" name="xl" id="xl"/></td>
                <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;学&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;制：</td><td><input class="easyui-textbox" data-options="readonly:true" name="xz" id="xz"/></td>
            </tr>
        </table>
    </form>
    <div style="text-align:center;padding:5px 0">
        <button  type="button" class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" onclick="closeDialog()" style="width:80px">关闭</button>
    </div>
</div>


<script type="text/javascript">


    function showStudentInfo(xh) {
        $.ajax({
            url:"student/searchInfoById",
            data:"xh="+xh,
            type:"GET",
            success:function (result) {
                console.log(result);
                if(result.flag=="200"){
                    openDialog(result.student);
                }else{
                    $.messager.alert("系统提示", "<font color=red>无该学生生源信息，请刷新！</font>");
                }
            }
        })
    }


    function showCollege() {

        $.ajax({
            url: "/college/getListByPid",
            data: "pid=0",
            type: "GET",
            success: function (result) {
                console.log(result);
                if (result.flag == "200") {
                    var data = result.list;
                    var option = [{'text': '请选择', 'value': ''}];
                    for (var i = 0; i < data.length; i++) {
                        option.push({"text": data[i].name, "value": data[i].name});
                    }
                    $("#xy1").combobox("loadData", option);

                    // $("#studentDept1").combobox({//往下拉框塞值
                    //     data:list,
                    //     valueField:"name",//value值
                    //     textField:"name",//文本值
                    //     panelHeight:"auto"
                    // });
                } else {
                    console.log("搜索不到！");
                }
            }
        });

    }

    function openDialog(student) {

        $("#dlg").dialog("open").dialog("setTitle", "查看学生生源信息");
        $("#dlg").panel({
            closable:false
        });
        $("#title").append(student.xm+"的生源信息");
        if(student.status=="2"){
            $("#question").append(+student.remark);
        }
        var status = student.status;
        if(status=="0"){
            status="待审核";
        }else if(status=="1"){
            status="通过";
        }else{
            status="不通过";
        }
        var sex = student.xb;
        if(sex=="1"){
            sex="男";
        }else{
            sex="女";
        }
        $("#sex").textbox("setValue",sex);
        $("#status").textbox("setValue",status);
        $("#studentInfo").form("load", student);
    }


    function searchStudentInfo() {
        var xh = $('#xh1').val();
        var xm = $('#xm1').val();
        var xy = $('#xy1').combobox("getValue");
        var status = $('#status1').combobox("getValue");
        // if(number==""){
        //     number=null;
        // }
        if(xh =="") {
            xh=null;
        }
        if(xm =="") {
            xm=null;
        }
        if(xy =="") {
            xy=null;
        }
        $('#dg4').datagrid('load', {
            xh: xh,
            xm: xm,
            xy: xy,
            status:status
        });
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
        var id = row.xh;
        var btn = "<button class=\"easyui-linkbutton\"  data-options=\"iconCls:'icon-upload'\" onclick='showStudentInfo(\"" + id + "\")' style=\"width:60px;margin-left: 10px\">编辑</button>";
        return btn;
    }

    function formatSex(val,row) {
        var text;
        if(val=="1"){
            text="男";
        }else{
            text="女";
        }
        return text;
    }


    function closeDialog(){
        $("#title").empty();
        $("#question").empty();
        $('#studentInfo').form('clear');
        $("#dlg").dialog("close");
    }

    function printStu() {
        var data=$('#dg4').datagrid('getData');
        if(data.total==0){
            $.messager.alert("系统提示", "<font color=red>暂无记录可导出！</font>");
            return false;
        }
        var xh = $('#xh1').val();
        var xm = $('#xm1').val();
        var xy = $('#xy1').combobox("getValue");
        var status = $('#status1').combobox("getValue");
        // var url="status="+status;
        // if(number==""){
        //     number=null;
        // }
        var params = {xh:xh,xm:xm,xy:xy,status:status};
        var url="/student/getStudentExcel";
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
</script>





</body>
</html>
