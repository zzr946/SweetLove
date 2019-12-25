<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!doctype html>
<html>
<head>
<meta name="keywords" content="甜爱，SweetLove,甜品，甜点，生日蛋糕，冰淇淋，冰品"/>
<meta name="description" content="甜爱网上商城是专注于甜品销售、进口的网站，各种甜品、甜点齐全，还有解暑的各种冰品任顾客挑选，让他们感受到爱的温馨。">
<meta charset="utf-8">
<title>我的甜品，你的爱~</title>
<link rel="shortcut icon" href="images/logo_01.png">
<link rel="stylesheet" href="css/userinfo.css">
<link rel="stylesheet" href="bootstrap/css/bootstrap.css" />
<script type="text/javascript" src="js/jquery-3.3.1.js"></script>
<script type="text/javascript" src="layer/layer.js"></script>
<style type="text/css">
	.hidden{
		display: none;
	}
	.check{
		checked:checked;
	}
	
</style>

</head>

<body>
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
             <li id="logout"><a style="text-decoration: none;cursor: pointer;">安全退出</a></li>
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
    	<form action="user_modifyphoto" method="post" enctype="multipart/form-data">
			<!--用户头像-->
    		<div class="filePic" >
    			<input type="hidden" name="hiddenuid" value="${user.data.id}">
				<input id="btn_file" name="myfile" type="file" class="inputPic" allowexts="gif,jpeg,jpg,png,bmp" accept="image/*">
				<img id="select_btn" class="am-circle am-img-thumbnail" src="images/getAvatar.do.jpg" width="100px" height="100px"/>
			</div>
			<input type="submit" class="hidden" id="modifyphoto" style="margin-top: 10px" value="修改头像">
		</form>
		
		<!-- 头像预览效果 -->
		<script type="text/javascript">
			//头像预览效果
				$(function(){
					$('#select_btn').click(function(){
						$('#btn_file').click();
					})
					$('#btn_file').change(function(event){
						var file=event.currentTarget.files[0];
										
						var reader=new FileReader();
										
						reader.onload=function(e){
							document.getElementById('select_btn').src=e.target.result;
						}
						reader.readAsDataURL(file);
					})
				})
		</script>
		<!-- 修改头像的方法 -->
		<script type="text/javascript">
			//用户头像改变后,“修改头像”的按钮显示出来
			$("#btn_file").change(function(){
				$("#modifyphoto").removeClass("hidden");
				//调整间距
				$("#usernickname").attr("style","margin-top:20px;")
			})
			//用户点击确认修改头像按钮后,判断是否修改成功
// 			var status="${status}";
// 			if(status==0){
// 				layer.msg("修改成功");
// 			}
// 			if(status==1){
// 				layer.msg("修改失败,请稍后再试");
// 			}
			
		</script>
		<!-- 默认显示的头像 -->
		<script type="text/javascript">
        	//判断用户是否设置头像
        	//var photo=${user.data.photo}
        	if("${user.data.photo}"){
        		//用户设置了头像则将头像显示到界面
        		$("#select_btn").attr("src","/userphoto/${user.data.photo}");
        	}else{
        		//用户没设置头像则显示默认头像
        		$("#userphoto").attr("src","images/getAvatar.do.jpg");
        	}
        </script>
		
        <p id="usernickname"><%-- ${user.data.phone} --%></p><!-- 用户昵称 -->
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
        <span></span>
        <ul>
        	<li><a href="userinfo.jsp" class="my">个人信息</a></li>
            <li><a href="myorder?uid=${user.data.id}">我的订单</a></li>
            <li><a href="addressAll?uid=${user.data.id}">地址管理</a></li>
            <li><a href="password.jsp">账号设置</a></li>
            <li><a href="goods_collectList">收藏夹</a></li>
        </ul>
    </div>
    <div class="right">
    	<ul>
    		<p>基本资料</p>
            <span></span>
        </ul>
        <div>
            <ol>
                <li>账&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;号</li>
                <li>昵&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;称</li>
                <li>性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别</li>
                <li>手机号码</li>
            </ol>
            <ul>
                <p>${user.data.phone}</p><!-- 账号（手机号） -->
                <div><input id="modifynickname" type="text" value="${user.data.nickname}"></div><!-- 昵称 -->
                <li>
                	<input id="nan" click="select(this)" name="gender" type="radio" value="nan" checked><label>男</label>
                    <input id="nv" click="select(this)" name="gender" type="radio"  value="nv" style="margin-left: 20px" ><label>女</label>
                	<input type="hidden" id="hiddensexnan" name="hiddensex" value="男"/>
                	<input type="hidden" id="hiddensexnv" name="hiddensex" value="女"/>
                </li>
                <p>${user.data.phone}</p><!-- 手机号 -->
            </ul>
            <script type="text/javascript">
            	//用户选择性别
            	function select(t){
            		//$("#hiddensex").val();
            		//获取用户选择的性别
            		var sex=$(t);
            		console.info(sex);
            		//将性别存入隐藏域中
            		$("#hiddensex").val(sex);
            	}
            </script>
        </div>
        <span></span>
        <a id="save" href="javascript:void(0)" style="text-decoration: none;">保存</a>
    </div>
    <script type="text/javascript">
    	$("#save").click(function(){
    		//获取用户id
    		var id=$("#id").val();
    		//获取昵称
    		var nickname=$("#modifynickname").val();
    		//获取性别
    		var sex=$("#hiddensexnan").val();
    		//console.info("用户id："+id);
    		//console.info("昵称："+nickname);
    		//console.info("性别："+sex);
    		
    		//向后台发送请求
        	$.ajax({
        		url:"/SweetLove/user_modifyuserinfo",//请求路径，需要写完整路径名
    			type:"get",//请求方式
    			data:{"id":id,"nickname":nickname,"sex":sex},//请求参数
    			datatype:"json",//返回的数据格式
    			//成功的回调
    			success:function(result){
    				//获取回调参数
    				var status=result.status;
    				if(status==0){
    					layer.msg("修改成功");
    					$("#usernickname").text(result.data.nickname);
    				}
    				if(status==1){
    					layer.msg("修改失败，请稍后再试");
    				}
    				
    			},
    			error:function(){
    				layer.msg("系统繁忙");
    			}
        	})
    		
    		
    	})
    	
    	
    	
    </script>
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
