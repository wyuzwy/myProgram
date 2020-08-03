<%--
  Created by IntelliJ IDEA.
  User: zhangwenyu
  Date: 2019/11/23
  Time: 10:08
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>用户列表</title>
    <link rel="icon" href="<%request.getContextPath();%>/static/favicon.ico" type="image/x-icon">
    <link rel="stylesheet" type="text/css" href="easyui/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="easyui/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="easyui/demo/demo.css">
    <script type="text/javascript" src="easyui/jquery.min.js"></script>
    <script type="text/javascript" src="easyui/jquery.easyui.min.js"></script>
    <link rel="stylesheet" href="login_style/css/supersized.css">
    <link rel="stylesheet" href="login_style/css/login.css">
    <script type="text/javascript" src="easyui/datagrid-export.js"></script>
    <script type="text/javascript" src="easyui/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="login_style/js/md5.js"></script>
    <style type="text/css">
        #ud span.textbox {
            border: 0;
        }
    </style>
</head>
<body>
<table id="dg4" title="用户信息" class="easyui-datagrid" fitColumns="true"
       pagination="true" rownumbers="true" url="company/searchCompany" fit="true" toolbar="#tb" .>
    <thead>
    <tr>
        <%--<th field="cb" checkbox="true"></th>--%>
        <th data-options="field:'companyEmail',width:150">账号</th>
        <th data-options="field:'companyName',width:150">公司名称</th>
        <th data-options="field:'userName',width:100">用户名</th>
        <th data-options="field:'phone',width:100">手机</th>
        <th data-options="field:'status',width:50,formatter:formatStatus">状态</th>
        <th data-options="field:'createTime',width:150">注册时间</th>
        <th data-options="field:'do',width:50,formatter:createDo">操作</th>
    </tr>
    </thead>
</table>
<div id="tb" align="center" >
    <table style="margin-top: 10px">
        <tr>
            <td>&nbsp;账号:&nbsp;</td>
            <td><input class="easyui-textbox" id="companyEmail" name="companyEmail" size="10"/></td>
            <td>&nbsp;公司名称:&nbsp;</td>
            <td><input class="easyui-textbox"id="companyName" name="companyName" size="10"/></td>
            <td>&nbsp;状态：&nbsp;</td>
            <td><select class="easyui-combobox"   id="status" name="status" editable="false" panelHeight="auto" style="width:100px"  size="60">
                    <option value="-1" selected>全部</option>
                    <option value="0">待审核</option>
                    <option value="1">通过</option>
                    <option value="2">不通过</option>
                </select></td>

            <td><button class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="searchUser()"   style="width:80px;margin-left: 5px">查询</button></td>
            <td><button class="easyui-linkbutton" data-options="iconCls:'icon-print'" onclick="printCompany()"   style="width:80px;margin-left: 5px">导出</button></td>
            <%--<td><button class="easyui-linkbutton" data-options="iconCls:'icon-edit'" onclick="openDialog()"  style="width:80px;margin-left: 5px">编辑</button></td>--%>
            <%--<td><button class="easyui-linkbutton" data-options="iconCls:'icon-remove'" onclick="deleteUser()"  style="width:80px;margin-left: 5px">删除</button></td>--%>
        </tr>
    </table>
        <div style="margin-bottom:10px"></div>
</div>

<div id="dlg" class="easyui-dialog" data-options="modal:true"  style="width: 800px;height: 600px;padding: 10px 20px"
     closed="true" >
        <form id="companyInfo" >
            <table align="center">
            <tr>
                <td>公司账号：</td>
                <td >
                    <input type="text" readonly id="company_email" name="companyEmail" style="margin-top: 7px"></input>

                </td>
                <td  >公司名称：</td>
                <td >
                    <div  id="companyName1" style="margin-top: 7px"></div>
                    <%--<input type="text" readonly class="form-control" name="uId" id="user_id" value="${currentUser.userId}"/>--%>

                </td>

            </tr>
            <tr>
                <td >用户姓名：</td>
                <td >
                    <div  id="userName1" style="margin-top: 7px"></div>
                </td>
                <td>手机号码：</td>
                <td>
                    <div id="phone1" style="margin-top: 7px"></div>
                </td>
            </tr>
            <tr class="form-group">
                <td>公司地址：</td>
                <td class="col-sm-4 ">
                    <div  id="address" style="margin-top: 7px"></div>
                </td>
                <td>更新于：</td>
                <td class="col-sm-4 ">
                    <div id="update_time" style="margin-top: 7px"></div>
                </td>
            </tr>

            <tr>
                <td>固定电话：</td>
                <td>
                    <div  id="telephone1" style="margin-top: 7px"></div>
                </td>
                <td>招聘邮箱：</td>
                <td>
                    <div id="job_email" style="margin-top: 7px"></div>
                </td>
            </tr>

            <tr>
                <td>单位性质：</td>
                <td>
                    <div  id="company_property" style="margin-top: 7px"></div>
                </td>
                <td>所属行业：</td>
                <td>
                    <div id="company_category" style="margin-top: 7px"></div>
                </td>
            </tr>
            <tr>
                <td>单位规模：</td>
                <td>
                    <div  id="scale" style="margin-top: 7px"></div>
                </td>
                <td>注册资金：</td>
                <td>
                    <div id="register_money" style="margin-top: 7px"></div>
                </td>
            </tr>
            <tr>
                <td>企业logo：</td>
                <td>
                    <img src=""  id="logo1" style="margin-top: 7px;width: 50px;height: 50px">
                </td>
            </tr>
            <tr>
                <td>营业执照：</td>
                <td>
                    <img src="" id="company_license" style="margin-top: 7px;width: 150px;height: 200px">
                </td>
            </tr>
        </table>
            <div>
                <div><strong>公司简介：</strong></div>
                <div  id="introduction1" style="margin-top: 7px">

                </div>
            </div>
            <div  style="width: 300px;margin-top: 20px">
                <div style="width: 100px;float: left"><strong>当前状态：</strong></div>
                <div  id="status2" style="width: 200px;float: left">

                </div>
            </div>
            </br>
            <div style="width: 420px;margin-top: 20px">
                <div style="width: 100px;float: left"><strong>审核意见：</strong></div>
                <div style="width: 120px;float: left">
                    <label class="radio-inline">
                        <input type="radio"  value="1" name="status" onchange="checkStatus()">通过
                    </label>
                    <label class="radio-inline">
                        <input type="radio"  value="2" name="status" onchange="checkStatus()">不通过
                    </label>
                </div>
                <div id="showRemark" hidden style="width: 200px;float: right">
                    <textarea  id="backup" name="backup" cols="30" rows="4" ></textarea>
                </div>
            </div>
            <div  style="padding-top: 30px;margin-left: 38%">
                <a href="javascript:void(0)" class="easyui-linkbutton" onclick="updateCompany()" iconCls="icon-ok">保存</a>
                <a href="javascript:void(0)" class="easyui-linkbutton" onclick="closeDialog()" iconCls="icon-cancel">关闭</a>
            </div>
        </form>

</div>




<script>
    function searchUser() {
        var companyEmail = $('#companyEmail').val();
        var companyName=$('#companyName').val();
        var status = $('#status').combobox("getValue");
        // if(number==""){
        //     number=null;
        // }
        if(companyEmail =="") {
            companyEmail=null;
        }
        if(companyName==""){
            companyName=null;
        }
        $('#dg4').datagrid('load', {
            companyEmail: companyEmail,
            companyName: companyName,
            status: status
        });
    }

    function openDialog() {

        $("#dlg").dialog("open").dialog("setTitle", "审核企业信息");
        $("#dlg").panel({
            closable:false
        });

    }







    function updateCompany() {

        var companyEmail = $("#company_email").val();
        if(companyEmail==""||companyEmail==undefined){
            $.messager.alert("系统提示", "<font color=red>加载异常，请重试!</font>");
            return false;
        }

        var status = $('#companyInfo input:radio:checked').val();
        if(status==""||status==undefined){
            $.messager.alert("系统提示", "<font color=red>请选择意见！！！</font>");
            return false;
        }
        if(status=="2"){
            var remark = $("#backup").val();
            if(remark==""||remark==undefined){
                $.messager.alert("系统提示", "<font color=red>请填写原因！</font>");
                return false;
            }
        }else{
            $("#backup").val("");
        }

        $.ajax({
            url: "company/changeCompanyStatus",
            data: $("#companyInfo").serialize(),
            type: "POST",
            success: function (result) {
                //console.log(result);
                if(result.flag=="200"){
                    $.messager.alert("系统提示", "<font color=green>用户： <span>"+companyEmail+"</span>  审核成功</font>");
                    closeDialog();
                    $('#dg4').datagrid('reload');
                }else {
                    $.messager.alert("系统提示", "<font color=red>用户：<span>"+companyEmail+"</span>审核失败，请重试！</font>");
                }
            }
        });
    }


    function printCompany() {//导出数据到excel
        var data=$('#dg4').datagrid('getData');
        if(data.total==0){
            $.messager.alert("系统提示", "<font color=red>暂无记录可导出！</font>");
            return false;
        }
       // $("#dg4").datagrid('toExcel','user.xls');
        var companyEmail = $('#companyEmail').val();
        var companyName=$('#companyName').val();
        var status = $('#status').combobox("getValue");
        // var url="status="+status;
        // if(number==""){
        //     number=null;
        // }
        var params = {companyEmail:companyEmail,companyName:companyName,status:status};
        var url="/company/getCompanyExcel";
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




    function closeDialog() {
        $('#ud').form('clear');
        $("#dlg").dialog("close");
    }







    function formatStatus(val,row) {
        var text;
        if(val==0){
            text="未审核";
        }else if (val==1) {
            text="通过";
        }else{
            text="不通过";
        }

        return text;
    }

    function createDo(val,row) {
        var id =row.companyEmail;
        var btn="<button class=\"easyui-linkbutton\"  data-options=\"iconCls:'icon-upload'\" onclick='showCompany(\"" +id + "\")' style=\"width:60px;margin-left: 10px\">审核</button>";
        return btn;
    }

    function showCompany(id) {
        $.ajax({
            url:"/company/searchInfoById",
            data:"companyEmail="+id,
            type:"GET",
            success:function (result) {
                if(result.flag=="200"){
                    openDialog();
                    emptyDiv();
                    showMessage(result.company);
                }else{
                    window.location.href = "login.jsp";
                    layer.msg("登录已超时，请重新登录！", {
                        time : 3000
                    });
                }


            }
        });


    }
    function showMessage(company) {
        $("#companyName1").append(company.companyName);
        $("#company_email").val(company.companyEmail);
        $("#userName1").append(company.userName);
        $("#phone1").append(company.phone);
        $("#address").append(company.provinces+company.city+company.address);
        $("#update_time").append(company.updateTime);
        $("#telephone1").append(company.telephone);
        $("#job_email").append(company.jobEmail);
        $("#company_property").append(company.companyProperty);
        $("#company_category").append(company.companyCategory);
        $("#scale").append(company.scale);
        $("#register_money").append(company.registerMoney);
        $("#introduction1").append(company.introduction);
        var status = company.status;
        var text;
        if(status==0){
            text="待审核";
        }else if(status==1){
            text="通过";
        }else {
            text="不通过";
            $("#showRemark").show();
            $("#backup").val(company.backup);
        }
        $("#status2").append(text);
        $("#logo1").attr("src",company.logo);
        $("#company_license").attr("src",company.companyLicense);

    }

    function emptyDiv() {
        $("#companyName1").empty();
        $("#company_email").val("");
        $("#userName1").empty();
        $("#phone1").empty();
        $("#address").empty();
        $("#update_time").empty();
        $("#telephone1").empty();
        $("#job_email").empty();
        $("#company_property").empty();
        $("#company_category").empty();
        $("#scale").empty();
        $("#register_money").empty();
        $("#introduction1").empty();
        $("#status2").empty();
        $("#backup").val("");
        $("#logo1").attr("src","");
        $("#company_license").attr("src","");
    }

    function checkStatus() {
        var status = $('#companyInfo input:radio:checked').val();
        if(status=="2"){
            $("#showRemark").show();
        }else{
            $("#showRemark").hide();
        }

    }
</script>
</body>
</html>
