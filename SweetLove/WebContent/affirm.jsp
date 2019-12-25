<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html>
<head>
<meta name="keywords" content="甜爱，SweetLove,甜品，甜点，生日蛋糕，冰淇淋，冰品"/>
<meta name="description" content="甜爱网上商城是专注于甜品销售、进口的网站，各种甜品、甜点齐全，还有解暑的各种冰品任顾客挑选，让他们感受到爱的温馨。">
<meta charset="utf-8">
<title>我的甜品，你的爱~</title>
<link rel="shortcut icon" href="images/logo_01.png">
<link rel="stylesheet" href="css/shoppingCar.css"> 
<link rel="stylesheet" href="css/reset.css">
<link rel="stylesheet" href="css/carts.css">
<link rel="stylesheet" href="bootstrap/css/bootstrap.css" />
<script type="text/javascript" src="js/jquery-3.3.1.js"></script>
<script type="text/javascript" src="layer/layer.js"></script>

<link href="css/amazeui.css" rel="stylesheet" type="text/css" />
<link href="css/demo.css" rel="stylesheet" type="text/css" />
<link href="css/cartstyle.css" rel="stylesheet" type="text/css" />
<link href="css/jsstyle.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/address.js"></script>

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
        <p>确认订单</p>
        <ol>
            <li>
            	<div class="my"><img src="images/shopCar_08.png"></div>
                <p class="red">我的购物车</p>
            </li>
            <li>
            	<div class="order"><img src="images/pay_03.jpg"></div>
                <p>确认订单</p>
            </li>
            <li class="pay">
            	<div class="pay"><img src="images/shopCar_11.png" style="width: 156px"></div>
                <p>支付</p>
            </li>
            <li class="bingo">
            	<div class="bingo"><img src="images/shopCar_05.png"></div>
                <p>完成</p>
            </li>
        </ol>
    </ul>
</div>
<!--内容-->
	<div class="address" style="width: 1000px;height: 210px;margin: 10px auto 30px;">
		<h3>确认收货地址 </h3>
		<div class="control">
		</div>
		<div class="clear"></div>
		<ul>
			<div class="per-border"></div>
			<!-- 收货地址 -->
			<c:forEach var="address" items="${affirmAddress}" varStatus="s">
				<input type="hidden" value="${address.id}">
				<li class="user-addresslist" onclick="select(this)">
					<div class="address-left">
						<div class="user DefaultAddr">
							<span class="buy-address-detail">   
	               			<span class="buy-user">${address.adduser}</span><!-- 收货人姓名 -->
							<span class="buy-phone">${address.phone}</span><!-- 收货人手机号 -->
							</span>
						</div>
						<div class="default-address DefaultAddr">
							<span class="buy-line-title buy-line-title-type">收货地址：</span>
							<span class="buy--address-detail">
							<span class="street">${address.detailadd}</span><!-- 详细收货地址 -->
							</span>
						</div>
						<input class="hiddencode" type="hidden" value="${address.status}">
						<ins class="deftip" hidden>默认地址</ins>
					</div>
					<div class="address-right">
						<a href="../person/address.html">
							<span class="am-icon-angle-right am-icon-lg"></span></a>
					</div>
					<div class="clear"></div>
				</li>
			</c:forEach>
			<div class="per-border"></div>
		</ul>
		<script type="text/javascript">
			$(function(){
				//显示默认地址
				var addstatus=$(".hiddencode[value=2]").next().removeAttr("hidden");
				//选中默认地址
				var a=$(".hiddencode[value=2]").parent().parent().addClass("defaultAddr");
			})
		</script>
		<script type="text/javascript">
			//下面显示的收货地址	
			function select(t){
				//获取收货地址
				var address=$($($($($(t).children()[0]).children()[1]).children()[1]).children()[0]).text();
				//console.info(address);
				//设置收货地址
				$("#dateiladd").text(address);
				
				//获取收货人
				var people=$($($($(t).children()[0]).children()[0]).children()[0]).children()[0].innerText;
				//获取收货人电话
				var phone=$($($($(t).children()[0]).children()[0]).children()[0]).children()[1].innerText;
				//获取收货地址id
				var addressid=$(t).prev().val();
				//console.info(people);
				//console.info(phone);
				//console.info(addressid);
				//设置收货人姓名与电话
				$("#peoplename").text(people);
				$("#peoplephone").text(phone);
				//设置收货人id
				$("#hidden_addid").val(addressid);
			}
		</script>
		<div class="clear"></div>
	</div>
	<!-- 订单 -->
	<div class="concent" >
						<div id="payTable">
							<h3>确认订单信息</h3>
							<div class="cart-table-th">
								<div class="wp">

									<div class="th th-item">
										<div class="td-inner">商品信息</div>
									</div>
									<div class="th th-price">
										<div class="td-inner">单价</div>
									</div>
									<div class="th th-amount">
										<div class="td-inner">数量</div>
									</div>
									<div class="th th-sum">
										<div class="td-inner">金额</div>
									</div>
									<div class="th th-oplist">
										<div class="td-inner">配送方式</div>
									</div>

								</div>
							</div>
							<div class="clear"></div>
							<c:forEach var="cartItem" items="${cartItemList}" varStatus="s">
							<input type="hidden" class="hiddengid" value="${cartItem.id}">
							<tr class="item-list">
								<div class="bundle  bundle-last">
									<div class="bundle-main">
										<ul class="item-content clearfix">
											<div class="pay-phone">
												<li class="td td-item">
													<div class="item-pic">
														<a href="#" class="J_MakePoint">
															<img src="/goodsphoto/${cartItem.goodsphoto}" class="itempic J_ItemImg" width="80px" height="80px"></a>
													</div>
													<div class="item-info">
														<div class="item-basic-info">
															<a href="#" class="item-title J_MakePoint" data-point="tbcart.8.11">${cartItem.goodsname}</a>
														</div>
													</div>
												</li>
												<li class="td td-info">
													<div class="item-props">
														<span class="sku-line">规格：${cartItem.spce}</span>
													</div>
												</li>
												<li class="td td-price">
													<div class="item-price price-promo-promo">
														<div class="price-content">
															<em class="J_Price price-now">${cartItem.price}.00</em>
														</div>
													</div>
												</li>
											</div>
											<li class="td td-amount">
												<div class="amount-wrapper ">
													<div class="item-amount ">
														<span class="phone-title">购买数量</span>
														<div class="sl">
																<span>${cartItem.number}</span>
<!-- 															<input class="min am-btn" name="" type="button" value="-" /> -->
<%-- 															<input class="text_box" name="" type="text" value="${cartItem.number}" style="width:30px;" /> --%>
<!-- 															<input class="add am-btn" name="" type="button" value="+" /> -->
														</div>
													</div>
												</div>
											</li>
											<li class="td td-sum">
												<div class="td-inner">
													<em tabindex="0" class="J_ItemSum number">${cartItem.total}</em>
												</div>
											</li>
											<li class="td td-oplist">
												<div class="td-inner">
													<span class="phone-title">配送方式</span>
													<div class="pay-logis">
														<b class="sys_item_freprice">包邮</b>
													</div>
												</div>
											</li>

										</ul>
										<div class="clear"></div>

									</div>
							</tr>
							</c:forEach>
							<div class="clear"></div>
							</div>

							
							</div>
							<div class="clear"></div>
							
							<!--含运费小计 -->
							<div class="buy-point-discharge ">
								<p class="price g_price ">
									合计（含运费） <span>¥</span><em class="pay-sum">${sumprice}</em>
								</p>
							</div>

							<!--信息 -->
							<div class="order-go clearfix">
								<div class="pay-confirm clearfix">
									<div class="box">
										<div tabindex="0" id="holyshit267" class="realPay"><em class="t">实付款：</em>
											<span class="price g_price ">
                                    <span>¥</span> <em class="style-large-bold-red " id="J_ActualFee">${sumprice}</em>
											</span>
										</div>

										<div id="holyshit268" class="pay-address">
											<input type="hidden" id="hidden_addid"><!-- 收货信息id -->
											<p class="buy-footer-address">
												<span class="buy-line-title buy-line-title-type">寄送至：</span>
												<span class="buy--address-detail">
												<span class="street" id="dateiladd"></span><!-- 详细收货地址 -->
												</span>
												</span>
											</p>
											<p class="buy-footer-address">
												<span class="buy-line-title">收货人：</span>
												<span class="buy-address-detail">   
                                         <span class="buy-user" id="peoplename"> </span><!-- 收货人姓名 -->
												<span class="buy-phone" id="peoplephone"></span><!-- 收货人电话 -->
												</span>
											</p>
										</div>
									</div>

									<div id="holyshit269" class="submitOrder">
										<div class="go-btn-wrap">
											<a id="J_Go" href="javascript:void(0)" class="btn-go" tabindex="0" title="点击此按钮，提交订单">提交订单</a>
										</div>
									</div>
									<div class="clear"></div>
								</div>
							</div>
						</div>
						<div class="clear"></div>
					</div>
					
					<script type="text/javascript">
						//用户点击提交订单按钮
						$("#J_Go").click(function(){
							//获取用户id
							var uid=$("#id").val();//用户id
							//获取购物车id字符串
							var $ids=$(".hiddengid");
							var ids="";
							for(var i=0;i<$ids.length;i++){
								ids+=$ids[i].value+"~";
							}
							cartids=ids.substring(0,ids.length-1);//购物车id字符串
							//console.info(uid);
							//console.info(ids);
							//获取收货信息id
							var addid=$("#hidden_addid").val();
							console.info("addid:"+addid);
							
							//获取总金额
							var money=$("#J_ActualFee").text();
							console.info("money:"+money);
							if(addid==""){
								layer.msg("请先选择收货地址");
								return;
							}
							//向后台发送请求
							location.href="createOrder?uid="+uid+"&cartids="+cartids+"&addid="+addid+"&paymoney="+money;
							/* $.ajax({
				        		url:"/SweetLove/createOrder",//请求路径，需要写完整路径名
				    			type:"get",//请求方式
				    			data:{"uid":uid,"cartids":cartids,"addid":addid,"paymoney":money},//请求参数
				    			datatype:"json",//返回的数据格式
				    			//成功的回调
				    			success:function(result){
				    				//获取回调参数
				    			},
				    			error:function(){
				    				layer.msg("系统繁忙");
				    			}
				        	}) */
						})
					</script>
<!--页脚-->
</body>
</html>
