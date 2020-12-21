<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 2020/12/14
  Time: 17:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>商品详情</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
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
</head>
<body>
<!--
            描述：菜单栏和导航条
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

            <li>欢迎您：${user.username}</li>
            <li>
                <a href="/store/login?methodName=logout">退出</a>
            </li>
            <li>
                <a href="order.html">我的订单</a>
            </li>

            <li>
                <a href="cart.html">购物车</a>
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

<div class="container">
    <div class="row">
        <c:forEach items="${detail}" var="d">
         <div style="border: 1px solid #e4e4e4;width:930px;margin-bottom:10px;margin:0 auto;padding:10px;margin-bottom:10px;">
            <a href="/index">首页&nbsp;&nbsp;&gt;</a>
            <a href="/store/product?methodName=searchAllByCid&amp;currPage=1&amp;cid=1">手机数码&nbsp;&nbsp;&gt;</a>
        </div>

        <div style="margin:0 auto;width:950px;">
            <div class="col-md-6">
                <img style="opacity: 1;width:400px;height:350px;" title="" class="medium" src="${d.pimage}">
            </div>

            <div class="col-md-6">
                <div><strong>${d.pname}</strong></div>
                <div style="border-bottom: 1px dotted #dddddd;width:350px;margin:10px 0 10px 0;">
                    <div>编号：${d.pid}</div>
                </div>

                <div style="margin:10px 0 10px 0;">商城价: <strong style="color:#ef0101;">￥：${d.shop_price}元</strong> 参 考 价： <del>￥${d.market_price}元</del>
                </div>

                <div style="margin:10px 0 10px 0;">促销:
                    <a target="_blank" title="限时抢购 (2014-07-30 ~ 2015-01-01)" style="background-color: #f07373;">限时抢购</a>
                </div>

                <div style="padding:10px;border:1px solid #e7dbb1;width:330px;margin:15px 0 10px 0;;background-color: #fffee6;">
                    <!-- 请求路径及方法-->
                    <form action="/sendCar" method="post">
                        <input type="hidden" name="methodName" value="add">
                        <input type="text" name="pid" value="${d.pid}">

                        <div style="border-bottom: 1px solid #faeac7;margin-top:20px;padding-left: 10px;">购买数量:
                            <input id="quantity" name="count" value="1" maxlength="4" size="10" type="text"> </div>

                        <div style="margin:20px 0 10px 0;;text-align: center;">
                            <a >
                                <input style="background:  no-repeat scroll 0 -600px rgba(0, 0, 0, 0);height:36px;width:127px;" value="加入购物车" type="submit">
                            </a>
                        </div>
                    </form>
                </div>

            </div>
        </div>
        <div class="clear"></div>
        <div style="width:950px;margin:0 auto;">
            <div style="background-color:#d3d3d3;width:930px;padding:10px 10px;margin:10px 0 10px 0;">
                <strong>商品介绍</strong>
            </div>
            <div>
                ${d.pdesc}
            </div>
        </div>
        </c:forEach>
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

</div>
</body>
</html>
