package com.softeem.controller;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.softeem.service.OrdersService;

@Controller
public class OrdersController {

	@Resource(name="ordersServiceImpl")
	OrdersService orderservice;
	
	/**
	 * 用户点击提交订单，将订单信息存入到订单表中，并跳转到支付界面
	 * @param uid 用户id
	 * @param cartids 购物车id字符串
	 * @param addid 收货地址id
	 * @return
	 */
	@RequestMapping("createOrder")
	@ResponseBody
	public ModelAndView createOrder(String uid,String cartids,String addid,String paymoney){
		ModelAndView mav=new ModelAndView();
		//调用业务层存数据
		Map<String,Object> map=orderservice.createOrder(uid, cartids, addid);
		mav.addObject("ids",map.get("ids"));//待处理的订单id串
		mav.addObject("paymoney", paymoney);
		mav.setViewName("pay");
		return mav;
	}
	
	/**
	 * 制支付成功，将订单状态改为已支付
	 * @param uid
	 * @param ids
	 * @return
	 */
	@RequestMapping("success")
	@ResponseBody
	public ModelAndView success(String uid,String ids){
		ModelAndView mav=new ModelAndView();
		//调用业务层将订单状态改为支付状态
		orderservice.yetPay(uid, ids);
		mav.setViewName("success");
		
		return mav;
	}
	
	/**
	 * 查看所有订单
	 * @param uid
	 * @return
	 */
	@RequestMapping("myorder")
	@ResponseBody
	public ModelAndView OrderAll(String uid){
		ModelAndView mav=new ModelAndView();
		Map<String,Object> map=orderservice.orderAll(uid);
		mav.addObject("orderItemAll", map);
		mav.addObject("code", 0);//表示所有订单
		mav.setViewName("order");
		return mav;
	}
	
	/**
	 * 删除订单
	 * @param uid 用户id
	 * @param orderid 订单id
	 * @return
	 */
	@RequestMapping("delOrder")
	@ResponseBody
	public ModelAndView delOrder(String uid,String orderid){	
		ModelAndView mav=new ModelAndView();
		//调用业务层删除订单
		Map<String,Object> map=orderservice.delOrder(uid, orderid);
		mav.addObject("orderItemAll", map);
		mav.setViewName("order");
		return mav;
	}
	
	/**
	 * 查看所有待付款订单
	 * @param uid
	 * @return
	 */
	@RequestMapping("waitpayOrder")
	@ResponseBody
	public ModelAndView waitpayOrder(String uid){
		ModelAndView mav=new ModelAndView();
		//调用业务层
		Map<String,Object> map=orderservice.waitPayOrder(uid);
		mav.addObject("orderItemAll", map);
		mav.addObject("code", 1);//表示代付款订单
		mav.setViewName("order");
		return mav;
	}
	
	/**
	 * 查看已发货订单
	 * @param uid 用户id
	 * @return
	 */
	@RequestMapping("yetOrder")
	@ResponseBody
	public ModelAndView yetSendOrder(String uid){
		ModelAndView mav=new ModelAndView();
		//调用业务层
		Map<String,Object> map=orderservice.yetSendOrder(uid);
		mav.addObject("orderItemAll", map);
		mav.addObject("code", 2);//表示代已发货订单
		mav.setViewName("order");
		return mav;
	}
	
	/**
	 * 查询所有待评价订单
	 * @param uid 用户id
	 * @return
	 */
	@RequestMapping("waitevaluate")
	@ResponseBody
	public ModelAndView waitEvaluate(String uid){
		ModelAndView mav=new ModelAndView();
		//调用业务层
		Map<String,Object> map=orderservice.waitEvaluate(uid);
		mav.addObject("orderItemAll", map);
		mav.addObject("code", 3);//表示代已收货待评价订单
		mav.setViewName("order");
		return mav;
	}
	
	
	
	
}
