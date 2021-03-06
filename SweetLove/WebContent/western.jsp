<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta name="keywords" content="甜爱，SweetLove,甜品，甜点，生日蛋糕，冰淇淋，冰品"/>
<meta name="description" content="甜爱网上商城是专注于甜品销售、进口的网站，各种甜品、甜点齐全，还有解暑的各种冰品任顾客挑选，让他们感受到爱的温馨。">
<meta charset="utf-8">
<title>我的甜品，你的爱~</title>
<link rel="shortcut icon" href="images/logo_01.png">
<link rel="stylesheet" href="css/western.css">
<link rel="stylesheet" href="bootstrap/css/bootstrap.css" />
<script type="text/javascript" src="js/jquery-3.3.1.js"></script>
<script type="text/javascript" src="layer/layer.js"></script>
<style type="text/css">
	.hidden{
		display: none;
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
            <li><a href="index.jsp" >首页</a></li>
            <li><a href="western.jsp" class="first">西式甜品</a></li>
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
	<div class="French">
    	<ul>
        	<p>French</p>
            <span>法国</span>
            <a href="goods_list" style="text-decoration: none;">查看更多美味&gt;&gt;</a>
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
        <ol>
        	<li class="su">
            	<a href="goods_xiangqing?id=6ee9655c-85e9-407c-95b9-90c9d023cba6"></a>
                <p>拿破仑千层酥</p>
                <div>
                	<input type="hidden" id="gid" value="6ee9655c-85e9-407c-95b9-90c9d023cba6">
                	<a onclick="coll(this)" class="shoucang"></a><!-- 收藏 -->
                    <a href="shoppingCar.html" class="car"></a><!-- 加入购物车 -->
                    <a href="goods_xiangqing?id=6ee9655c-85e9-407c-95b9-90c9d023cba6" class="btn" style="line-height: 12px;text-decoration: none;">马上抢</a>
                </div>
            </li>
            <li class="makalong">
            	<a href="goods_xiangqing?id=9ffd11d9-4d98-452e-a61c-77f4c8b0b980"></a>
                <p>马卡龙-少女的酥胸</p>
                <div>
                <input type="hidden" id="gid" value="9ffd11d9-4d98-452e-a61c-77f4c8b0b980">
                	<a onclick="coll(this)" class="shoucang"></a>
                    <a href="shoppingCar.html" class="car"></a>
                    <a href="goods_xiangqing?id=9ffd11d9-4d98-452e-a61c-77f4c8b0b980" class="btn" style="line-height: 12px;text-decoration: none;">马上抢</a>
                </div>
            </li>
            <li class="musi">
            	<a href="goods_xiangqing?id=b0d8543b-a098-4997-be40-fb1bef830017"></a>
                <p>慕 &nbsp;斯 &nbsp;蛋 &nbsp;糕</p>
                <div>
               		<input type="hidden" id="gid" value="b0d8543b-a098-4997-be40-fb1bef830017">
                	<a onclick="coll(this)" class="shoucang"></a>
                    <a href="shoppingCar.html" class="car"></a>
                    <a href="goods_xiangqing?id=b0d8543b-a098-4997-be40-fb1bef830017" class="btn" style="line-height: 12px;text-decoration: none;">马上抢</a>
                </div>
            </li>
            <li class="geju">
            	<a href="goods_xiangqing?id=c975969b-b158-4b78-ab45-9f0b27299991"></a>
                <p>巧克力歌剧院</p>
                <div>
                	<input type="hidden" id="gid" value="c975969b-b158-4b78-ab45-9f0b27299991">
                	<a onclick="coll(this)" class="shoucang"></a>
                    <a href="shoppingCar.html" class="car"></a>
                    <a href="goods_xiangqing?id=c975969b-b158-4b78-ab45-9f0b27299991" class="btn" style="line-height: 12px;text-decoration: none;">马上抢</a>
                </div>
            </li>
        </ol>
    </div>
    <div class="Italy">
    	<ul>
        	<p>Italy</p>
            <span>意大利</span>
            <a href="goods_list" style="text-decoration: none;">查看更多美味&gt;&gt;</a>
        </ul>
        <ol>
        	<li class="left">
                <div>
                    <p>外交官方糕</p>
                    <a href="goods_xiangqing?id=15ae8c64-a63e-4b0f-938d-42f5fe0ceb68" style="line-height: 24px;text-decoration: none;">马上抢</a>
                </div>
            </li>
            <li class="right">
            	<ul>
                	<li class="top01">
                    	<div>
                            <p>千层酥</p>
                            <a href="goods_xiangqing?id=d7a697bf-b3b1-4923-a4b6-c280232e424e" style="line-height: 24px;text-decoration: none;">马上抢</a>
                        </div>
                    </li>
                    <li class="top02">
                    	<div>
                            <p>杏仁糖</p>
                            <a href="goods_xiangqing?id=732d0717-1f7d-40e0-9305-af45fad85f6e" style="line-height: 24px;text-decoration: none;">马上抢</a>
                        </div>
                    </li>
                </ul>
                <ul class="bottom">
                	<li class="top01">
                    	<div>
                            <p>千层酥</p>
                            <a href="goods_xiangqing?id=d7a697bf-b3b1-4923-a4b6-c280232e424e" style="line-height: 24px; text-decoration: none;">马上抢</a>
                        </div>
                    </li>
                    <li class="top02">
                    	<div>
                            <p>杏仁糖</p>
                            <a href="goods_xiangqing?id=732d0717-1f7d-40e0-9305-af45fad85f6e" style="line-height: 24px; text-decoration: none;text-decoration: none;">马上抢</a>
                        </div>
                    </li>
                </ul>
            </li>
        </ol>
    </div>
    <div class="French">
    	<ul>
        	<p>Austria</p>
            <span>奥地利</span>
            <a href="goods_list" style="text-decoration: none;">查看更多美味&gt;&gt;</a>
        </ul>
        <ol>
        	<li class="su">
            	<a href="goods_xiangqing?id=3010d51c-2162-444f-84b5-dc5e0819e9df" class="shahe"></a>
                <p>沙 &nbsp;河 &nbsp;蛋 &nbsp;糕</p>
                <div>
                	<input type="hidden" id="gid" value="3010d51c-2162-444f-84b5-dc5e0819e9df">
                	<a onclick="coll(this)" class="shoucang"></a>
                    <a href="shoppingCar.html" class="car"></a>
                    <a href="goods_xiangqing?id=3010d51c-2162-444f-84b5-dc5e0819e9df" class="btn"style="line-height: 10px; text-decoration: none">马上抢</a>
                </div>
            </li>
            <li class="makalong">
            	<a href="goods_xiangqing?id=02ebb1bd-82e4-4c0d-b910-e536b14efb3f" class="moon"></a>
                <p>香酥新月小面包</p>
                <div>
                	<input type="hidden" id="gid" value="02ebb1bd-82e4-4c0d-b910-e536b14efb3f">
                	<a onclick="coll(this)" class="shoucang"></a>
                    <a href="shoppingCar.html" class="car"></a>
                    <a href="goods_xiangqing?id=02ebb1bd-82e4-4c0d-b910-e536b14efb3f" class="btn" style="line-height: 10px; text-decoration: none">马上抢</a>
                </div>
            </li>
            <li class="musi">
            	<a href="goods_xiangqing?id=9322de79-36c1-4c8e-9391-7d0d4af9ea9f" class="apple"></a>
                <p>苹 &nbsp;果 &nbsp;卷</p>
                <div>
                	<input type="hidden" id="gid" value="9322de79-36c1-4c8e-9391-7d0d4af9ea9f">
                	<a onclick="coll(this)" class="shoucang"></a>
                    <a href="shoppingCar.html" class="car"></a>
                    <a href="goods_xiangqing?id=9322de79-36c1-4c8e-9391-7d0d4af9ea9f" class="btn" style="line-height: 10px; text-decoration: none">马上抢</a>
                </div>
            </li>
            <li class="geju">
            	<a href="goods_xiangqing?id=c5f50cbf-966a-4b51-88d9-2ccbc75907aa" class="king"></a>
                <p>皇家薄酥糕</p>
                <div>
                	<input type="hidden" id="gid" value="c5f50cbf-966a-4b51-88d9-2ccbc75907aa">
                	<a onclick="coll(this)" class="shoucang"></a>
                    <a href="shoppingCar.html" class="car"></a>
                    <a href="goods_xiangqing?id=c5f50cbf-966a-4b51-88d9-2ccbc75907aa" class="btn" style="line-height: 10px; text-decoration: none">马上抢</a>
                </div>
            </li>
        </ol>
    </div>
    <div class="Italy">
    	<ul>
        	<p>Italy</p>
            <span>美国</span>
            <a href="goods_list">查看更多美味&gt;&gt;</a>
        </ul>
        <ol>
        	<li class="left02">
                <div>
                    <p>可颂甜甜圈</p>
                    <a href="goods_xiangqing?id=95c5efc7-0470-441a-91b8-5fa9572eed2e" style="line-height: 24px; text-decoration: none">马上抢</a>
                </div>
            </li>
            <li class="right">
            	<ul>
                	<li class="top01_01">
                    	<div>
                            <p>千层蛋糕</p>
                            <a href="goods_xiangqing?id=d9f2a6d6-6686-43ac-98fe-cd7d3e82a7f0" style="line-height: 24px; text-decoration: none">马上抢</a>
                        </div>
                    </li>
                    <li class="top02_02">
                    	<div>
                            <p>彩虹刨冰</p>
                            <a href="goods_xiangqing?id=37f869f3-39ed-4898-9265-06147fb58219" style="line-height: 24px; text-decoration: none">马上抢</a>
                        </div>
                    </li>
                </ul>
                <ul class="bottom">
                	<li class="top01_01">
                    	<div>
                            <p>柠檬派</p>
                            <a href="goods_xiangqing?id=e0950cef-8f0f-4817-905f-7c41b1af4277" style="line-height: 24px; text-decoration: none">马上抢</a>
                        </div>
                    </li>
                    <li class="top02_02">
                    	<div>
                            <p>火烧香蕉船冰淇淋</p>
                            <a href="goods_xiangqing?id=f6cc20c8-8462-439e-b77b-862ffcfdb36f" style="line-height: 24px; text-decoration: none">马上抢</a>
                        </div>
                    </li>
                </ul>
            </li>
        </ol>
    </div>
    <ul><a href="goods_list" style="text-decoration: none;">查看更多国家美味&gt;&gt;</a></ul>
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
            <a href="index.html" style="text-decoration: none;">www.sweetlove.com</a>
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

<script>
  	//这里我用的是svg，所以代码老长了，可以把svg部分换成自己的图片什么的
$(function(){
    var obj = $('<div style="width:3rem;position:fixed;top:90%;right:1.6%;height:1.3rem;text-align:center;display: none;"class="Bottomsetting"><svg class="icon" style="height:3.5rem;vertical-align: middle;fill: #F54043;overflow: hidden;" viewBox="0 0 1026 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="22374"><path d="M517.64662 0.191659a511.920142 511.920142 0 1 0 0 1023.776398 511.920142 511.920142 0 0 0 0-1023.776398z m0 986.275197a474.418941 474.418941 0 1 1 474.355055-474.418941c0 261.933431-212.48551 474.418941-474.355055 474.418941z m0 0M667.204221 382.997785L530.10443 244.939701a15.332689 15.332689 0 0 0-10.988427-4.472034c-0.51109-0.127772-0.958293-0.319431-1.469383-0.319431a15.716006 15.716006 0 0 0-6.260848 1.34161 13.927192 13.927192 0 0 0-5.302555 3.385969L382.335643 368.431731a15.204916 15.204916 0 1 0 21.593536 21.52965l98.448639-98.193093v268.833141a15.204916 15.204916 0 1 0 30.473718 0v-269.599776l112.631376 113.39801a15.268802 15.268802 0 0 0 21.593536 0.063886 14.949371 14.949371 0 0 0 0.127773-21.465764z m18.271454-173.323268H349.689793a15.332689 15.332689 0 0 1-15.332688-15.268802c0-8.432979 6.89971-15.204916 15.332688-15.204916h335.785882a15.204916 15.204916 0 1 1 0 30.473718z m0 0M269.512609 618.418442c7.985775 0.51109 15.907664 0.958293 23.765667 0.958293h28.748791c7.985775 0 16.163209-0.447203 24.787847-1.022179v16.738185c-10.60511-0.51109-19.165861-1.022179-25.74614-1.022179v149.685373c0 13.160558-4.088717 21.146333-12.330037 23.829553a366.706804 366.706804 0 0 1-29.259881 7.730231 70.913685 70.913685 0 0 0-7.985775-23.637895c9.966248 0 17.50482-0.319431 22.743488-1.022179 5.366441-0.638862 7.985775-5.238669 7.985776-13.863306V634.134448c-13.224444 0-24.085098 0.51109-32.709736 1.022179V618.418442z m66.377764 191.019746c18.590885-3.833172 33.220825-9.263499 44.145366-15.716006a47.020245 47.020245 0 0 0 21.274106-24.340643c3.258196-9.58293 5.366441-21.082447 6.38862-34.562436 1.022179-13.671647 1.213838-27.726612 0.51109-42.164893 7.985775 1.277724 15.524347 2.236017 22.807374 3.002651-1.980472 7.219141-3.322083 17.249275-3.960944 30.154288-0.702748 12.777241-2.363789 26.385002-4.983124 40.631625s-10.285679 26.512774-22.743488 37.18177a158.182238 158.182238 0 0 1-49.511807 26.640546 58.136444 58.136444 0 0 0-13.927193-20.826902z m67.399944-150.452007c1.277724-11.243972 2.299903-22.168512 2.938766-32.837508h-18.782544c-7.921889 0-18.782544 0.447203-32.64585 1.022179v-16.738185c13.160558 0.574976 24.021212 0.958293 32.64585 0.958293h72.255295c11.243972 0 22.424057-0.383317 33.731915-1.022179v16.802071a745.743644 745.743644 0 0 0-33.731915-0.958293h-32.645849a475.057803 475.057803 0 0 0-4.919238 32.773622h58.391989c-0.638862 9.774589-0.958293 28.684905-0.958293 56.475403 0 27.726612 0.319431 47.148018 0.958293 58.328103h-19.804723V673.80778H380.546829v102.026266H361.636513c0.766634-11.180085 1.022179-30.601491 1.022179-58.519762 0-28.301588-0.255545-47.722993-1.022179-58.264217h41.653804v-0.063886zM467.68761 790.719531c10.60511 7.985775 20.826902 15.907664 30.729263 23.701781a144.702249 144.702249 0 0 0-16.929844 17.824251 286.593505 286.593505 0 0 0-28.684905-27.215523 332.27214 332.27214 0 0 0-25.746139-18.271454 114.356303 114.356303 0 0 0 15.843778-14.885485c6.005303 4.663693 14.182737 10.924541 24.787847 18.84643z m0 0M614.689762 624.232087c-4.024831 1.980472-7.666344 4.024831-10.924541 6.005303 27.854384 0 45.231432-0.319431 52.514459-1.02218v18.910316c-4.663693 0-13.543875-0.319431-26.704433-1.022179l16.802072 7.921889a373.478741 373.478741 0 0 0-19.804723 38.587267c15.779892 0 27.982157-0.319431 36.67068-1.02218v18.84643a321.858689 321.858689 0 0 0-25.873912-1.022179h-74.235768c-11.882834 0-21.785195 0.319431-29.643198 1.022179v-18.782543c4.599807 0.702748 17.185389 1.022179 37.628974 1.022179a259.697414 259.697414 0 0 0-17.824251-34.690208l16.865958-9.007955c6.516393 9.263499 13.416103 20.826902 20.699129 34.754095-6.516393 3.385969-11.499516 6.260848-14.693826 8.944068h31.62367c8.496865-20.443585 13.927192-36.031818 15.843778-46.573042h-23.829553c-30.409832 0-50.086783 0.255545-59.414169 1.022179v-18.910316c7.921889 0.702748 25.74614 1.022179 53.408866 1.02218a111.289765 111.289765 0 0 0-15.716006-24.723961c5.941417-3.258196 11.243972-6.644165 15.716006-9.966247 10.668996 13.224444 17.632592 22.871261 20.890788 28.684905z m29.707084 155.562903c0 15.14103 0.255545 31.048695 1.02218 47.531335h-19.804723v-19.740837h-53.472752v19.740837h-19.868609c0.638862-13.927192 1.022179-28.365474 1.022179-43.57039 0-15.907664-0.383317-32.454191-1.022179-49.575694h93.082197a989.59728 989.59728 0 0 0-0.958293 45.614749z m-18.782543 11.94672v-41.653804h-53.472752v41.589918h53.472752v0.063886z m128.155722-58.903079c5.749758 10.221792 8.113548 20.507471 7.602458 31.048695a29.643198 29.643198 0 0 1-13.543875 24.276757c-8.24132 5.685872-20.507471 9.519044-37.053997 11.563402a84.138129 84.138129 0 0 0-8.944069-23.893439c15.907664 0 26.257229-1.788814 31.240354-5.430328s7.219141-8.496865 6.963596-14.310509c-0.51109-6.005303-3.897058-14.182737-10.541224-24.851733a163.548679 163.548679 0 0 0-22.743488-28.621019c5.302555-12.010606 12.202265-34.690208 20.890788-68.486009h-35.840159v195.236235h-19.676951c0.51109-13.991078 1.022179-29.643198 1.022179-47.531334V661.030539c0-14.62994-0.766634-29.132108-1.980472-43.634276h83.179836a2112.077861 2112.077861 0 0 1-26.832205 82.221543c11.94672 11.882834 20.763016 22.999033 26.257229 33.220825z m0 0" p-id="22375"></path></svg></div>');
    $("body").append(obj);  
    $(document).scroll(function() {
        var dh=$(window).height();//网页可视区高度
        var hidtop=$(document).scrollTop();//网页被卷去的高度
        if(dh>hidtop){
            $(".Bottomsetting").fadeOut()
        }else if(dh<hidtop){
            $(".Bottomsetting").fadeIn()
        }
      });
      $(".Bottomsetting").on("click",function(){
        $('html,body').animate({scrollTop:0},500);
   })
})
  </script>

</body>
</html>
