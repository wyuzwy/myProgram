<%--
  Created by IntelliJ IDEA.
  User: zhangwenyu
  Date: 2019/11/24
  Time: 17:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false"%>
<%
    request.setCharacterEncoding("UTF-8");
    String htmlData = request.getParameter("content") != null ? request.getParameter("content") : "";
%>
<html>
<head>
    <title>查询公告</title>
    <link rel="icon" href="<%request.getContextPath();%>/static/favicon.ico" type="image/x-icon">
    <%--<script type="text/javascript" src="<%request.getContextPath();%>/static/js/jquery-1.12.4.min.js"></script>--%>
    <script type="text/javascript" src="login_style/js/jquery-1.8.2.min.js"></script>
    <link rel="stylesheet" type="text/css" href="easyui/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="easyui/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="easyui/demo/demo.css">
    <script type="text/javascript" src="easyui/jquery.min.js"></script>
    <script type="text/javascript" src="easyui/jquery.easyui.min.js"></script>
    <link rel="stylesheet" href="login_style/css/supersized.css">
    <link rel="stylesheet" href="login_style/css/login.css">
    <%--<link rel="stylesheet" href="static/kindeditor/themes/default/default.css" />--%>
    <%--<link rel="stylesheet" href="static/kindeditor/plugins/code/prettify.css" />--%>
    <%--<script charset="utf-8" src="static/kindeditor/plugins/code/prettify.js"></script>--%>
    <script charset="utf-8" src="static/kindeditor/kindeditor.js"></script>
    <%--<script charset="utf-8" src="static/kindeditor/lang/zh-CN.js"></script>--%>

    <script type="text/javascript" src="easyui/locale/easyui-lang-zh_CN.js"></script>
</head>
<body>

<table id="dg" title="公告信息" class="easyui-datagrid" fitColumns="true"
       pagination="true" rownumbers="true" url="news/searchByCondition" fit="true" toolbar="#tb" >
    <thead>
    <tr>
        <%--<th field="cb" checkbox="true"></th>--%>
        <th data-options="field:'title',width:100">标题</th>
        <th data-options="field:'sendName',width:50">发布者</th>
        <th data-options="field:'fileName',width:100">附件名称</th>
        <th data-options="field:'newsTime',width:80">发布时间</th>
        <th data-options="field:'click',width:30">点击量</th>
        <th data-options="field:'backup',width:30,formatter:showStatus">状态</th>
        <th data-options="field:'todo',width:30,formatter:createBtn">操作</th>
    </tr>
    </thead>
</table>
<div id="tb" align="center">
        <table style="margin-top: 10px">
            <tr>
                <%--<td>&nbsp;名称:&nbsp;</td>--%>
                <%--<td><input class="easyui-textbox" id="name1" name="name" size="10"></td>--%>
                <td>&nbsp;标题:&nbsp;</td>
                <td><input class="easyui-textbox" id="title1" name="title" size="10"></td>
                <td>&nbsp;状态:&nbsp;</td>
                <td><select class="easyui-combobox"   id="backup1" name="backup" editable="false" panelHeight="auto" style="width:100px"  size="60">
                    <option value="-1" selected>全部</option>
                    <option value="0">未发布</option>
                    <option value="1">已发布</option>
                </select></td>
                <td><button class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="submitForm()" style="width:80px;margin-left: 5px">搜索</button></td>
                <%--<td><button class="easyui-linkbutton" data-options="iconCls:'icon-print'" onclick="noticeDetails()" style="width:80px;margin-left: 5px">详情</button></td>--%>
                <%--<td><button class="easyui-linkbutton" data-options="iconCls:'icon-edit'" onclick="openDiv()" style="width:80px;margin-left: 5px">修改</button></td>--%>
                <%--<td><button class="easyui-linkbutton" data-options="iconCls:'icon-remove'" onclick="deleteNotice()" style="width:80px;margin-left: 5px">删除</button></td>--%>
            </tr>
        </table>
    <div style="margin-bottom:10px"></div>
</div>

<div id="dlg" class="easyui-dialog" style="width: 900px;height: 600px;padding: 10px 20px" data-options="modal:true"
     closed="true" buttons="#dlg-buttons" >
    <form id="news">
            <div style="margin-top: 5px;margin-left: 5px" hidden>
                公告ID: <input class="easyui-textbox" id="newsId" name="newsId" style="width:200px;height:20px;" readonly data-options="required:true">
            </div>
            <div style="margin-top: 5px;margin-left: 5px">
                公告标题： <input class="easyui-textbox" id="title" name="title" style="width:400px;height:20px;" data-options="required:true">
            </div>

            <div style="margin-top: 5px;margin-left: 5px">
                <textarea id="content" name="content" cols="70" rows="8" style="width:700px;height: 300px; visibility: hidden" ><%=htmlspecialchars(htmlData)%></textarea>
            </div>

            <div style="margin-top: 5px;margin-left: 5px">
                上传文件：<input type="file" id="file" name="file" onchange="uploadNewFile()" multiple="multiple" style="width:200px" />
            </div>
            <div style="margin-top: 5px;margin-left: 5px">
                文件路径：<input class="easyui-textbox" id="fileUrl" readonly name="fileUrl" style="width:400px;height:20px;"/>

            </div>
            <div style="margin-top: 5px;margin-left: 5px">
                文件名称：<input class="easyui-textbox" id="fileName" readonly name="fileName" style="width:400px;height:20px;"/>
            </div>
            <div style="margin-top: 5px;margin-left: 5px">
                是否发布:<select class="easyui-combobox"   id="backup" name="backup" editable="false" panelHeight="auto" style="width:100px"  size="60">
                <option value="0" selected>否</option>
                <option value="1">是</option>

            </select>
            </div>
            <%--<div style="margin-top: 5px;margin-left: 5px">--%>
            <%--备注：<input class="easyui-textbox" name="remark" style="width:200px;height:20px;" >--%>
            <%--</div>--%>
        <div  style="margin-top: 30px;margin-left: 38%">
            <a href="javascript:void(0)" class="easyui-linkbutton" onclick="updateNews()" iconCls="icon-ok">保存</a>
            <a href="javascript:void(0)" class="easyui-linkbutton" onclick="closeDialog()" iconCls="icon-cancel">关闭</a>
        </div>
    </form>
</div>
<%--<div id="dlg-buttons" style="margin-top: 30px;margin-left: 38%">--%>
    <%--<a href="javascript:void(0)" class="easyui-linkbutton" onclick="saveNotice()" iconCls="icon-ok">保存</a>--%>
    <%--<a href="javascript:void(0)" class="easyui-linkbutton" onclick="closeDialog()" iconCls="icon-cancel">关闭</a>--%>
<%--</div>--%>


<script>

    var articleDetailEditor;
    var ontent="textarea[name=\"content\"]";//定义富文本编辑框要加载到该id的textarea


    //提交表单(支持模糊查询)
    function submitForm(){
        var title=$("#tb").find("#title1").val();
        var backup = $("#backup1").combobox("getValue");
        if(title==""){
            title=null;
        }
        $('#dg').datagrid('load', {
            backup:backup,
            title:title
        });

    }




    //查看公告详情
    function noticeDetails() {
        var selectedRows = $("#dg").datagrid('getSelections');
        if (selectedRows.length != 1) {
            $.messager.alert("系统提示", "请选择一条要查看的数据！");
            return;
        }
        var id=selectedRows[0].id;
        window.open("http://localhost:8080/noticeDetailsById?id="+id,"_blank");


    }


    function createBtn(val,row) {
        var id = row.newsId;
        var btn="<button class=\"easyui-linkbutton\"  data-options=\"iconCls:'icon-upload'\" onclick='showNews(\"" +id + "\")' style=\"width:60px;margin-left: 10px\">编辑</button>";
        return btn;
    }

    function showStatus(val,row) {
        var text;
        if(val=="0"){
            text="未发布";
        }else {
            text="已发布";
        }
        return text;
    }

    function uploadNewFile() {
        var data = new FormData($("#news")[0]);
        // data.append('newFile',$("#addNews")[0]);
        $.ajax({
            url: "file/addNewsFile",
            type: "POST",
            data: data,
            cache: false,
            processData: false,
            contentType: false,
            success: function (result) {
                console.log(result);
                if (result.flag == "200") {
                    // $("#file").filebox("setValue","");
                    $("#fileUrl").textbox("setValue",result.url);
                    $("#fileName").textbox("setValue",result.name);
                    // $("#fileName").val(result.name);
                    // $("#fileUrl").val(result.url);
                    // submitForm();
                } else {
                    $("#fileUrl").textbox("setValue","");
                    $("#fileName").textbox("setValue","");
                    $.messager.alert("系统提示", "<font color=red>文件上传失败</font>");
                }
            }
        });
    }


    //关闭显示的div
    function closeDialog(){
        $("#dlg").dialog("close");
        //KindEditor.instances[0].html("");
        articleDetailEditor.remove(ontent);
        $('#news').form('clear');
        $("#dg").datagrid('reload');
    }

    //提交修改后的数据
    function updateNews(){
        articleDetailEditor.sync();//将富文本编辑框的内容同步到textarea文本框中
        var title=$("#example #title").val();
        if(title==""){
            $.messager.alert("系统提示", "<font color=red>请输入公告主题！！！</font>");
            return false;
        }
        var text= $("#content").val();
        if(text==""){
            $.messager.alert("系统提示", "<font color=red>请输入公告内容！！！</font>");
            return false;
        }
        $.ajax({
            url:"news/insertOrUpdate",
            data:$("#news").serialize(),
            type:"POST",
            success:function (result) {
                console.log(result);
                if(result.flag=="200"){
                    $.messager.alert("系统提示", "<font color=green>公告： <span>"+name+"</span>  修改成功</font>");
                    closeDialog();
                }else{
                    $.messager.alert("系统提示", "<font color=red>公告：<span>"+name+"</span>修改失败，请重试！</font>");
                }
            }
        });

    }

    function showNews(id) {
        $.ajax({
            url:"news/searchById",
            data:"newsId="+id,
            type:"GET",
            success:function (result) {
                console.log(result);
                if(result.flag=="200"){
                    $("#dlg").dialog("open").dialog("setTitle", "编辑公告信息");
                    $("#dlg").panel({
                        closable:false
                    });
                    ArticleeditorCreat(ontent);
                    articleDetailEditor.html(result.news.content);
                    $("#news").form("load", result.news);
                }else{
                    $.messager.alert("系统提示", "<font color=red>该公告不存在，请刷新后再试！！！</font>");
                    //closeDialog();
                }
            }
        })
    }


    //在隐藏的div初始化富文本编辑框
    function ArticleeditorCreat(kedit){
        articleDetailEditor = KindEditor.create(kedit,{
            readonlyMode : false,   //只读模式
            cssPath : 'static/kindeditor/plugins/code/prettify.css',
            uploadJson : 'static/kindeditor/jsp/upload_json.jsp',
            fileManagerJson : 'static/kindeditor/jsp/file_manager_json.jsp',
            allowFileManager : true,
            afterCreate : function() {
                this.sync();  //同步
            },
            afterBlur:function(){
                this.sync();
            },
        });
    }
// function creatK(ontent) {
//     KindEditor.ready(function (K) {
//         editor1 = K.create(ontent, {
//             cssPath: 'kindeditor/plugins/code/prettify.css',
//             uploadJson: 'kindeditor/jsp/upload_json.jsp',
//             fileManagerJson: 'kindeditor/jsp/file_manager_json.jsp',
//             allowFileManager: true,
//             afterCreate: function () {
//                 var self = this;
//                 K.ctrl(document, 13, function () {
//                     self.sync();
//                     document.forms['example'].submit();
//                 });
//                 K.ctrl(self.edit.doc, 13, function () {
//                     self.sync();
//                     document.forms['example'].submit();
//                 });
//             }
//         });
//         prettyPrint();
//     });

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