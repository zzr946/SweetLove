package com.softeem.controller;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.softeem.service.GoodsService;

@Controller
public class GoodsController {
	
	@Resource(name="goodsServiceImpl")
	GoodsService gservice;
	
	/**
	 * 查看商品详细信息
	 * @param id
	 * @return
	 */
	@RequestMapping("goods_xiangqing")
	@ResponseBody
	public ModelAndView xiangqing(String id){
		ModelAndView mav=new ModelAndView();
		//获取商品id
		//System.out.println(id);
		//调用业务层的方法
		Map<String,Object> map=gservice.goodsinfo(id);
		mav.addObject("goods", map);
		mav.setViewName("xiangqing");
		return mav;
	}
	
	/**
	 * 查询所有商品列表
	 * @return
	 */
	@RequestMapping("goods_list")
	@ResponseBody
	public ModelAndView goodsList(){
		ModelAndView mav=new ModelAndView();
		//调用服务层，查询所有商品
		Map<String,Object> map=gservice.goodsList();
//		System.out.println(map.get("status"));
//		System.out.println(map.get("msg"));
//		System.out.println(map.get("data"));
		if("0".equals(map.get("status"))){
			//成功
			mav.setViewName("list");
			mav.addObject("status", "0");
			mav.addObject("goodslist", map);
		}else{
			mav.setViewName("list");
			mav.addObject("status", "1");
			mav.addObject("goodslist", map);
		}
		return mav;
	}
	
	/**
	 * 搜索商品(模糊查询)
	 * @param name
	 * @return
	 */
	@RequestMapping("selectGoods")
	@ResponseBody
	public ModelAndView searchGoods(String name){
		ModelAndView mav=new ModelAndView();
		//调用业务层模糊查询
		Map<String,Object> map=gservice.searchForGoods(name);
		mav.setViewName("list");
		mav.addObject("goodslist", map);
		return mav;
	}
	
	
	
	
	
	
	
}
