<%--
  Created by IntelliJ IDEA.
  User: zhangwenyu
  Date: 2019/11/24
  Time: 17:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>文件下载</title>
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
</head>
<body>
<table id="dg4" title="岗位评论" class="easyui-datagrid" fitColumns="true"
       pagination="true" rownumbers="true" url="job/searchListComment" fit="true" toolbar="#tb">
    <thead>
    <tr>
        <th data-options="field:'sendId',width:100">评论人ID</th>
        <th data-options="field:'sendName',width:70">评论人</th>
        <th data-options="field:'commentText',width:280">内容</th>
        <th data-options="field:'createTime',width:100">评论时间</th>
        <th data-options="field:'remark',width:50,formatter:createDo">操作</th>
    </tr>
    </thead>
</table>
<div id="tb" align="center" >
    <table style="margin-top: 10px">
        <tr>
            <td>&nbsp;评论人:&nbsp;</td>
            <td><input class="easyui-textbox"id="sendName" name="sendName" size="15"/></td>
            <td>&nbsp;内容:&nbsp;</td>
            <td><input class="easyui-textbox"id="commentText" name="commentText" size="30"/></td>
            <td><button class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="searchComment()"   style="width:80px;margin-left: 5px">查询</button></td>
        </tr>
    </table>
</div>

<script type="text/javascript">

    function deleteComment(id) {
        $.messager.confirm("系统提示", "您确认要删掉这条评论吗？", function (r) {
            if(r) {
                $.ajax({
                    url: "job/delComment",
                    data: "commentId=" + id,
                    type: "GET",
                    success: function (result) {
                        if (result.flag == "200") {
                            $.messager.alert("系统提示", "删除成功");
                            $('#dg4').datagrid('reload');
                        } else {
                            $.messager.alert("系统提示", "操作失败，请重试！");
                        }
                    }
                });
            }
        });
    }

    function createDo(val,row) {
        var id = row.commentId;
        var btn="<button class=\"easyui-linkbutton\"  data-options=\"iconCls:'icon-upload'\" onclick='deleteComment(\"" +id + "\")' style=\"width:60px;margin-left: 10px\">删除</button>";
        return btn;
    }

    function searchComment() {
        var sendName = $("#sendName").val();
        var commentText=$("#commentText").val();
        if(sendName==''||sendName==""){
            sendName=null;
        }
        if(commentText==''||commentText==""){
            commentText=null;
        }
        $("#dg4").datagrid('load', {
            sendName:sendName,
            commentText:commentText
        });
    }

</script>
</body>
</html>
