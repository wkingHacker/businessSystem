<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 2020/12/15
  Time: 16:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>注册</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
    <script src="js/jquery-1.11.3.min.js" type="text/javascript"></script>
    <script src="js/bootstrap.min.js" type="text/javascript"></script>
    <link rel="stylesheet" href="css/style.css" type="text/css">
    <style>
        body {
            margin-top: 20px;
            margin: 0 auto;
        }
.container{
    background-image: url("/img/bbab3ea18b4fb01762efa86f8616143e.jpeg");
    width: 100%;
    height:447px;
    background-repeat: no-repeat;
}
        .carousel-inner .item img {
            width: 100%;
            height: 300px;
        }

        .container .row div {
            /* position:relative;
 float:left; */
        }

        font {
            color: #3164af;
            font-size: 18px;
            font-weight: normal;
            padding: 0 10px;
        }
    </style>
    <script type="text/javascript">
        //异步校验用户名方法
        function checkUserName(nodex) {
            //1、获取用户名值
            var val = nodex.value;
            //2、异步校验
            $.post("/store/register", { methodName: "checkUserName", username: val }, function(data) {
                if("yes" == data) {
                    //可以注册
                    $("#usernameMsg").html("<font color='blue' size='7'>用户名可以注册</font>");
                    $("#sub").prop("disabled", false);
                } else if("no" == data) {
                    //不可以注册
                    $("#usernameMsg").html("<font color='blue' size='7'>用户名重复，不可以注册</font>");
                    $("#sub").prop("disabled", true);
                } else {
                    //最后一个防止有开发人员  改数据包    不是必须的
                    $("#usernameMsg").html("<font color='blue' size='7'>小朋友，不要乱改数据包</font>");
                    $("#sub").prop("disabled", true);
                }
            });
        }
        //图片预览功能
        function PreviewImage(imgFile) {
            var filextension = imgFile.value.substring(imgFile.value.lastIndexOf("."), imgFile.value.length);
            filextension = filextension.toLowerCase();
            if((filextension != '.jpg') && (filextension != '.gif') && (filextension != '.jpeg') && (filextension != '.png') && (filextension != '.bmp')) {
                alert("对不起，系统仅支持标准格式的照片，请您调整格式后重新上传，谢谢 !");
                imgFile.focus();
            } else {
                var path;
                if(document.all) {
                    imgFile.select();
                    path = document.selection.createRange().text;
                    document.getElementById("imgPreview").innerHTML = "";
                    document.getElementById("imgPreview").style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(enabled='true',sizingMethod='scale',src=\"" + path + "\")"; //使用滤镜效果
                } else {
                    path = window.URL.createObjectURL(imgFile.files[0]);
                    document.getElementById("imgPreview").innerHTML = "<img id='img1' width='120px' height='100px' src='" + path + "'/>";
                }
            }
        }
    </script>
</head>
<body>
<!-- 引入菜单栏和导航栏 -->

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

            <li>
                <a href="login.html">登录</a>
            </li>
            <li>
                <a href="register.html">注册</a>
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
    function sendSms() {
        var phone=$('#userphone').val();
        $.ajax({
            type: "post",
            url: "https://dysmsapi.aliyuncs.com",
            data: {PhoneNumbers:phone, SignName:'',TemplateCode:''},
            dataType: "json",
            success: function(data){
              console.log(data);
            }
        });
    }
    function check() {
        var phone=$('#userphone').val();
        $.ajax({
            type: "get",
            url: "http://localhost:8080/checkcode",
            data: {phone:phone},
            dataType: "json",
            success: function(data){
                console.log(data);
                if(data.SmsSendDetailDTO.OutId!=($('#code').val()))
                {
                    alert("验证码错误或者已超时，请重新发送");
                }
            }
        });
    }
</script>

<div class="container" style="width:100%;;">
    <div class="row">

        <div class="col-md-2"></div>

        <div class="col-md-8" style="background:#fff;padding:40px 80px;margin:30px;border:7px solid #ccc;">
            <font>会员注册</font>USER REGISTER
            <form class="form-horizontal" style="margin-top:5px;" action="/register" method="post" >
                <div class="form-group">
                    <label for="username" class="col-sm-2 control-label">用户名</label>
                    <div class="col-sm-6">
                        <input type="text" class="form-control" id="username" name="username" placeholder="请输入用户名" onblur="checkUserName(this)">
                    </div>
                </div>
                <div class="form-group">
                    <label for="inputPassword3" class="col-sm-2 control-label">密码</label>
                    <div class="col-sm-6">
                        <input type="password" class="form-control" id="inputPassword3" name="PASSWORD" placeholder="请输入密码">
                    </div>
                </div>
                <div class="form-group">
                    <label for="confirmpwd" class="col-sm-2 control-label">确认密码</label>
                    <div class="col-sm-6">
                        <input type="password" class="form-control" id="confirmpwd"   placeholder="请输入确认密码">
                    </div>
                </div>

                <div class="form-group">
                    <label for="inputEmail3" class="col-sm-2 control-label">Email</label>
                    <div class="col-sm-6">
                        <input type="email" class="form-control" id="inputEmail3" name="email" placeholder="Email">
                    </div>
                </div>


                <div class="form-group">
                    <label for="userphone" class="col-sm-2 control-label">电话</label>
                    <div class="col-sm-6">
                        <input type="text" class="form-control" id="userphone" name="telephone" placeholder="请输入电话号码">
                        <div><input type="text" id="code" name="checkcode" >
                        <button onclick="sendSms()">发送验证码</button>
                         <button onclick="check()">校验验证码</button>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                        <input type="submit" value="注册">
                    </div>
                </div>
            </form>
        </div>

    </div>

    <div class="col-md-2"></div>

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
</body>
</html>
