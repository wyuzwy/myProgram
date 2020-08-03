<%--
  Created by IntelliJ IDEA.
  User: zhangwenyu
  Date: 2019/11/24
  Time: 17:49
  To change this template use File | Settings | File Templates.
--%>
<%
    request.setCharacterEncoding("utf-8");

    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>查询员工</title>
    <link rel="icon" href="<%request.getContextPath();%>/static/favicon.ico" type="image/x-icon">
    <script type="text/javascript" src="login_style/js/jquery-1.8.2.min.js"></script>
    <link rel="stylesheet" type="text/css" href="easyui/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="easyui/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="easyui/demo/demo.css">
    <script type="text/javascript" src="easyui/jquery.min.js"></script>
    <script type="text/javascript" src="easyui/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="easyui/datagrid-export.js"></script>
    <link rel="stylesheet" href="login_style/css/supersized.css">
    <link rel="stylesheet" href="login_style/css/login.css">
    <script type="text/javascript" src="easyui/locale/easyui-lang-zh_CN.js"></script>
    <style type="text/css">

    </style>
</head>
<body>
<table id="dg4" title="就业信息" class="easyui-datagrid" fitColumns="true"
       pagination="true" rownumbers="true" url="emp/searchByCondition" fit="true" toolbar="#tb">
    <%--findEmp--%>
    <thead>
    <tr>
        <%--<th field="cb" checkbox="true"></th>--%>
        <th data-options="field:'studentId',width:50">学号</th>
        <th data-options="field:'studentName',width:50">姓名</th>
        <th data-options="field:'studentDept',width:100">学院</th>
        <th data-options="field:'studentMajor',width:50">专业</th>
        <th data-options="field:'jobName',width:50">职位</th>
        <th data-options="field:'status',width:30,formatter:showStatus">状态</th>
        <th data-options="field:'remark',width:100">备注</th>
        <th data-options="field:'todo',width:50,formatter:createBtn">操作</th>
    </tr>
    </thead>
</table>
<div id="tb" align="center">
    <table style="margin-top: 10px">
        <tr>
            <td>&nbsp;学号:&nbsp;</td>
            <td><input class="easyui-textbox" id="studentId1" name="studentId" size="10"/></td>
            <td>&nbsp;姓名:&nbsp;</td>
            <td><input class="easyui-textbox" id="studentName1" name="studentName" size="10"/></td>
            <td>&nbsp;&nbsp;学院：&nbsp;</td>
            <td><select class="easyui-combobox"   id="studentDept1" name="studentDept" editable="false" panelHeight="auto" style="width:180px"  size="60"
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
            <td><button  class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="searchStudentJob()"  style="width:80px;margin-left: 5px">查询</button></td>
            <td><button  class="easyui-linkbutton" data-options="iconCls:'icon-print'" onclick="printEmp()"  style="width:80px;margin-left: 5px">导出</button></td>
            <%--<td><button  class="easyui-linkbutton" data-options="iconCls:'icon-edit' /*"*/ " onclick="openDialog()"  style="width:80px;margin-left: 5px">编辑</button></td>--%>
            <%--<td><button  class="easyui-linkbutton" data-options="iconCls:'icon-remove'" onclick="deleteEmp()"  style="width:80px;margin-left: 5px">删除</button></td>--%>
        </tr>
    </table>
    <div style="margin-bottom:10px"></div>

</div>

<div id="dlg" class="easyui-dialog" style="width: 800px;height: 600px;padding: 10px 20px" data-options="modal:true"
     closed="true">
    <h2 align="center" id="title"></h2>
    <form id="studentJob">
        <div align="left">
            <h3>审核信息</h3>
        </div>
        <table style="margin-left: 30px">
            <%--<div style="width: 600px">--%>
            <tr style="padding-bottom: 20px">
                <%--<div  style="width: 300px;float: left">--%>
                    <td>审核人员：</td><td><input class="easyui-textbox" data-options="readonly:true" id="checkMan" name="checkMan" /></td>
                    <%--</div>--%><td>&nbsp;</td>
                <%--<div  style="width: 300px;float: right">--%>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;审核时间：</td><td><input class="easyui-textbox" data-options="readonly:true" id="chaeckTime" name="chaeckTime" /></td>
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
            <h3>学生信息</h3>
        </div>
        <table style="margin-left: 30px">
            <tr>
            <%--<div style="margin-bottom:20px;margin-left: 30px">--%>
                <td>学&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;号：</td><td><input class="easyui-textbox" data-options="readonly:true"  name="studentId" id="studentId"/></td>

            <%--</div>--%><td>&nbsp;</td>
            <%--<div style="margin-bottom:20px;margin-left: 30px">--%>
                <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名：</td><td><input class="easyui-textbox" data-options="readonly:true"  name="studentName" id="studentName"/></td>

            <%--</div>--%>
            </tr>
            <tr>
            <%--<div style="margin-bottom:20px;margin-left: 30px">--%>
                <td>学&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;院：</td><td><input class="easyui-textbox" data-options="readonly:true" name="studentDept" id="studentDept" /></td>

            <%--</div>--%><td>&nbsp;</td>
            <%--<div style="margin-bottom:20px;margin-left: 30px">--%>
                <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;专&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;业：</td><td><input class="easyui-textbox" data-options="readonly:true" name="studentMajor" id="studentMajor" /></td>

            <%--</div>--%>
            </tr>
        </table>
        <div align="left">
            <h3>企业信息</h3>
        </div>
        <table style="margin-left: 30px">
            <tr>
                <%--<div style="margin-bottom:20px;margin-left: 30px">--%>
                <td>公司名称：</td><td><input class="easyui-textbox" data-options="readonly:true" name="companyName" id="companyName"/></td>
                <%--</div>--%><td>&nbsp;&nbsp;</td>
                <%--<div style="margin-bottom:20px;margin-left: 30px">--%>
                 <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;单位性质：</td><td><input class="easyui-textbox" data-options="readonly:true"  name="companyProperty" id="companyProperty"  /></td>
                <%--</div>--%>
            </tr>
            <tr>
                <%--<div style="margin-bottom:20px;margin-left: 30px">--%>
                <td>所属行业：</td><td><input class="easyui-textbox" data-options="readonly:true"  name="companyCategory" id="companyCategory" /></td>

                <%--</div>--%><td></td>
                <%--<div style="margin-bottom:20px;margin-left: 30px">--%>
                 <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;所在省份：</td><td><input class="easyui-textbox" data-options="readonly:true"  name="companyProvinces" id="companyProvinces" /></td>
            </tr>
            <tr>
                <%--</div>--%>
                <%--<div style="margin-bottom:20px;margin-left: 30px">--%>
                    <td>所在城市：</td><td><input class="easyui-textbox" data-options="readonly:true" name="companyCity" id="companyCity" ></td>

                <%--</div>--%><td></td>
                <%--<div style="margin-bottom:20px;margin-left: 30px">--%>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;详细地址：</td><td><input class="easyui-textbox" data-options="readonly:true"  name="companyAddress" id="companyAddress"/></td>
                <%--</div>--%>
            </tr>
            <tr>
                <%--<div style="margin-bottom:20px;margin-left: 30px">--%>
                 <td>岗位名称：</td><td><input class="easyui-textbox" data-options="readonly:true"  name="jobName" id="jobName"/></td>

                <%--</div>--%><td></td>
                <%--<div style="margin-bottom:20px;margin-left: 30px">--%>
                 <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;专业是否对口：</td><td><input class="easyui-textbox" data-options="readonly:true"   id="jobCounterpart" /></td>

                <%--</div>--%>
            </tr>
            <tr>
                <%--<div style="margin-bottom:20px;margin-left: 30px">--%>
                <td>签约日期：</td><td><input  class="easyui-textbox" data-options="readonly:true" name="signTime" id="signTime" /></td>

                <%--</div>--%><td></td>
                <%--<div style="margin-bottom:20px;margin-left: 30px">--%>
                <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;企业联系人：</td><td><input  class="easyui-textbox" data-options="readonly:true" name="companyMan" id="companyMan" /></td>
                <%--</div>--%>
            </tr>
            <tr>
                <%--<div style="margin-bottom:20px;margin-left: 30px">--%>
                 <td>联系人手机：</td><td><input  class="easyui-textbox" data-options="readonly:true" name="manPhone" id="manPhone" /></td>

                <%--</div>--%><td></td>
                <%--<div style="margin-bottom:20px;margin-left: 30px">--%>
                 <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;联系人电话：</td><td><input  class="easyui-textbox" data-options="readonly:true" name="manTelephone" id="manTelephone" /></td>
                <%--</div>--%>
            </tr>
            <tr>
                <%--<div style="margin-bottom:20px;margin-left: 30px">--%>
                 <td>联系人邮箱：</td><td><input  class="easyui-textbox" data-options="readonly:true" name="manEmail" id="manEmail" /></td>

                <%--</div>--%><td></td>
                <%--<div style="margin-bottom:20px;margin-left: 30px">--%>
                 <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;企业邮编：</td><td><input  class="easyui-textbox" data-options="readonly:true" name="companyPostcode" id="companyPostcode" /></td>
                <%--</div>--%>
            </tr>
            <tr>
                <%--<div style="margin-bottom:20px;margin-left: 30px">--%>
                 <td>工作薪酬：</td><td><input  class="easyui-textbox" data-options="readonly:true" name="money" id="money" /></td>

                <%--</div>--%><td></td>
                <%--<div style="margin-bottom:20px;margin-left: 30px">--%>
                 <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;创建时间：</td><td><input  class="easyui-textbox" data-options="readonly:true" name="createTime" id="createTime"  /></td>
                <%--</div>--%>
            </tr>
        <%--<div style="margin-bottom:20px;margin-left: 30px">--%>
            <%--当前状态--%>
            <%--<div class="col-sm-2" id="status" style="margin-top: 7px">--%>

            <%--</div>--%>
        <%--</div>--%>
        <%--<input name="status" id="status" hidden/>--%>
        </table>
    </form>
    <div style="text-align:center;padding:5px 0">
        <%--<button type="button" class="easyui-linkbutton"  data-options="iconCls:'icon-add'" onclick="updateEmp()"  style="width:80px">保存</button>--%>
        <button  type="button" class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" onclick="closeDialog()" style="width:80px">关闭</button>
    </div>

</div>


<script type="text/javascript">



    $(function () {
        // $.ajax({
        //     url:"/college/getListByPid",
        //     data:"pid=0",
        //     type:"GET",
        //     success:function (result) {
        //         console.log(result);
        //         if(result.flag=="200"){
        //             showCollege(result.list);
        //         }else{
        //             console.log("搜索不到！");
        //         }
        //     }
        // });
    });

    function showCollege() {

        $.ajax({
            url:"/college/getListByPid",
            data:"pid=0",
            type:"GET",
            success:function (result) {
                console.log(result);
                if(result.flag=="200"){
                    var data=result.list;
                    var option = [{ 'text': '请选择', 'value': ''}];
                    for (var i = 0; i < data.length; i++) {
                        option.push({ "text": data[i].name, "value": data[i].name });
                    }
                    $("#studentDept1").combobox("loadData", option);

                    // $("#studentDept1").combobox({//往下拉框塞值
                    //     data:list,
                    //     valueField:"name",//value值
                    //     textField:"name",//文本值
                    //     panelHeight:"auto"
                    // });
                }else{
                    console.log("搜索不到！");
                }
            }
        });


        // $("#studentDept1").empty();
        // var optionEle = $("<option></option>").append("请选择").attr("value"," ");
        // optionEle.appendTo("#studentDept1");
        // $.each(list,function (index,item) {
        //     var optionEle = $("<option></option>").append(item.name).attr("value",item.name);
        //     optionEle.appendTo("#studentDept1");
        // });
    }

    function showStudentJob(id) {
        $.ajax({
            url:"/emp/searchById",
            data:"studentId="+id,
            type:"GET",
            success:function (result) {
                console.log(result);
                if(result.flag=="200"){
                    openDialog(result.employment);
                }else{
                    $.messager.alert("系统提示", "<font color=red>无该学生就业信息，请刷新！</font>");
                }
            }
        })


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
        var id = row.studentId;
        var btn = "<button class=\"easyui-linkbutton\"  data-options=\"iconCls:'icon-upload'\" onclick='showStudentJob(\"" + id + "\")' style=\"width:60px;margin-left: 10px\">编辑</button>";
        return btn;
    }


    function searchStudentJob() {
        var studentId = $('#studentId1').val();
        var studentName = $('#studentName1').val();
        var studentDept = $('#studentDept1').combobox("getValue");
        var status = $('#status1').combobox("getValue");
        // if(number==""){
        //     number=null;
        // }
        if(studentId1 =="") {
            studentId1=null;
        }
        if(studentName =="") {
            studentName=null;
        }
        if(studentDept =="") {
            studentDept=null;
        }
        $('#dg4').datagrid('load', {
            studentId: studentId,
            studentName: studentName,
            studentDept: studentDept,
            status:status
        });
    }









    function openDialog(studentJob) {

        $("#dlg").dialog("open").dialog("setTitle", "查看学生就业信息");
        $("#dlg").panel({
            closable:false
        });
        $("#title").append(studentJob.studentName+"的就业信息");
        if(studentJob.status=="2"){
            $("#question").append(+studentJob.remark);
        }
        var status = studentJob.status;
        if(status=="0"){
            status="待审核";
        }else if(status=="1"){
            status="通过";
        }else{
            status="不通过";
        }
        $("#status").textbox("setValue",status);
        var flag = studentJob.jobCounterpart;
        if(flag=="1"){
            flag="专业对口";
        }else{
            flag="专业不对口";
        }
        $("#jobCounterpart").textbox("setValue",flag);
        $("#studentJob").form("load", studentJob);
        // var time = timeStamp2String(row.brithday);
        // $("#UE #birthday").datebox("setValue",time);
    }

    function closeDialog() {
        $("#title").empty();
        $("#question").empty();
        $('#studentJob').form('clear');
        $("#dlg").dialog("close");
    }










    function printEmp() {//导出数据到excel
        var data=$('#dg4').datagrid('getData');
        if(data.total==0){
            $.messager.alert("系统提示", "<font color=red>暂无记录可导出！</font>");
            return false;
        }
        var studentId = $('#studentId1').val();
        var studentName = $('#studentName1').val();
        var studentDept = $('#studentDept1').combobox("getValue");
        var status = $('#status1').combobox("getValue");
        // var url="status="+status;
        // if(number==""){
        //     number=null;
        // }
        var params = {studentId:studentId,studentName:studentName,studentDept:studentDept,status:status};
        var url="/emp/getEmploymentExcel";
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



        // if(studentId1 !="") {
        //     url+="&studentId="+studentId1;
        // }
        // action="/emp/getEmploymentExcel" method="post"
        // if(studentName !="") {
        //     url+="&studentName="+studentName;
        // }
        // if(studentDept !="") {
        //     url+="&studentDept="+studentDept;
        // }
        // $.post("http://localhost:8080/emp/getEmploymentExcel",{studentId:studentId1,studentName:studentName,studentDept:studentDept,status:status});
        // window.location.href="http://localhost:8080/emp/getEmploymentExcel?"+url;
        // $("#dg4").datagrid('toExcel','employee.xls');
        // console.log("ajaxDownloadSynchronized");
        // var url = "http://localhost:8080/ajaxDownloadServlet.do";
        // var fileName = "testAjaxDownload.txt";
        // var form = $("<form></form>").attr("action", url).attr("method", "post");
        // form.append($("<input></input>").attr("type", "hidden").attr("name", "fileName").attr("value", fileName));
        // form.appendTo('body').submit().remove();
    }

</script>
</body>
</html>
