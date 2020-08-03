<%--
  Created by IntelliJ IDEA.
  User: zhangwenyu
  Date: 2019/8/5
  Time: 22:26
  To change this template use File | Settings | File Templates.
--%>
<%
    request.setCharacterEncoding("utf-8");
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!doctype html>
<html>
<head>
    <title>宣讲会</title>
    <base href="<%=basePath%>">
    <link rel="icon" href="<%request.getContextPath();%>/static/favicon.ico" type="image/x-icon">
    <script type="text/javascript" src="<%request.getContextPath();%>/static/js/jquery-1.12.4.min.js"></script>
    <link href="<%request.getContextPath();%>/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="<%request.getContextPath();%>/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
    <link rel='stylesheet' href="<%request.getContextPath();%>/static/time/my.css" />


</head>
<body>

<header>
    <nav class="navbar navbar-default " role="navigation">
        <div class="navbar container-fluid navbar-default  navbar-fixed-top">
            <div class="navbar-header">
                <h4 class="logo navbar-text "><a href="#" title="">毕业生信息平台</a></h4>
            </div>

            <div id="login-info">
                <c:choose>
                    <c:when test="${not empty sessionScope.get('currentUser')}">
                        <ul class="nav navbar-nav navbar-right">
                            <li title="个人中心"><a href="<%request.getContextPath();%>/returnToMyInfo"><span
                                    class="glyphicon glyphicon-user"></span>${currentUser.id}</a>
                            </li>
                            <li title="退出"><a href="<%request.getContextPath();%>/exit"><span class="glyphicon glyphicon-log-in"></span>退出</a></li>
                        </ul>
                    </c:when>
                    <c:otherwise>
                        <ul class="nav navbar-nav navbar-right">
                            <li title="企业注册"><a href="register.jsp"><span class="glyphicon glyphicon-user"></span> 企业注册</a>
                            </li>
                            <li title="登录"><a href="login.jsp"><span class="glyphicon glyphicon-log-in"></span> 登录</a>
                            </li>
                        </ul>
                    </c:otherwise>
                </c:choose>
            </div>


            <div class="navbar-collapse collapse" style="text-align: center">
                <ul class="nav navbar-nav nav-pills" style="display: inline-block;float: none">
                    <li title="首页"><a href="#">首页</a></li>
                    <li title="宣讲会" class="active"><a>宣讲会</a></li>
                    <li title="在线招聘"><a href="job.jsp">在线招聘</a></li>
                    <li title="公告栏"><a href="bulletin.jsp">公告栏</a></li>
                </ul>
            </div>
        </div>
    </nav>
</header>
<section class="panel panel-default container">
    <div class="row">

        <div class="col-md-3">
            <ul class="clearfix">
                <h3>全部宣讲会</h3>
                <li style="display:block">
                    <a class="list-group-item active" title="查询宣讲会" >查询宣讲会</a>
                </li>
            </ul>
            <ul class="clearfix">
                <li style="display:block">
                    <div id="calendar" class="calendar"></div>
                    <script  type="text/javascript" src="<%request.getContextPath();%>/static/time/can.js"></script>
                </li>
            </ul>
        </div>

        <div class="col-md-9">
            <div>
                <h3>宣讲会</h3>
            </div>

            <div class="panel panel-default">
                <div class="container-fluid ">
                    <div style="margin: 20px">

                        <form class=" form-inline"  id="form-search">
                            <span>&nbsp &nbsp &nbsp &nbsp &nbsp </span>
                            <input type="text" class="form-control" placeholder="请输入企业名称" name="companyName"
                                   id="companyName" >
                            <span>&nbsp &nbsp </span>
                            <span> &nbsp </span>
                            <a id="search_btn" onclick="searchBy()" class="btn btn-info">搜索</a>
                            <span id="test"></span>
                        </form>

                        <div class="panel panel-default">
                            <ul class="list-group" id="preach">

                            </ul>
                        </div>
                        <div class="row">
                            <div class="col-md-6" id="page_info_area" >
                            </div>
                            <div class="col-md-6" id="page_nav_area">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>




<script type="text/javascript">

    $(function () {
        selectByCondition(1);
    });

    //搜索按钮查找资源
    function selectByCondition (page) {
        var companyName = $("#companyName").val();
        var data = "status=1&rows=5&page=" + page;
        if(companyName!=""&&companyName!=null){
            data+="&companyName=" + companyName;
        }
        $.ajax({
            url: "<%request.getContextPath();%>/preach/selectByCondition",
            // data: "companyName=" + companyName + "&status=1&rows=8&page=" + page,
            data:data,
            type: "GET",
            success: function (result) {
                console.log(result);
                $("#test").empty();
                $("#preach").empty();
                $("#page_info_area").empty();
                $("#page_nav_area").empty();
                if (result.flag == "200") {//查询成功
                    //alert("111");

                    build_Resource_table(result);
                    build_page_info(result);
                    build_page_nav(result);
                    // $("#test").append("共" + result.extend.tipes + "条记录！")
                } else {

                    var div=$("<div style='color: grey' align='center'></div>").append("暂无记录");
                    div.appendTo("#preach");
                }

            }

        })
    }


    function searchBy() {
        selectByCondition(1);
    }


    //解析宣讲会数据
    function build_Resource_table(result){
        $("#preach").empty();
        var preach = result.pageInfo.list;
        $.each(preach, function (index, res) {
            var div = $("<div style=\"margin-left: 10px;height: 80px\"></div>").addClass("list-group-item");
            var data = res.startTime.split("-");
            var month = data[1] + "月</br>";
            var data2 = data[2].split(" ");
            var day = data2[0];
            var time = data2[1];
            var divDay = $("<div style=\"border:1px solid #eee;width:10%;float:left;height:60px;line-height:30px;text-align:center;font-size: 20px;color: orangered\"></div>").append(month + day + "日");
            var divData = $("<div style=\"width:90%;float:left;\"></div>");
            var divD1 = $("<div style=\"width: 100%\"></div>");
            var divD11 = $("<a href=\'<%request.getContextPath();%>preachDetails.jsp?id=" + res.preachId + "\' style=\"font-size: 20px;padding-left: 20px;padding-top: 5px; width: 85%;float: left\"></a>").append(res.companyName + "宣讲会");
            var divD12 = $("<div style=\"font-size: 15px; width: 15%;float: right;\"></div>");
            var divD121 = $("<span style=\"color: firebrick\"></span>").addClass("glyphicon glyphicon-time").append(time);
            divD12.append(divD121);
            divD1.append(divD11).append(divD12);
            var divD2 = $("<div style=\"width: 100%\"></div>");
            var divD21 = $("<div style=\"font-size: 15px;padding-left: 20px;padding-top: 5px; width: 85%;float: left;color: #6a6a6a\"></div>");
            var divD211 = $("<span></span>").addClass("glyphicon glyphicon-map-marker").append(res.school + res.address);
            var divD22 = $("<div style=\"font-size: 15px; width: 15%;float: right;\"></div>");
            var divD221 = $("<span style=\"color: #6a6a6a\"></span>").addClass("glyphicon glyphicon-eye-open").append(res.click);
            divD21.append(divD211);
            divD22.append(divD221);
            divD2.append(divD21).append(divD22);
            divData.append(divD1).append(divD2);
            div.append(divDay).append(divData);
            div.appendTo("#preach");
        });

    }





    function build_page_info(result){
        $("#page_info_area").empty();
        $("#page_info_area").append("当前 "+result.pageInfo.pageNum+" 页,总 "+
            result.pageInfo.pages+" 页,共 "+
            result.pageInfo.total+" 条记录");
        // totalRecord = result.pageInfo.total;
        // currentPage = result.pageInfo.pageNum;
    }
    //解析显示分页条，点击分页要能去下一页....
    function build_page_nav(result){
        //page_nav_area
        $("#page_nav_area").empty();
        var ul = $("<ul></ul>").addClass("pagination");

        //构建元素
        var firstPageLi = $("<li></li>").append($("<a></a>").append("首页"));
        var prePageLi = $("<li></li>").append($("<a></a>").append("&laquo;"));
        if(result.pageInfo.hasPreviousPage == false){
            firstPageLi.addClass("disabled");
            prePageLi.addClass("disabled");
        }else{
            //为元素添加点击翻页的事件
            firstPageLi.click(function(){
                selectByCondition(1);
            });
            prePageLi.click(function(){
                selectByCondition(result.pageInfo.pageNum -1);
            });
        }



        var nextPageLi = $("<li></li>").append($("<a></a>").append("&raquo;"));
        var lastPageLi = $("<li></li>").append($("<a></a>").append("末页"));
        if(result.pageInfo.hasNextPage == false){
            nextPageLi.addClass("disabled");
            lastPageLi.addClass("disabled");
        }else{
            nextPageLi.click(function(){
                selectByCondition(result.pageInfo.pageNum +1);
            });
            lastPageLi.click(function(){
                selectByCondition(result.pageInfo.pages);
            });
        }



        //添加首页和前一页 的提示
        ul.append(firstPageLi).append(prePageLi);
        //1,2，3遍历给ul中添加页码提示
        $.each(result.pageInfo.navigatepageNums,function(index,item){

            var numLi = $("<li></li>").append($("<a></a>").append(item));
            if(result.pageInfo.pageNum == item){
                numLi.addClass("active");
            }
            numLi.click(function(){
                selectByCondition(item);
            });
            ul.append(numLi);
        });
        //添加下一页和末页 的提示
        ul.append(nextPageLi).append(lastPageLi);

        //把ul加入到nav
        var navEle = $("<nav></nav>").append(ul);
        navEle.appendTo("#page_nav_area");
    }











</script>

</body>
</html>
