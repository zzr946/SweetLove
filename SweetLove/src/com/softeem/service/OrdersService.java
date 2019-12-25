package com.softeem.service;

import java.util.Map;

public interface OrdersService {
	
	//生成订单的方法（待支付）
	public Map<String,Object> createOrder(String uid,String cartids,String addid);
	
	//用户完成支付（已支付，待发货）
	public Map<String,Object> yetPay(String uid,String ids);
	
	//查看所有订单
	public Map<String,Object> orderAll(String uid);
	
	//删除订单
	public Map<String,Object> delOrder(String uid,String orderid);
	
	//查询待付款订单
	public Map<String,Object> waitPayOrder(String uid);
	
	//查询所有待发货的订单
	public Map<String,Object> yetSendOrder(String uid);
	
	//查询所有待评价
	public Map<String,Object> waitEvaluate(String uid);
	
}
