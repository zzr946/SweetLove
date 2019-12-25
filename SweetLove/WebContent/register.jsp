<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!doctype html>
<html>
<head>
<meta name="keywords" content="甜爱，SweetLove,甜品，甜点，生日蛋糕，冰淇淋，冰品"/>
<meta name="description" content="甜爱网上商城是专注于甜品销售、进口的网站，各种甜品、甜点齐全，还有解暑的各种冰品任顾客挑选，让他们感受到爱的温馨。">
<meta charset="utf-8">
<title>欢迎注册！</title>
<link rel="shortcut icon" href="images/logo_01.png">
<link rel="stylesheet" href="css/register.css">
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
        <p>请注册</p>
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
<form>
        <ul>
        	<p>手机号码：</p>
            <input id="phone" name=phone type="text" placeholder="请输入手机号码">
        </ul>
        <ul class="box02">
        	<p>设置密码：</p>
            <input id="password" name="password" type="password" placeholder="6~16位字母或数字的组合">
        </ul>
        <ul class="box02">
        	<p>确认密码：</p>
            <input id="repassword" name="repassword" type="password" placeholder="请再次输入密码">
        </ul>
        <ol>
        	<p>验证码：</p>
            <input id="code" name="code" type="tel">
            <a id="getcode" href="javascript:void(0)" style="text-decoration: none;">获取验证码</a>
        </ol>
        <li>
        	<input type="checkbox">
            <p>我已阅读并同意</p>
            <a href="javascript:void(0)" style="text-decoration: none;">《SweetLove服务协议》</a>
        </li>
        <a id="register" href="javascript:void(0)" style="text-decoration: none;">注册</a>
        </form>
</div>
	<!-- 异步请求获取验证码 -->
	<script type="text/javascript">
		//获取验证码
		$(function(){
			$("#getcode").click(function(){
				//手机号
				var phone=$("#phone").val();
				//密码
				var password=$("#password").val();
				//重复密码
				var repassword=$("#repassword").val();
				//校验
				var ok=true;
				if(phone==""){
					ok=false;
					layer.msg("手机号不能为空!")
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
				if(password!=repassword){
					ok=false;
					layer.msg("两次密码输入不一致");
					return;
				}
				if(ok){
					$.ajax({
						url:"/SweetLove/user_getcode",//请求路径，需要写完整路径名
						type:"get",//请求方式
						data:{"phone":phone},//请求参数
						datatype:"json",//返回的数据格式
						//成功的回调
						success:function(result){
							var status=result.status;
							//alert("成功的回调中的status:"+status);
							if(status==0){
								layer.msg("请查看验证码");
							}else{
								layer.msg("发送失败");
							}
						},
						error:function(){
							layer.msg("系统繁忙");
						}
					})
					//倒计时按钮的实现
					time(this);
				}
			})
		})
		//倒计时按钮实现
		var wait=10;
		function time(obj){
			if(wait==0){
				//移除禁用获取验证码的样式
				$("#getcode").css("pointer-events","");
				$("#getcode").text("获取验证码");
				wait=10;
			}else{
				//禁用获取验证码的按钮
				$("#getcode").attr("disabled","true").css("pointer-events","none");
				$("#getcode").text(wait+"秒后重试");
				wait--;
				setTimeout(function(){//计时器倒计时
					time(obj);
				}, 1000);//间隔1秒
			}
		}
	</script>
	
	<!-- 异步实现注册功能 -->
	<script type="text/javascript">
		$(function(){
			$("#register").click(function(){
				//手机号
				var phone=$("#phone").val();
				//密码
				var password=$("#password").val();
				//重复密码
				var repassword=$("#repassword").val();
				//验证码
				var code=$("#code").val();
				//校验
				var ok=true;
				if(phone==""){
					ok=false;
					layer.msg("手机号不能为空!")
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
				if(password!=repassword){
					ok=false;
					layer.msg("两次密码输入不一致");
					return;
				}
				if(code==""){
					ok=false;
					layer.msg("验证码不能为空");
					return;
				}
				if(code.length!=6){
					ok=false;
					layer.msg("验证码格式错误")
					return;
				}
				if(ok){
					$.ajax({
						url:"/SweetLove/user_reg",//请求路径，需要写完整路径名
						type:"get",//请求方式
						data:{"phone":phone,"password":password,"code":code},//请求参数
						datatype:"json",//返回的数据格式
						//成功的回调
						success:function(result){
							//status(0成功 1验证码错误 2注册失败 3手机号已注册)
							var status=result.status;
							if(status==0){
								layer.alert("注册成功,请前往登录",function(){
									//获取用户id
									var id=result.data.id;
									//获取手机号
									var phone=result.data.phone;
									//获取密码
									var password=result.data.password;
									//将数据带到下一个页面
									window.localStorage.setItem("id", id);
									window.localStorage.setItem("phone", phone);
									window.localStorage.setItem("password", password);
									//页面跳转
									location.href="login.jsp";
									
									
								});
							}
							if(status==1){
								layer.msg("验证码输入错误");
							}
							if(status==2){
								layer.msg("注册失败")
							}
							if(status==3){
								layer.msg("该手机号已经注册，请前往登录");
							}
						},
						error:function(){
							//失败的回调
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
            <a href="index.html">www.sweetlove.com</a>
            <div>
            	<a href="http://www.weibo.com" class="weibo"></a>
                <a href="http://wx.qq.com" class="weixin"></a>
            </div>
        </li>
        <ul>
        	<li class="text01">
            	<p>关于甜爱</p>
                <span></span>
                <a href="#">媒体报道</a>
                <a href="#">知识产权</a>
                <a href="#">加入我们</a>
            </li>
            <li>
            	<p>帮助中心</p>
                <span></span>
                <a href="#">购物指南</a>
                <a href="#">订单管理</a>
                <a href="#">常见问题</a>
            </li>
            <li>
            	<p>服务支持</p>
                <span></span>
                <a href="#">服务保障</a>
                <a href="#">用户协议</a>
                <a href="#">售后服务</a>
            </li>
            <li>
            	<p>商业合作</p>
                <span></span>
                <a href="#">集合采购</a>
                <a href="#">品牌合作</a>
                <a href="#">媒体合作</a>
            </li>
        </ul>
        <div>
        	<p>联系我们</p>
            <h2>400-8888-000</h2>
            <span>24小时服务热线</span>
            <a href="#">在线客服</a>
        </div>
    </ol>
    <div></div>
    <li>
        <p>Copyright © 2016 sweetlove.com Inc.All Rights Reserved. 北京甜爱食品有限公司</p>
        <span>版权所有 京ICP备14049645号-1 增值电信业务经营许可证：京ICP证160100号</span>
    </li>
</div>
</body>
</html>
