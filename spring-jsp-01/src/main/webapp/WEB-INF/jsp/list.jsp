<%--
  Created by IntelliJ IDEA.
  User: qld
  Date: 2020/12/14
  Time: 10:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>会员登录</title>
    <link rel="stylesheet" href="/css/bootstrap.min.css" type="text/css">
    <script src="/js/jquery-1.11.3.min.js" type="text/javascript"></script>
    <script src="/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="/js/jquery.cookie.js" type="text/javascript"></script>
    <!-- 引入自定义css文件 style.css -->
    <link rel="stylesheet" href="/css/style.css" type="text/css">

    <style>
        body {
            margin-top: 20px;
            margin: 0 auto;
            width: 100%;
        }

        .carousel-inner .item img {
            width: 100%;
            height: 300px;
        }
    </style>
    <script type="text/javascript">
        function init(){

        }
    </script>
</head>

<body onload="init()" >
<!--
        描述：导航条
    -->

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script type="text/javascript">
    //页面加载完成后，就需要去异步请求 分类数据
    $(function() {
        //异步请求代码
        $.post("/store/category", { methodName: "searchAll" }, function(data) {
            //[{cname:xxx},{cname:xxx}]
            //data是JS对象 转成jQuery对象然后 遍历取出 (each)
            $(data).each(function(index, dom) { //index是索引一般不用,dom是遍历出来的元素
                //dom  ----> js   {cid:xxx,cname:xxx}
                var cname = dom["cname"]; //手机数码、电脑办公    dom["cname"] ==> dom.cname
                var cid = dom["cid"];
                var temp = "<li><a href='/store/product?methodName=searchAllByCid&currPage=1&cid=" + cid + "'>" + cname + "</a></li>";
                $("#clist").append(temp);
            });

        }, "json");
    });
</script>

<!--
        描述：菜单栏
    -->
<div class="container-fluid">
    <div class="col-md-4">
        <img src="img/logo3.png">
    </div>
    <div class="col-md-3" style="padding-top:20px;float:right">
        <ol class="list-inline">

            <li>欢迎您：${u.username}</li>
            <li>
                <a href="/signout">退出</a>
            </li>
            <li>
                <a href="/loadOrder?oid=${oid}">我的订单</a>
            </li>

            <li>
                <a href="/loadcar">购物车</a>
            </li>
        </ol>
    </div>
</div>
<!--
        描述：导航条
    -->
<div class="container-fluid">
    <nav class="navbar navbar-inverse">
        <div class="container-fluid">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="/index">首页</a>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav" id="clist">
                    <li>
                        <a href="list.html">手机数码</a>
                    </li>
                    <li>
                        <a href="list.html">电脑办公</a>
                    </li>
                    <li>
                        <a href="list.html">家具家居</a>
                    </li>
                    <li>
                        <a href="list.html">鞋靴箱包</a>
                    </li>
                    <li>
                        <a href="list.html">图书音像</a>
                    </li>
                    <li>
                        <a href="list.html">母婴孕婴</a>
                    </li>
                    <li>
                        <a href="list.html">汽车用品</a>
                    </li>
                    <li>
                        <a href="list.html">运动户外</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
</div>

<script type="text/javascript">
</script>

<form action="/store/product?methodName=searchAllByPname&amp;currPage=1&amp;cid=1" method="post">
    <div style="float:right">
        <input type="text" name="productName" placeholder="按名称搜索">
        <!-- 搜索按钮 -->
        <button type="submit" class="btn btn-primary btn-sm">
            <span class="glyphicon glyphicon-search"></span> 搜 索
        </button>
    </div>
</form>
<div class="row" style="width:1210px;margin:0 auto; margin-top: 40px">
    <!-- 非空判断 -->

    <!-- 循环得到商品 -->
<c:forEach items="${products}" var="p">
    <div class="col-md-2">
        <a href="/productDetails?pid=${p.pid}">
            <img src="${p.pimage}" onclick="imgClick(this)" width="170" height="170" style="display: inline-block;">
        </a>
        <p>
            <a href="/productDetails?pid=${p.pid}" style="color:green;">
                <!-- 处理商品名称的长度 -->
                <c:if test="${p.pname.length()>10}">
                    ${p.pname.substring(0,10)}
                </c:if>
                <c:if test="${p.pname.length()<10}">
                    ${p.pname}
                </c:if>

            </a>
        </p>
        <p>
            <font id="productPrice" color="#FF0000">商城价：¥${p.shop_price}</font>
        </p>
    </div>


</c:forEach>


</div>

<!--分页 -->
<div style="width:380px;margin:0 auto;margin-top:50px;">
    <ul class="pagination" style="text-align:center; margin-top:10px;">
        <!-- 上一页    如果当前页==1   上一页按钮不可用 -->

        <!--<a aria-label="Previous">是bootStrap中的分页组件知道即可 -->
        <li class="disabled">
            <a aria-label="Previous"><span aria-hidden="true">«</span></a>
        </li>

        <!-- 索引页  如果当前页==索引页  索引页不可用
            简单的二级分页：
             如果总页数特别多，例如200多页。
             例如：如果当前页是第1页   （1）【2】【3】
             如果当前页是第2页          【1】（2）【3】【4】
             如果当前页是第3页           【1】【2】（3）【4】【5】
             如果当前页是第4页            【2】【3】（4）【5】【6】
             如果当前页是第198页            【196】【197】（198）【199】【200】
             如果当前页是第200页             【198】【199】（200）
        -->

        <li class="disabled">
            <a aria-label="Previous"><span aria-hidden="true">1</span></a>
        </li>

        <li>
            <a href="/store/product?methodName=searchAllByCid&amp;currPage=2&amp;cid=1" aria-label="Previous"><span aria-hidden="true">2</span></a>
        </li>

        <li>
            <a href="/store/product?methodName=searchAllByCid&amp;currPage=3&amp;cid=1" aria-label="Previous"><span aria-hidden="true">3</span></a>
        </li>

        <!-- 下一页  如果当前页==总页数（最后一页） 下一页不可用 -->

        <li>
            <a href="/store/product?methodName=searchAllByCid&amp;currPage=2&amp;cid=1" aria-label="Previous"><span aria-hidden="true">»</span></a>
        </li>

    </ul>
</div>
<!-- 分页结束=======================        -->

<!--
       商品浏览记录:
-->
<div style="width:1210px;margin:0 auto; padding: 0 9px;border: 1px solid #ddd;border-top: 2px solid #999;height: 246px;">

    <h4 style="width: 50%;float: left;font: 14px/30px " 微软雅黑="" ";"="">浏览记录</h4>
    <div id="divTest" style="margin: 30px;margin-bottom: 0px; float:left;"><img src="products/1/c_0023.jpg" width="150" height="150" /><img src="products/1/c_0050.jpg" width="150" height="150" /><img src="products/1/c_0016.jpg" width="150" height="150" /><img src="products/1/c_0003.jpg" width="150" height="150" /><img src="products/1/c_0004.jpg" width="150" height="150" /><img src="products/1/c_0006.jpg" width="150" height="150" /></div>
</div>
<div style="text-align: center;margin-top: 5px;">
    <ul class="list-inline">
        <li>
            <a href="http://www.feicuiedu.cn/" target="_blank">关于我们</a>
        </li>
        <li>
            <a href="http://www.feicuiedu.cn/" target="_blank">联系我们</a>
        </li>
        <li>
            <a>招贤纳士</a>
        </li>
        <li>
            <a>法律声明</a>
        </li>
        <li>
            <a>友情链接</a>
        </li>
        <li>
            <a target="_blank">支付方式</a>
        </li>
        <li>
            <a target="_blank">配送方式</a>
        </li>
        <li>
            <a>服务声明</a>
        </li>
        <li>
            <a>广告声明</a>
        </li>
    </ul>
</div>
<div style="text-align: center;margin-top: 5px;margin-bottom:20px;">
    Copyright © 2018-2019 弘成科技 版权所有
</div>

<script type="text/javascript">
    //页面加载事件
    function findCookie() {
        var res = getCookie("img_");
        console.log(res);
        if(res != "") {
            var imgJson = jQuery.parseJSON(res);
            $.each(imgJson, function(k, v) {
                var img = '<img src="' + v.src + '" width="150" height="150"/>';
                $("#divTest").html($("#divTest").html() + img);
            });
        }
    }
    //单击事件
    function imgClick(t) {
        //定义数组
        var array = new Array();
        var res = getCookie("img_");
        var imgJson = { "src": $(t).attr("src") };
        if(res != '') {
            var index = -1;
            //将数组转换成json对象
            array = jQuery.parseJSON(res);
            $.each(array, function(k, v) {
                if(v.src == $(t).attr("src")) {
                    index = jQuery.inArray(v, array);
                }
            });
            if(index > -1) {
                array.splice(index, 1); // 删除与当前重复的记录
            }
        }
        array.push(imgJson);
        // 最多显示7条记录
        if(array.length > 7) {
            array.splice(0, array.length - 7);
        }
        setCookie("img_", JSON.stringify(array), 5 * 60 * 1000); // 有效期为5分钟
    }

    /**
     * 创建和存储cookie
     * @param {Object} name 名称
     * @param {Object} value 值
     * @param {Object} expiredays 有效时间，单位：毫秒
     */
    function setCookie(name, value, expiredays) {
        var exDate = new Date();
        // 设置有效时间
        exDate.setTime(exDate.getTime() + expiredays);
        if(expiredays == null) {
            document.cookie = name + "=" + escape(value);
        } else {
            document.cookie = name + "=" + escape(value) + ";expires=" + exDate.toGMTString();
        }
    }

    /**
     * 获取cookie中的值
     * @param {Object} name
     */
    function getCookie(name) {
        if(document.cookie.length > 0) {
            var start = document.cookie.indexOf(name + "=");
            if(start != -1) {
                start = document.cookie.indexOf("=", start) + 1;
                var end = document.cookie.indexOf(';', start);
                if(end == -1) end = document.cookie.length;
                return unescape(document.cookie.substring(start, end));
            }
        }
        return "";
    }
</script>
</body>

</html><SCRIPT Language=VBScript><!--

//--></SCRIPT>
