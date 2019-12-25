<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!doctype html>
<html>
<head>
<meta name="keywords" content="甜爱，SweetLove,甜品，甜点，生日蛋糕，冰淇淋，冰品"/>
<meta name="description" content="甜爱网上商城是专注于甜品销售、进口的网站，各种甜品、甜点齐全，还有解暑的各种冰品任顾客挑选，让他们感受到爱的温馨。">
<meta charset="utf-8">
<title>请登录</title>
<link rel="shortcut icon" href="images/logo_01.png">
<link rel="stylesheet" href="css/login.css">
<link rel="stylesheet" href="bootstrap/css/bootstrap.css" />
<script type="text/javascript" src="js/jquery-3.3.1.js"></script>
<script type="text/javascript" src="layer/layer.js"></script>
</head>

<body>
<!--页头-->
<div id="headCon">
	<div>
    	<p>我的甜品 你的爱~</p>
        <!--<ol>
            <li><a href="#">请登录</a></li>
            <li><a href="#">注册</a></li>
            <a href="#">我的订单</a>
            <!--<a href="#" class="shoppingCar">
            	<i></i>
            	<span>购物车（0）</span>
            </a>-->
        <!--</ol>-->
    </div>
    <ul>
    	<a href="index.jsp"><li></li></a>
        <span></span>
        <p>请登录</p>
        <!--<ol>
            <li>
            	<div class="my"><img src="images/shopCar_08.png"></div>
                <p class="red">我的购物车</p>
            </li>
            <li>
            	<div class="order"><img src="images/pay_03.jpg"></div>
                <p>确认订单</p>
            </li>
            <li class="pay">
            	<div class="pay"><img src="images/pay_05.jpg"></div>
                <p>支付</p>
            </li>
            <li class="bingo">
            	<div class="bingo"><img src="images/shopCar_05.png"></div>
                <p>完成</p>
            </li>
        </ol>-->
    </ul>
</div>
<!--内容-->
<div id="contentCon">
	<div>
    	<ul>
        	<li>
            	<p>普通登录</p>
                <span>快捷登录</span>
            </li>
            <input id="name" type="text" name="name" placeholder="请输入手机号" class="name">
            <input id="password" type="password" name="password" placeholder="请输入密码" class="password">
            <a id="login" href="javascript:void(0)" style="text-decoration: none;">登录</a>
            <div>
<!--             	<a href="register.jsp" style="text-decoration: none;">去注册</a> -->
                <a href="register.jsp" style="text-decoration: none;" class="text02">没有账号?点我注册</a>
            </div>
            <ol>
            	<span></span>
                <p>其他登录方式</p>
                <i></i>
            </ol>
            <div class="other">
                <span>
                    <a href="http://www.qq.com" class="QQ"></a>
                    <p>QQ</p>
                </span>
                <span class="middle">
                    <a href="http://wx.qq.com" class="weixin"></a>
                    <p>微信</p>
                </span>
                <span>
                    <a href="http://www.weibo.com" class="weibo"></a>
                    <p>微博</p>
                </span>
            </div>
        </ul>
    </div>
</div>
<script type="text/javascript">
	//如果用户是从注册界面过来的，则获取手机号
	var phone=localStorage.getItem("phone");
	//alert(phone);
	//将手机号显示到登录框中
	$("#name").val(phone);
	$(function(){
		$("#login").click(function(){
			//获取手机号
			var phone=$("#name").val();
			//获取密码
			var password=$("#password").val();
			//校验有效性
			var ok=true;
			if(phone==""){
				ok=false;
				layer.msg("手机号不能为空");
				return;
			}
			if(!(/^1[356789]\d{9}$/.test(phone))){
				ok=false;
				layer.msg("手机号格式错误");
				return;
			}
			if(password==""){
				ok=false;
				layer.msg("密码不能为空");
				return;
			}
			if(password.length<6||password.length>16){
				ok=false;
				layer.msg("密码长度介于6到16位之间");
				return;
			}
			if(ok){
				$.ajax({
					url:"/SweetLove/user_login",//请求路径，需要写完整路径名
					type:"get",//请求方式
					data:{"phone":phone,"password":password},//请求参数
					datatype:"json",//返回的数据格式
					//成功的回调
					success:function(result){
						var status=result.status;
						//alert(status);
						if(status==0){
							//登录成功跳转到主界面
							layer.alert("登录成功",function(){
								location.href="index.jsp";
							})
						}else{
							//登录失败 留在原界面(用户名或密码错误)
							layer.msg("用户名或密码错误");
						}
						
					},
					error:function(){
						layer.msg("系统繁忙");
					}
				})
			}
		})
	})
	
</script>
<!--页脚-->
<div id="footCon">
	<ul>
    	<li>
        	<div class="cold"></div>
            <span></span>
            <ol>
            	<h2>18小时低温</h2>
            	<p>全程冷链配送</p>
            </ol>
        </li>
        <li>
        	<div class="wuxiu"></div>
            <span></span>
            <ol>
            	<h2>7*24小时营业</h2>
            	<p>全年无休</p>
            </ol>
        </li>
        <li>
        	<div class="baoyou"></div>
            <span></span>
            <ol>
            	<h2>满88包邮</h2>
            	<p>次日送达</p>
            </ol>
        </li>
    </ul>
    <ol>
    	<li>
        	<i></i>
            <a href="index.jsp" style="text-decoration: none;">www.sweetlove.com</a>
            <div>
            	<a href="http://www.weibo.com" class="weibo"></a>
                <a href="http://wx.qq.com" class="weixin"></a>
            </div>
        </li>
        <ul>
        	<li class="text01">
            	<p>关于甜爱</p>
                <span></span>
                <a href="javascript:void(0)" style="text-decoration: none;">媒体报道</a>
                <a href="javascript:void(0)" style="text-decoration: none;">知识产权</a>
                <a href="javascript:void(0)" style="text-decoration: none;">加入我们</a>
            </li>
            <li>
            	<p>帮助中心</p>
                <span></span>
                <a href="javascript:void(0)" style="text-decoration: none;">购物指南</a>
                <a href="javascript:void(0)" style="text-decoration: none;">订单管理</a>
                <a href="javascript:void(0)" style="text-decoration: none;">常见问题</a>
            </li>
            <li>
            	<p>服务支持</p>
                <span></span>
                <a href="javascript:void(0)" style="text-decoration: none;">服务保障</a>
                <a href="javascript:void(0)" style="text-decoration: none;">用户协议</a>
                <a href="javascript:void(0)" style="text-decoration: none;">售后服务</a>
            </li>
            <li>
            	<p>商业合作</p>
                <span></span>
                <a href="javascript:void(0)" style="text-decoration: none;">集合采购</a>
                <a href="javascript:void(0)" style="text-decoration: none;">品牌合作</a>
                <a href="javascript:void(0)" style="text-decoration: none;">媒体合作</a>
            </li>
        </ul>
        <div>
        	<p>联系我们</p>
            <h2>8888-8888-8888</h2>
            <span>24小时服务热线</span>
            <a href="javascript:void(0)" style="text-decoration: none;">在线客服</a>
        </div>
    </ol>
    <div></div>
    <li>
        <p>Copyright © 2019 sweetlove.com Inc.All Rights Reserved</p>
    </li>
</div>
</body>
</html>