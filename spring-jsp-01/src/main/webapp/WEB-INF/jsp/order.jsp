<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 2020/12/15
  Time: 9:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>购物车</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
    <script src="js/jquery-1.11.3.min.js" type="text/javascript"></script>
    <script src="js/bootstrap.min.js" type="text/javascript"></script>
    <!-- 引入自定义css文件 style.css -->
    <link rel="stylesheet" href="css/style.css" type="text/css">
    <style>
        body {
            margin-top: 20px;
            margin: 0 auto;
        }

        .carousel-inner .item img {
            width: 100%;
            height: 300px;
        }
    </style>
</head>
<body>
<!--描述：菜单栏和导航条-->

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

            <li>欢迎您：admin</li>
            <li>
                <a href="/store/login?methodName=logout">退出</a>
            </li>
            <li>
                <a href="orderInfo.html">我的订单</a>
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

        <div style="margin: 0 auto; margin-top: 10px; width: 950px;">
            <strong>订单详情</strong>
<c:forEach var="car" items="${caritem}">
            <table class="table table-bordered">
                <tbody>


                <tr class="warning">

                </tr>
                <tr class="warning">
                    <th>图片</th>
                    <th>商品</th>
                    <th>价格</th>
                    <th>数量</th>
                    <th>小计</th>
                </tr>

                <tr class="active">
                    <td width="60"><img src="${car.pimage}" width="70" height="60"></td>
                    <td width="30%">
                        <a target="_blank">
                            ${car.pname}</a>
                    </td>
                    <td width="20%">￥${car.shop_price}</td>
                    <td width="10%">${qty}</td>
                    <td width="15%"><span class="subtotal">￥${car.shop_price*qty}</span>
                    </td>
                </tr>



                </tbody>
            </table>
</c:forEach>
        </div>

        <div style="text-align: right; margin-right: 120px;">
            商品金额: <strong style="color: #ff6600;">￥${total}元</strong>
        </div>

    </div>

    <div>
        <hr>
        <form id="orderForm" action="/saveorder" method="post">
            <input type="hidden" name="oid" value="9f5bbd6a8abb4552b10faee1dda99ddd">
            <div style="margin-top: 120px">
                <p style="text-align: right; margin-right: 10px;">
                    <a href="/saveOrder"> <img src="images/finalbutton.gif" width="204" height="51" border="0">
                    </a>
                </p>
                <hr>
            </div>
        </form>
    </div>

</div>

<div style="text-align: center; margin-top: 5px;">
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
<div style="text-align: center; margin-top: 5px; margin-bottom: 20px;">
    Copyright © 2018-2019 弘成科技 版权所有</div>
</body>
</html>
