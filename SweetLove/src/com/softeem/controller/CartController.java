package com.softeem.controller;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.softeem.service.CartService;

@Controller
public class CartController {
	
	@Resource(name="cartServiceImpl")
	CartService cartservice;
	
	/**
	 * 将商品天机到购物车
	 * @param uid 用户id
	 * @param gid 商品id
	 * @param number 购买数量
	 * @param session
	 * @return
	 */
	@RequestMapping("addcart")
	@ResponseBody
	public Map<String,Object> addCart(String uid,String gid,String number,HttpSession session){
		Map<String,Object> map=new HashMap<String, Object>();
		//将结果存入到session中
		session.setAttribute("goodscart", map);
		return cartservice.addCart(uid, gid, number);
	}
	
	/**
	 * 点击购物车，加载所有购物车中的商品
	 * @param uid 用户id
	 * @return
	 */
	@RequestMapping("goodscarAll")
	public ModelAndView goodsCarAll(String uid,HttpSession session){
		ModelAndView mav=new ModelAndView();
		//调用业务层查询所有商品
		Map<String,Object> map=cartservice.cartAll(uid);
		mav.setViewName("shoppingCar");
		session.setAttribute("goodscart", map);
		//mav.addObject("goodscart",map);
		return mav;
	}
	
	/**
	 * 用户从购物车中删除商品
	 * @param uid 用户id
	 * @param gid 商品id
	 * @return
	 */
	@RequestMapping("delgoods")
	public ModelAndView delCartGoods(String uid,String gid,HttpSession session){
		ModelAndView mav=new ModelAndView();
		//调用业务层删除商品
		Map<String,Object> map=cartservice.delGoods(uid, gid);
		session.setAttribute("goodscart", map);
		mav.setViewName("shoppingCar");
		return mav;
	}
	
	/**
	 * 增加商品数量
	 * @param uid
	 * @param gid
	 * @param number
	 * @param price
	 * @param session
	 * @return
	 */
	@RequestMapping("addnum")
	@ResponseBody
	public ModelAndView addGoodsNum(String uid,String gid,String number,String price,HttpSession session){
		ModelAndView mav=new ModelAndView();
		System.out.println(uid);
		System.out.println(gid);
		System.out.println(number);
		//调用业务层增加商品数量
		Map<String,Object> map=cartservice.addGoodsNumber(uid, gid,number,price);
		session.setAttribute("goodscart", map);
		mav.setViewName("shoppingCar");
		return mav;
	}
	
	/**
	 * 减少购物车中商品的数量
	 * @param uid
	 * @param gid
	 * @param number
	 * @param price
	 * @param session
	 * @return
	 */
	@RequestMapping("subnum")
	@ResponseBody
	public ModelAndView subGoodsNum(String uid,String gid,String number,String price,HttpSession session){
		ModelAndView mav=new ModelAndView();
		System.out.println(uid);
		System.out.println(gid);
		System.out.println(number);
		//调用业务层增加商品数量
		Map<String,Object> map=cartservice.subGoodsNumber(uid, gid,number,price);
		session.setAttribute("goodscart", map);
		mav.setViewName("shoppingCar");
		return mav;
	}
	
	/**
	 * 用户进入到确认订单页面
	 * @param uid
	 * @param gids
	 * @param sumprice
	 * @return
	 */
	@RequestMapping("affirmOrder")
	@ResponseBody
	public ModelAndView affirmOrder(String uid,String gids,String sumprice,HttpSession session){
		ModelAndView mav=new ModelAndView();
		System.out.println(gids);
		//调用业务层
		Map<String,Object> map=cartservice.affirmBuy(uid, gids, sumprice);
		//将数据存入session中
		session.setAttribute("affirmAddress", map.get("addressList"));//地址
		session.setAttribute("cartItemList", map.get("cartItemList"));//购买的商品
		System.out.println(map.get("cartItemList"));
		mav.setViewName("affirm");
		mav.addObject("sumprice", sumprice);
		return mav;
	}
	
	
	
}
