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
<link rel="stylesheet" href="css/xiangqing.css">
<link rel="stylesheet" href="bootstrap/css/bootstrap.css" />
<script type="text/javascript" src="js/jquery-3.3.1.js"></script>
<script type="text/javascript" src="layer/layer.js"></script>

<style type="text/css">
	.hidden{
		display=none;
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
            <li id="order"><a href="myorder?uid=${user.data.id}" style="text-decoration: none;">我的订单</a></li>
            <a id="cart" href="goodscarAll?uid=${user.data.id}" class="shoppingCar">
            	<i></i>
            	<span>购物车</span>
            </a>
            <li id="logout"><a style="text-decoration: none;">安全退出</a></li>
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
            <li><a href="index.jsp">首页</a></li>
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
    <div class="flicker-example" data-block-text="false">
        <ul>
            <li data-background="images/banner_02.jpg">
                
            </li>
            <li data-background="images/banner3.jpg">
                
            </li>
            <li data-background="images/banner05.png">
                
            </li>
        </ul>
	</div>
</div>
<!--内容-->
<div id="contentCon">
	<ul>
    	<li>${goods.data.goodsname}</li><!--商品名-->
        
    </ul>
    <div id="show" style="margin-top: 20px">
    	<div>
        	<ul>
            	<li id="pic1"></li>
                <li id="pic2" class="pic02"></li>
                <li id="pic3" class="pic03"></li>
                <li id="pic4" class="pic04"></li>
            </ul>
            <ol id="mainpic"></ol>
        </div>
        <script type="text/javascript">
        	$("#pic1").attr("style","background:url(/goodsphoto/${goods.data.sample1}) center no-repeat;");
        	$("#pic2").attr("style","background:url(/goodsphoto/${goods.data.sample2}) center no-repeat;");
        	$("#pic3").attr("style","background:url(/goodsphoto/${goods.data.sample3}) center no-repeat;");
        	$("#pic4").attr("style","background:url(/goodsphoto/${goods.data.sample4}) center no-repeat;");
        	$("#mainpic").attr("style","background:url(/goodsphoto/${goods.data.sample5}) center no-repeat;background-size:contain;width: 548px;height: 486px;");
        	
        </script>
        <div class="right">
        	<p>【自营】 ${goods.data.goodsname}</p><!--商品名-->
            <div>
            	<ul>
                	<span>¥</span>
                	<h2>${goods.data.price}</h2><!--单价-->
                </ul>
                <ol>
                	<a href="javascript:void(0)" class="tehui" style="text-decoration: none;">特惠</a>
                    <a href="javascript:void(0)" style="text-decoration: none;">限时特价促销</a>
                </ol>
                <li>
                	<p>服务</p>
                    <div>
                    	<span>.</span>
                        <p>满88元包邮</p>
                        <span>.</span>
                        <p>不支持退换货</p>
                    </div>
                </li>
            </div>
            <ul>
            	<li class="check01">
                    <p>规格</p>
                    <span style="background-color: #E7E7E7">${goods.data.spce}</span><!--规格-->
                </li>
                <ol>
                    <p>数量</p>
                    <input id="sub" type="button" value="-" style="padding: 0; disabled">
                    <input id="num" type="button" value="1" style="background-color: #FFFFFF; padding: 0;">
                    <input id="add" type="button" value="+" style="padding: 0;">
            	</ol>
                <a href="javascript:void(0)" onclick="addcart(this)" class="car" style="text-decoration: none;">加入购物车</a>
                <input type="hidden" value="${goods.data.id}"><!-- 商品id -->
                <a onclick="coll(this)" class="love"></a><!--收藏-->
            </ul>
            <script type="text/javascript">
        	/* 收藏商品的方法 */
        	function coll(t){
        		//判断当前用户是否登录
        		if(!"${user}"){
        			layer.alert("请先登录！",function(){
        				location.href="login.jsp";
        			})
        			return;
        		}
        		//获取商品id
        		var gid=$(t).prev().val();
        		//获取用户id
        		var uid=$("#id").val();
        		//console.info(id);
        		//向后台请求，收藏商品
        		$.ajax({
        		url:"/SweetLove/goods_collect",//请求路径，需要写完整路径名
    			type:"get",//请求方式
    			data:{"gid":gid,"uid":uid},//请求参数
    			datatype:"json",//返回的数据格式
    			//成功的回调
    			success:function(result){
    				//获取回调参数
    				var status=result.status;
    				if(status==0){
    					layer.msg("收藏成功");
    				}
    				if(status==1){
    					layer.msg("收藏失败！请稍后再试");
    				}
    			},
    			error:function(){
    				layer.msg("系统繁忙");
    			}
        	})
        		
        	}
        </script>
            <script type="text/javascript">
            	/* 添加到购物车的方法 */
            	function addcart(t){
            		//获取用户id
            		var uid=$("#id").val();
            		if(uid==""){
            			//用户未登录
            			layer.msg("请先登录",{btn:['确认'],icon:1},function(){
						//将session中的内容清空，再跳转到登录页面
						location.href='login.jsp';
						})
						return;
            		}
            		//获取商品id
            		var gid=$(t).next().val();
            		//获取购买数量
            		var number=$($(t).prev().children()[2]).val();
            		
            		//向后台发送请求
		        	$.ajax({
		        		url:"/SweetLove/addcart",//请求路径，需要写完整路径名
		    			type:"get",//请求方式
		    			data:{"uid":uid,"gid":gid,"number":number},//请求参数
		    			datatype:"json",//返回的数据格式
		    			//成功的回调
		    			success:function(result){
		    				//获取回调参数
		    				var status=result.status;
		    				if(status==0){
		    					layer.msg("添加成功");
		    				}
		    				if(status==1){
		    					layer.msg("添加失败，请稍后再试");
		    				}
		    			},
		    			error:function(){
		    				layer.msg("系统繁忙");
		    			}
		        	})
            		
            		
            		
            	}
            	
            </script>
            
            
            <script type="text/javascript">
            	//点击减少商品按钮
            	$("#sub").click(function(){
            		//获取数量
            		var num=$("#num").val();
            		if(num>1){
            			$("#sub").removeAttr("disabled");
            			//return;
            		}
            		if(num<=1){
            			return;
            			//$("#sub").attr("disabled");
            		}
            		//商品数量--
            		$("#num").val(--num);
            	})
            	//点击增加商品按钮
            	$("#add").click(function(){
            		//获取商品数量
            		var num=$("#num").val();
            		//商品数量++
            		$("#num").val(++num);
            	})
            	
            </script>
        </div>
    </div>
    
    <div id="origin">
    	<ul>
        	<div>
            	<p>Origin</p>
                <span></span>
            </div>
            <p>商品起源</p>
            <span></span>
        </ul>
        <ol>
        	<li id="gushipic"></li>
            <div>
            	<!--小故事-->
            	<p>${goods.data.origin}</p>
            </div>
        </ol>
        <script type="text/javascript">
        	$("#gushipic").attr("style","background:url(/goodsphoto/${goods.data.sample1}) center no-repeat;background-size:contain;")
        </script>
    </div>
    <div id="Indredient">
    	<ul>
        	<div>
            	<p>Indredient</p>
                <span></span>
            </div>
            <p>商品成分</p>
            <span></span>
        </ul>
        <ol></ol>
    </div>
    <div id="show">
    	<ul>
        	<div>
            	<p>Show</p>
                <span></span>
            </div>
            <p>商品展示</p>
            <span></span>
        </ul>
        <ol>
            <div>
            	<img src="/goodsphoto/${goods.data.sample2}" style="width: 1200px; height: 650px;" />
            </div>
        </ol>
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
            <a href="index.html"  style="text-decoration: none;">www.sweetlove.com</a>
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
        <p>Copyright © 2019 sweetlove.com Inc.All Rights Reserved. </p>
    </li>
</div>
</body>
</html>
