<%--
  Created by IntelliJ IDEA.
  User: zhangwenyu
  Date: 2019/11/24
  Time: 17:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setCharacterEncoding("UTF-8");
    String htmlData = request.getParameter("content") != null ? request.getParameter("content") : "";
%>
<html>
<head>
    <title>添加公告</title>
    <link rel="icon" href="<%request.getContextPath();%>/static/favicon.ico" type="image/x-icon">
    <script type="text/javascript" src="<%request.getContextPath();%>/static/js/jquery-1.12.4.min.js"></script>
    <link rel="stylesheet" type="text/css" href="easyui/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="easyui/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="easyui/demo/demo.css">
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
</head>
<body style="background: white">
<div class="easyui-panel" title="添加公告" style=" border: none">
    <form id="addNews"  method="post" target="hidden_frame">
        <div hidden>
            <input type="text" id="sendName" name="sendName">
        </div>

        <div style="margin-top: 5px;margin-left: 5px">
            公告标题： <input class="easyui-textbox" id="title" name="title" style="width:400px;height:20px;" data-options="required:true">
        </div>

        <div style="margin-top: 5px;margin-left: 5px">
            <textarea id="content" name="content" cols="70" rows="8" style="width:700px;height: 380px; visibility: hidden" ><%=htmlspecialchars(htmlData)%></textarea>
        </div>
        <%--<div style="margin-top: 5px;margin-left: 5px">--%>
            <%--备注：<input class="easyui-textbox" name="remark" style="width:200px;height:20px;" >--%>
        <%--</div>--%>
        <div style="margin-top: 5px;margin-left: 5px">
            相关文件：<input type="file" id="file" name="file" onchange="uploadNewFile()" multiple="multiple" style="width:200px" />
            <input type="text" id="fileUrl"  name="fileUrl" hidden />
            <input type="text" id="fileName"  name="fileName" hidden/>
        </div>
        <div style="margin-top: 5px;margin-left: 5px">
            是否发布:<select class="easyui-combobox"   id="backup" name="backup" editable="false" panelHeight="auto" style="width:100px"  size="60">
            <option value="0" selected>否</option>
            <option value="1">是</option>

        </select>
        </div>
        <div style="margin-top: 20px;margin-left: 38%">
            <%--<button type="submit" id="addNoti" class="easyui-linkbutton" data-options="iconCls:'icon-add'"  style="width:80px">确定</button>--%>
            <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-add'" onclick="submitForm()" style="width:80px">确定</a>
            <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-reload'" onclick="clearForm()" style="width:80px">重置</a>
        </div>

    </form>
    <%--<iframe name='hidden_frame' id="hidden_frame" style='display: none'></iframe>--%>

</div>
<script type="text/javascript">
    var editor1;
    var name="${sessionScope.user.userDept}";
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

    // $('#hidden_frame').load(function(){
    //     var text=$(this).contents().find("flag").text();
    //     // 根据后台返回值处理结果
    //
    //     if(text==100) {
    //         $.messager.alert("系统提示", "<font color=green>公告： <span>"+name+"</span>  添加成功</font>");
    //     } else {
    //         $.messager.alert("系统提示", "<font color=red>公告：<span>"+name+"</span>添加失败，请重试！</font>");
    //     }
    // });


    $(function () {
        // $('#file').filebox({
        //     buttonText: '选择文件'
        // });
    });

    function submitForm(){

        $("#sendName").val(name);

        var title = $("#title").val();
        if(title==""){
            $.messager.alert("系统提示", "<font color=red>请输入公告标题！！！</font>");
            return false;
        }
        editor1.sync();

        var text= $("#content").val();
        if(text==""){
            $.messager.alert("系统提示", "<font color=red>请输入公告内容！！！</font>");
            return false;
        }

        $.ajax({
            url:"news/insertOrUpdate",
            data:$("#addNews").serialize(),
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

        // $('#addNotices').form('submit');

    }
    function clearForm(){
         $('#addNews').form('clear');
        KindEditor.instances[0].html("");
    }


    function uploadNewFile() {
        // var id = $("#addNews");
        // var files =id.prop('files');
        // var data=new FormData();
        // data.append('newFile',files[0]);
        var data = new FormData($("#addNews")[0]);
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
                    $("#fileName").val(result.name);
                    $("#fileUrl").val(result.url);
                    // submitForm();
                } else {
                    $("#fileName").val("");
                    $("#fileUrl").val("");
                    $.messager.alert("系统提示", "<font color=red>文件上传失败</font>");
                }
            }
        });
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