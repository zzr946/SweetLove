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
				      <input id="input" type="text" class="form-control" placeholder="请输入搜索的商品" style="color: orange;">
				      <span class="input-group-btn">
				        <button id="select" class="btn btn-default" type="button"><span class="glyphicon glyphicon-search" style="color: orange;"></span></button>
				      </span>
				    </div>
				  </div>
				</div>
				<script type="text/javascript">
					//搜索商品
					$("#select").click(function(){
						//获取搜索框中的内容
						var inp=$("#input").val();
						//向后台发送请求
						location.href="selectGoods?name="+inp;
						
					})
				</script>
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
            <li><a href="order.jsp" >我的订单</a></li>
            <li><a href="addressAll?uid=${user.data.id}" class="my">地址管理</a></li>
            <li><a href="password.jsp">账号设置</a></li>
            <li><a href="goods_collectList" >收藏夹</a></li>
        </ul>
    </div>
    <div class="right">
    	<ul >
    		<p>我的地址</p>
            <span></span>
        </ul>
        <!--地址列表 -->
        <div class="main-wrap" style="margin-top: 10px;margin-left: 10px">

					<div class="user-address">
						<!--标题 -->
						<script type="text/javascript">
						$(function(){
							//显示默认地址的方法
							$('.hiddenaddress[value=2]').parent().addClass('defaultAddr');
							//console.info($('.hiddenaddress').val());
						})
						</script>
						<script>
							//点击设为默认地址后执行
							function sub(t){
								//获取当前用户的id
								var uid=$('#id').val();
								//获取选择的地址的id
								var id=$(t).prev().val();
								//向后台发送请求
								//向后台发送请求
					        	$.ajax({
					        		url:"/SweetLove/address_changeDefault",//请求路径，需要写完整路径名
					    			type:"get",//请求方式
					    			data:{"id":id,"uid":uid},//请求参数
					    			datatype:"json",//返回的数据格式
					    			//成功的回调
					    			success:function(result){
					    				//获取回调参数
					    				var status=result.status;
					    				if(status==0){
					    					layer.msg("修改成功");
					    				}
					    				if(status==1){
					    					layer.msg("修改失败,请稍后再试");
					    				}
					    			},
					    			error:function(){
					    				layer.msg("系统繁忙");
					    			}
					        		
					        	})
							}
							//删除地址的方法
							function delClick(t){
								//获取删除的地址id
								var id=$(t).parent().prev().prev().prev().prev().val();
								//获取当前登录的用户id
								var uid=$("#id").val();
								//向后台发请求
								$.ajax({
					        		url:"/SweetLove/address_del",//请求路径，需要写完整路径名
					    			type:"get",//请求方式
					    			data:{"id":id,"uid":uid},//请求参数
					    			datatype:"json",//返回的数据格式
					    			//成功的回调
					    			success:function(result){
					    				//获取回调参数
					    				var status=result.status;
					    				if(status==0){
					    					//获取用户id
					    					var uid=$("#id").val();
					    					location.href="addressAll?uid="+uid;
					    					layer.msg("删除成功");
					    					
					    				}
					    			},
					    			error:function(){
					    				layer.msg("系统繁忙");
					    			}
					        		
					        	})
							}
							
							
						</script>
						
						<ul class="am-avg-sm-1 am-avg-md-3 am-thumbnails">
						<c:forEach var="address" items="${address.data}" varStatus="s">
								<li class="user-addresslist "><!-- class里加上defaultAddr表示被选中 -->
									<input type="hidden" class="hiddenaddress" value="${address.status}"><!-- 地址的状态值 -->
									<input type="hidden" value="${address.id}"><!-- 地址的id -->
									<span class="new-option-r" onclick="sub(this)"><i class="am-icon-check-circle"></i>默认地址</span>
									<p class="new-tit new-p-re">
										<span class="new-txt">${address.adduser}</span><!-- 收货人姓名 -->
										<span class="new-txt-rd2">${address.phone}</span><!-- 收货人电话 -->
									</p>
									<div class="new-mu_l2a new-p-re">
										<p class="new-mu_l2cw">
											<span class="street">${address.detailadd}</span></p><!-- 详细地址 -->
									</div>
									<div class="new-addr-btn">
<!-- 										<a href="#"><i class="am-icon-edit"></i>编辑</a> -->
<!-- 										<span class="new-addr-bar">|</span> -->
										<a href="javascript:void(0);" onclick="delClick(this);"><i class="am-icon-trash"></i>删除</a>
									</div>
								</li>
							</c:forEach>
						</ul>
						
						<div class="clear"></div>
						<a class="new-abtn-type" data-am-modal="{target: '#doc-modal-1', closeViaDimmer: 0}">添加新地址</a>
						
						<div class="am-modal am-modal-no-btn" id="doc-modal-1">

							<div class="add-dress">
								<!--标题 -->
								<div class="am-cf am-padding">
									<div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">新增地址</strong> / <small>Add&nbsp;address</small></div>
								</div>
								<hr/>
								<div class="am-u-md-12 am-u-lg-8" style="margin-top: 20px;">
									<form action="address_add" class="am-form am-form-horizontal">
									<input type="hidden" name="uid" value="${user.data.id}">
										<div class="am-form-group">
											<label for="user-name" class="am-form-label">收货人</label>
											<div class="am-form-content">
												<input type="text" id="user-name" name="adduser" placeholder="收货人">
											</div>
										</div>
										<div class="am-form-group">
											<label for="user-phone" class="am-form-label">手机号码</label>
											<div class="am-form-content">
												<input id="user-phone" name="phone" placeholder="手机号必填" type="text" pattern="^1[3456789]\d{9}$" required="required">
											</div>
										</div>
										
										
										<div class="am-form-group">
											<label for="user-intro" class="am-form-label">详细地址</label>
											<div class="am-form-content">
												<textarea class="" name="detailadd" rows="3" id="user-intro" placeholder="输入详细地址" style="reSize:none"></textarea>
												<small>100字以内写出你的详细地址...</small>
											</div>
										</div>

										<div class="am-form-group">
											<div class="am-u-sm-9 am-u-sm-push-3">
												<button class="am-btn am-btn-danger" style="width: 120px">保存</button>
											</div>
											<script type="text/javascript">
// 												if("${code}"==1){
// 													layer.msg("添加失败");
// 												}
												if("${code}"==2){
													layer.msg("已经上限了");
												}
// 												if("${code}"==0){
// 													layer.msg("添加成功");
// 												}
												
											</script>
										</div>
									</form>
								</div>

							</div>

						</div>

					</div>

					<script type="text/javascript">
						$(document).ready(function() {							
							$(".new-option-r").click(function() {
								$(this).parent('.user-addresslist').addClass("defaultAddr").siblings().removeClass("defaultAddr");
							});
							
							var $ww = $(window).width();
							if($ww>640) {
								$("#doc-modal-1").removeClass("am-modal am-modal-no-btn")
							}
							
						})
					</script>

					<div class="clear"></div>

				</div>
        
        
        
        
        
 
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
