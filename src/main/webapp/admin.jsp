<%--
  Created by IntelliJ IDEA.
  User: zhangwenyu
  Date: 2019/11/23
  Time: 9:33
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
    <title>毕业生信息管理平台-后台</title>
    <%--<base href="<%=basePath%>">--%>
    <link rel="icon" href="<%request.getContextPath();%>/static/favicon.ico" type="image/x-icon">
    <link rel="stylesheet" type="text/css" href="easyui/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="easyui/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="easyui/demo/demo.css">
    <script type="text/javascript" src="easyui/jquery.min.js"></script>
    <script type="text/javascript" src="easyui/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/echarts/dist/echarts.min.js"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/echarts-gl/dist/echarts-gl.min.js"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/echarts-stat/dist/ecStat.min.js"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/echarts/dist/extension/dataTool.min.js"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/echarts/map/js/china.js"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/echarts/map/js/world.js"></script>
    <%--<script type="text/javascript" src="https://api.map.baidu.com/api?v=2.0&ak=xfhhaTThl11qYVrqLZii6w8qE5ggnhrY&__ec_v__=20190126"></script>--%>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/echarts/dist/extension/bmap.min.js"></script>
    <style type="text/css">
        /**{*/
            /*padding:0px;*/
            /*margin:0px;*/
            /*font-size:12px;*/
        /*}*/
        #north{
            background-image:  url('login_style/img/topbg.gif');
            height:80px;
            overflow:hidden;

        }
    </style>
</head>


<body class="easyui-layout" style="width:100%;height:100%;">
    <div data-options="region:'north'" id="north" >
        <div style="position: relative;padding:0px;margin:0px;font-size:12px;">
            <%--<img alt="找不到图片" src="login_style/img/top_logo.png">--%>
            <div>
            <font color="white" size="7">毕业生信息管理平台</font>
            </div>
            <table style="position:absolute;right:35px;top:15px;">
                <tr>
                    <td style="width:25px"><img  src="login_style/img/top_home.gif">
                    </td>
                    <td style="width:120px"><a href="" style="color: #FFFFFF; text-decoration:none">首页</a>
                    </td>
                    <td style="width:25px"> <img  src="login_style/img/top_exit.gif">
                    </td>
                    <td style="width:120px">
                        <a href="<%request.getContextPath();%>/exit" style="color:#FFFFFF; text-decoration:none">退出登录</a>
                    </td>
                </tr>
            </table>
            <div style="position: absolute;background-image:url('login_style/img/StatBarBg.png');
     left:400px;top:47px;width:100%;height:33px;background-size:100%;">
                <div style="width:100%">
                    <table style="margin-left:50px;margin-top:7px">
                        <tr>
                            <td style="width:25px"><img  src="login_style/img/StatBar_admin.gif"></td>
                            <td style="width:180px">当前用户：<span>${sessionScope.user.userName}</span> </td>
                            <td style="width:115px"></td>
                            <td style="width:25px"><img  src="login_style/img/role.png"></td>
                            <td style="width:180px">用户单位：<span>${sessionScope.user.userDept}</span></td>
                            <td style="width:150px"></td>
                            <td style="width:25px" ><img  src="login_style/img/StatBar_time.gif"></td>
                            <td style="width:300px"><p id="time"></p ></td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>

        <%--<div style=" float: right;padding-right: 20px;">--%>
            <%--<div>当前时间：<span style="color: blue" id="time"></span></div>--%>
            <%--<div id="time">当前时间：</div>--%>

            <%--<div style="padding-top: 30px" align="right">--%>
                <%--<font color="red">${currentUser.userId }</font>--%>
                <%--,欢迎您！--%>
                <%--<a href="javascript:(0)" style="background-color: white" onclick="exit()"><font--%>
                        <%--color="#0E2D5F">注销</font></a>--%>
            <%--</div>--%>
        <%--</div>--%>
    </div>
    <div data-options="region:'south'"  style="height:1px;">
        <%--<p style="text-align: center">@五邑大学160803班 张文宇</p>--%>
    </div>
    <div data-options="region:'east'" title="系统说明" style="width:100px;"></div>
    <div data-options="region:'west'" title="毕业生信息管理" style="width:150px;">
        <div class="easyui-accordion" style="width:99%;height:100%;border: none" data-options="selected:false">
            <div title="用户管理" data-options="iconCls:'icon-groupadd'" style="overflow:auto;padding:0px;">
                <a  style="width:145px;" id="afterCompany"  class="easyui-linkbutton" data-options="iconCls:'icon-search'" name="用户查询"  >企业审核</a>
                <a style="width:145px;" id="afterUser"  class="easyui-linkbutton" name="用户审核" data-options="iconCls:'icon-groupadd'">用户审核</a>
            </div>
            <div title="学生管理" data-options="iconCls:'icon-man'" style="overflow:auto;padding:0px;">
                <a  style="width:145px;" id="searchStudentInfo" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" name="生源信息"  >生源信息</a>
                <a style="width:145px;" id="searchStudentJob" href="#" class="easyui-linkbutton" name="就业信息" data-options="iconCls:'icon-add'">就业信息</a>
            </div>
            <div title="宣讲管理" data-options="iconCls:'icon-edit'" style="padding:0px;">
                <a  style="width:145px;" id="searchPreach" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" name="宣讲查询"  >宣讲查询</a>
                <a style="width:145px;" id="addPreach" href="#" class="easyui-linkbutton" name="添加部门" data-options="iconCls:'icon-add'">添加宣讲</a>
            </div>
            <div title="在线招聘" data-options="iconCls:'icon-remove'" style="padding:10px 0;">
                <a  style="width:145px;" id="searchJob" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" name="职位查询"  >职位查询</a>
                <a style="width:145px;" id="addJob" href="#" class="easyui-linkbutton" name="添加职位" data-options="iconCls:'icon-add'">添加职位</a>
            </div>
            <div title="公告管理" data-options="iconCls:'icon-ok'" style="padding:10px 0;">
                <a  style="width:145px;" id="searchNews" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" name="公告查询"  >公告查询</a>
                <a style="width:145px;" id="addNews" href="#" class="easyui-linkbutton" name="添加公告" data-options="iconCls:'icon-add'">添加公告</a>
            </div>
            <div title="评论管理" data-options="iconCls:'icon-print'" style="padding:10px 0;">
                <a  style="width:145px;" id="searchPreachCom" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-fileDL'" name="宣讲评论"  >宣讲评论</a>
                <a  style="width:145px;" id="searchJobCom" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-fileDL'" name="岗位评论"  >岗位评论</a>
                <%--<a  style="width:145px;" id="addFile" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-upload'" name="文件上传"  >文件上传</a>--%>
            </div>
            <%--<div title="个人中心" data-options="iconCls:'icon-user'" style="padding:10px 0;">--%>
                <%--<a  style="width:145px;" id="userInfo" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-man'" name="个人信息"  >个人信息</a>--%>
                <%--<a  style="width:145px;" id="uploadPw" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-edit'" name="修改密码"  >修改密码</a>--%>
            <%--</div>--%>
        </div>
    </div>
    <div data-options="region:'center'"  >
        <div class="easyui-tabs" fit="true" border="false" id="usertab">
            <div title="首页">
                <div style="width: 100%;height: 100px;">
                <div align="center" style="padding-top: 10px;width: 50%;float: left"><font color="red" size="8">欢迎使用</br>毕业生信息管理平台</font></div>
                <div align="center" id="container2" style="padding-top: 3px;width: 50%;float:right;height: 150px">

                </div>
                </div>
                <div id="container" style="padding-top: 50px;height: 420px;width: 100%;">

                </div>
            </div>
        </div>
    </div>
</body>
<script type="text/javascript">
    setInterval("time.innerHTML=new Date().toLocaleString('chinese', { hour12: false })+' 星期'+'日一二三四五六'.charAt(new Date().getDay());", 1000);
    $(function() {
        loginMsg();
        $("#afterCompany").click(function(){
            <%--var role="${sessionScope.user.role}";--%>
            <%--if(role!="1"){--%>
                <%--$.messager.alert("系统提示", "<font color=red>您非超级管理员，暂无此操作权限！！！</font>");--%>
                <%--return ;--%>
            <%--}--%>
            addTab("#usertab","企业审核","icon-zoom","afterCompany.jsp");
        });
        $("#afterUser").click(function(){
            <%--var role="${sessionScope.user.role}";--%>
            <%--if(role!="1"){--%>
                <%--$.messager.alert("系统提示", "<font color=red>您非超级管理员，暂无此操作权限！！！</font>");--%>
                <%--return ;--%>
            <%--}--%>
            addTab("#usertab","用户审核","icon-groupadd","afterUser.jsp");
        });
        $("#searchPreach").click(function(){
            addTab("#usertab","宣讲查询","icon-zoom","searchPreach.jsp");
        });
        $("#addPreach").click(function(){
            addTab("#usertab","添加宣讲会","icon-groupadd","addPreach.jsp");
        });
        $("#searchJob").click(function(){
            addTab("#usertab","职位查询","icon-zoom","searchJob.jsp");
        });
        $("#addJob").click(function(){
            addTab("#usertab","添加职位","icon-groupadd","addJob.jsp");
        });
        $("#searchStudentInfo").click(function(){
            addTab("#usertab","生源信息","icon-zoom","searchStudentInfo.jsp");
        });
        $("#searchStudentJob").click(function(){
            addTab("#usertab","就业信息","icon-groupadd","searchStudentJob.jsp");
        });
        $("#searchNews").click(function(){
            addTab("#usertab","公告查询","icon-print","searchNews.jsp");
        });
        $("#addNews").click(function(){
            addTab("#usertab","添加公告","icon-groupadd","addNews.jsp");
        });
        $("#searchPreachCom").click(function(){
            addTab("#usertab","宣讲评论","icon-fileDL","searchPreachCom.jsp");
        });
        $("#searchJobCom").click(function(){
            addTab("#usertab","岗位评论","icon-upload","searchJobCom.jsp");
        });
        $("#userInfo").click(function(){
            addTab("#usertab","个人信息","icon-man","userInfo.jsp");
        });
        $("#uploadPw").click(function(){
            addTab("#usertab","修改密码","icon-man","uploadPw.jsp");
        });

        index();
    });

    function index() {
        $.ajax({
            url:"/emp/showPic",
            data:"year=2016",
            type:"get",
            success:function (result) {
                console.log(result);
                if(result.flag=="200"){
                    showSchool(result.map);
                    showCollege(result.list);
                }
            }

        });
    }


    function showCollege(result) {


        var data= [];
        var dataPro = ['product', '总人数', '已就业人数','就业率'];
        data.push(dataPro);
        var line = [];
        $.each(result,function (index,item) {
            var data2 = [];
            data2.push(item.deptName);
            data2.push(item.total);
            data2.push(item.now);
            var pre =(item.now/item.total);
            line.push(pre);
            data.push(data2);
        });
        console.log(data);
        var dom = document.getElementById("container");
        var myChart = echarts.init(dom);
        var app = {};
        option = null;
        option = {
            title : {
                show: true,//显示策略，默认值true,可选为：true（显示） | false（隐藏）
                text: '各学院就业情况',//主标题文本，'\n'指定换行
                x:'center',//水平安放位置，默认为'left'，可选为：'center' | 'left' | 'right' | {number}（x坐标，单位px）
                y: 'bottom'//垂直安放位置，默认为top，可选为：'top' | 'bottom' | 'center' | {number}（y坐标，单位px）
                // textStyle: {//主标题文本样式{"fontSize": 18,"fontWeight": "bolder","color": "#333"}
                //     fontFamily: 'Arial, Verdana, sans...',
                //     fontSize: 18,
                //     fontStyle: 'normal',
                //     fontWeight: 'bolder',
                //     color: "red"
                // }
            },
            legend: {
            },
            tooltip: {},
            dataset: {
                 source: data

                     //[
                //     ['product', '总人数', '就业人数'],
                //     ['Matcha Latte', 43.3, 85.8, 93.7],
                //     ['Milk Tea', 83.1, 73.4, 55.1],
                //     ['Cheese Cocoa', 86.4, 65.2, 82.5],
                //     ['Walnut Brownie', 72.4, 53.9, 39.1]
                // ]
            },
            xAxis: {type: 'category',
                axisLabel: {interval:0,rotate:30 }
            },
            yAxis: {},
            grid: {
                left: '2%',
                right: '2%',
                bottom: '10%',
                containLabel: true
            },
            // Declare several bar series, each will be mapped
            // to a column of dataset.source by default.
            series: [
                {
                    type: 'bar',
                    barWidth: 30
                },
                {type: 'bar',
                    barWidth: 30},
                {
                    name: '就业率',
                    type: 'line',
                    symbol: 'square',   //将折线原点改为方块
                    symbolSize: 6,     //拐点大小
                    // itemStyle: {
                    //     normal: {
                    //         color: function (params) {     //单独设置每一个折点颜色
                    //             var colorList = ['rgb(255,255,255)', 'rgb(255,255,255)', 'rgb(255,255,255)', 'rgb(255,255,255)', 'rgb(255,255,255)', 'rgb(255,255,255)', '#e1c8a4'];
                    //             return colorList[params.dataIndex];
                    //         },       //折点颜色
                    //         lineStyle: {
                    //             color: 'rgba(255,255,255,0.7)',    //折线颜色
                    //         }
                    //     }
                    // },
                    data: line
                    //data:[40,50,60,70,50,90,80]
                }
            ]
        };







        if (option && typeof option === "object") {
            myChart.setOption(option, true);
        }


    }



    function showSchool(result) {

        var dom = document.getElementById("container2");
        var myChart = echarts.init(dom);
        var app = {};
        var yes = result.yes;
        var def = result.total-yes;
        option = null;
        option = {
            title: {
                text: '全校就业情况',
                left: 'center',
                x:'center',//水平安放位置，默认为'left'，可选为：'center' | 'left' | 'right' | {number}（x坐标，单位px）
                y: 'top'
            },
            tooltip: {
                trigger: 'item',
                formatter: '{a} <br/>{b} : {c} 人 ({d}%)'
            },
            legend: {
                orient: 'vertical',
                left: 'left',
                data: ['已就业', '未就业']
            },

            series: [
                {
                    name: '就业情况',
                    type: 'pie',
                    radius: '55%',
                    center: ['50%', '65%'],
                    data: [
                        {value: yes, name: '已就业'},
                        {value: def, name: '未就业'}

                    ],
                    emphasis: {
                        itemStyle: {
                            shadowBlur: 10,
                            shadowOffsetX: 0,
                            shadowColor: 'rgba(0, 0, 0, 0.5)'
                        }
                    }
                }
            ]
        };

        if (option && typeof option === "object") {
            myChart.setOption(option, true);
        }


    }





    function addTab(id, info, icon, url){
        var res = $(id).tabs("exists", info);

        if(res) {
            $(id).tabs("select", info);
        }else{
            var content = '<iframe scrolling="auto" frameborder="0" src="'+ url + '"style="width:100%;height:100%;"></iframe>';
            $(id).tabs("add", {
                "iconCls" : icon,
                "title" : info,
                content : content,
                "closable" : "true"
            });
        }
    }


    function loginMsg() {
        var title='上线通知';
        var sayHello='<div style="width:270px;height:120px"><div style="margin-bottom:5px">尊敬的<font size="4" color="green">${sessionScope.user.userName}</font></div>';

        var hour=new Date().getHours();
        if(6<=hour&&hour<=12){
            sayHello+='<div style="text-indent:2em;">早上好！</div>' +
                '<div style="text-indent:2em;">一次次被吵醒，一次次的坚强站立，一次次的松懒躺下，不在起床中挺立，就在起床中趴下！为了祖国的明天，祝你克服一切阻力，睁开合拢的双眼，原来又是美好的一天！</div></div>';
        }else if(12<hour&&hour<=19){
            sayHello+='<div style="text-indent:2em;">下午好！</div>' +
                '<div style="text-indent:2em;">阳光，洒落点点滴滴的碎金，恰巧你捡到了；清风，催开一路的百花，恰巧你也笑了；问候，挑了一肩永恒的情谊，恰巧与你遇见了。愿你的生活，无比美好。</div></div>';
        }else{
            sayHello+='<div style="width:200px;text-indent:2em;">晚上好！</div>' +
                '<div style="text-indent:2em;">夜深人静，风清气爽，美好的世界缠绵着梦想，道生晚安，挂念不断，愿温柔的臂弯守候在你的身边，短信声声，祝福连连，愿你今夜开心入眠，晚安!</div></div>';
        }
        var msg=sayHello;
        var time='60000';
        var width=300;
        var height=210;
        showMessage(title,msg,time,width,height);
    }


    function showMessage(title,msg,time,width,height) {
        // '您有' + '<font size="4" color="red">' + 5 + '</font>' + '张表单需要审批！<br>点击确认立即审批      <a  href="javascript:void(0);" onclick="getPage()">确认</a>',
        $.messager.show({
            title:title,
            width:width,
            height:height,
            msg:msg,
            timeout: time,
            showType: 'slide'
        });
    }
    // $(".messager-body").window('close');style="color:blue;size:3"
</script>


</html>
