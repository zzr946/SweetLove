<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html>
<head>
<meta name="keywords" content="甜爱，SweetLove,甜品，甜点，生日蛋糕，冰淇淋，冰品"/>
<meta name="description" content="甜爱网上商城是专注于甜品销售、进口的网站，各种甜品、甜点齐全，还有解暑的各种冰品任顾客挑选，让他们感受到爱的温馨。">
<meta charset="utf-8">
<title>我的甜品，你的爱~</title>
<link rel="shortcut icon" href="images/logo_01.png">
<link rel="stylesheet" href="css/order.css">
<link rel="stylesheet" href="bootstrap/css/bootstrap.css" />
<script type="text/javascript" src="js/jquery-3.3.1.js"></script>
<script type="text/javascript" src="layer/layer.js"></script>

<link href="css/admin.css" rel="stylesheet" type="text/css">
<link href="css/amazeui.css" rel="stylesheet" type="text/css">

<link href="css/personal.css" rel="stylesheet" type="text/css">
<link href="css/addstyle.css" rel="stylesheet" type="text/css">
		
<script src="js/jquery.min.js" type="text/javascript"></script>
<script src="js/amazeui.js"></script>


<style type="text/css">
	.hidden{
		display: none;
	}
	#contentCon>.right>ul {
    	overflow: hidden;
    	background-color: #fff;
	}
	#contentCon>.right>ul>p {
	    text-align: center;
	    float: left;
	    width: 112px;
	    height: 34px;
	    font-size: 18px;
	    border-bottom: 1px solid #d2d2d2;
	    border-right: 1px solid #d2d2d2;
	    color: #fb0000;
	}
	#contentCon>.right>ul>span {
	    float: left;
	    width: 762px;
	    height: 1px;
	    background: #d2d2d2;
	}
	
	
</style>
</head>

<body style="background-color: #fff">
<!--页头-->
<div id="headCon">
	<div>
    	<p>我的甜品 你的爱~</p>
    	<input type="hidden" id="id" name="id" value="${user.data.id}">
    	<input type="hidden" id="account" name="account" value="${user.data.account}">
    	<input type="hidden" id="password" name="password" value="${user.data.password}">
    	<input type="hidden" id="photo" name="photo" value="${user.data.photo}">
    	<input type="hidden" id="nickname" name="nickname" value="${user.data.nickname}">
    	<input type="hidden" id="sex" name="sex" value="${user.data.sex}">
    	<input type="hidden" id="phone" name="phone" value="${user.data.phone}">
    	<input type="hidden" id="status" name="status" value="${user.data.status}">
        <ol>
            <li id="log" class=""><a href="login.jsp" style="text-decoration: none;">请登录</a></li>
            <li id="reg" class=""><a href="register.jsp" style="text-decoration: none;">注册</a></li>
            <li><a href="myorder?uid=${user.data.id}" style="text-decoration: none;">我的订单</a></li>
            <a href="goodscarAll?uid=${user.data.id}" class="shoppingCar">
            	<i></i>
            	<span>购物车</span>
            </a>
             <li id="logout"><a style="text-decoration: none; cursor: pointer;">安全退出</a></li>
        </ol>
        <script type="text/javascript">
        	//判断用户是否登录
        	if("${user}"){
        		//用户已经登录
        		$("#log").addClass("hidden");
        		$("#reg").addClass("hidden");
        	}else{
        		//没登录则只显示登录注册
        		$("#order").addClass("hidden");
        		$("#cart").addClass("hidden");
        		$("#logout").addClass("hidden");
        	}
        	//安全退出的方法
        	$("#logout").click(function(){
        		//向后端发请求,清空session中的值
        		location.href="user_logout"
        	})
        </script>
    </div>
    <ul>
    	<a href="index.jsp"><li></li></a>
        <ol>
            <li><a href="index.jsp" class="first">首页</a></li>
            <li><a href="western.jsp">西式甜品</a></li>
            <li><a href="HongKong.html">港式甜品</a></li>
            <li><a href="goods_list">所有甜品</a></li>
            <li class="search">
            	<!--<input placeholder="提拉米苏" value=""><button></button>-->
            	<div class="row" style="width: 300px;">
				  <div class="col-lg-12" >
				    <div class="input-group" style="margin-bottom:0px;">
				      <input type="text" class="form-control" placeholder="请输入搜索的商品" style="color: orange;">
				      <span class="input-group-btn">
				        <button class="btn btn-default" type="button"><span class="glyphicon glyphicon-search" style="color: orange;"></span></button>
				      </span>
				    </div>
				  </div>
				</div>
            </li>
        </ol>
    </ul>
</div>
<!--内容-->
<div id="contentCon">
	<div class="left">
		<!-- 单纯的只是显示用户头像 -->
    	<div id="userphoto" style="" style="width: 100px;height: 100px;margin: 20px 82px 20px 82px"></div>
        <p id="usernickname" style="margin-top: 20px;font-size: 18px"><%-- ${user.data.phone} --%></p><!-- 昵称 -->
        <script type="text/javascript">
        /* 显示用户昵称 */
        	var usernick=$("#nickname").val();
        	if(usernick!=""){
        		$("#usernickname").text(usernick);
        	}else{
        		$("#usernickname").text("${user.data.phone}");
        	}
        </script>
        <a href="user_logout" style="text-decoration: none;">切换账号</a>
        <script type="text/javascript">
        	//判断用户是否设置头像
        	if($("#photo").val()!=""){
        		//用户设置了头像则将头像显示到界面
        		$("#userphoto").attr("style","background:url(/userphoto/${user.data.photo});background-size: 100% 100%;background-repeat: no-repeat;");
        	}else{
        		//用户没设置头像则显示默认头像
        		$("#userphoto").attr("style","background:url(images/getAvatar.do.jpg);background-size: 100% 100%;background-repeat: no-repeat;");
        	}
        </script>
        
        <span></span>
        <ul>
        	<li><a href="userinfo.jsp">个人信息</a></li>
            <li><a href="myorder?uid=${user.data.id}" >我的订单</a></li>
            <li><a href="addressAll?uid=${user.data.id}">地址管理</a></li>
            <li><a href="password.jsp" class="my">账号设置</a></li>
            <li><a href="goods_collectList" >收藏夹</a></li>
        </ul>
    </div>
    <div class="right">
    	<ul >
    		<p>修改密码</p>
            <span></span>
        </ul>
        <!--修改密码 -->
        <form class="am-form am-form-horizontal">
				<div class="am-form-group">
					<label for="user-old-password" class="am-form-label">原密码</label>
					<div class="am-form-content">
						<input type="password" id="user-old-password" placeholder="请输入原登录密码">
					</div>
				</div>
				<div class="am-form-group">
					<label for="user-new-password" class="am-form-label">新密码</label>
					<div class="am-form-content">
						<input type="password" id="user-new-password" placeholder="由数字、字母组合">
					</div>
				</div>
				<div class="am-form-group">
					<label for="user-confirm-password" class="am-form-label">确认密码</label>
					<div class="am-form-content">
						<input type="password" id="user-confirm-password" placeholder="请再次输入上面的密码">
					</div>
				</div>
				<div class="info-btn" style="width: 86px; margin-left: 400px">
					<div onclick="change()" class="am-btn am-btn-danger">保存修改</div>
				</div>
			</form>
        	<script type="text/javascript">
        		function change(){
        			//获取当前用户id
        			var id=$("#id").val();
        			//获取原密码
        			var oldpassword=$("#user-old-password").val();
        			//获取新密码
        			var newpassword=$("#user-new-password").val();
        			//获取确认密码
        			var re_newpassword=$("#user-confirm-password").val();
        			var ok=true;
        			//校验
        			if(oldpassword==""||newpassword==""||re_newpassword==""){
        				ok=false;
        				layer.msg("请将信息填写完整");
        				return;
        			}
        			if(newpassword!=re_newpassword){
        				ok=false;
        				layer.msg("两次密码输入不一致");
        				return;
        			}
        			
        			if(ok){
        				//fason发送异步请求
        				$.ajax({
        					url:"/SweetLove/changpassword",
        					type:"get",
        					data:{"id":id,"oldpassword":oldpassword,"newpassword":newpassword},
        					datatype:"json",
        					success:function(result){//成功回调掉
        						//获取回调参数
        						var status=result.status;
        						if(status==0){
        							//成功
        							layer.msg("密码修改成功，请重新登录",{btn:['确认'],icon:1},function(){
										//将session中的内容清空，再跳转到登录页面
										location.href='login.jsp';
									})
        							
        							
        						}
        						if(status==1){
        							//失败
        							layer.msg("修改失败，请稍后再试");
        						}
        						if(status==2){
        							//原密码错误
        							layer.msg("原密码错误,请重新输入");
        						}
        						
        						
        					},
        					error:function(){//失败回调
        						layer.msg("系统异常");
        					}
        					
        				})
        			}
        			
        			
        		}
        	</script>
        
        
        
        
 
    </div>
</div>
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
