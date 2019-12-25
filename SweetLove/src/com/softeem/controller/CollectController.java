package com.softeem.controller;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.softeem.service.CollectService;

@Controller
public class CollectController {
	
	@Resource(name="collectServiceImpl")
	CollectService collservice;
	
	/**
	 * 用户搜藏商品的方法
	 * @param gid 商品id
	 * @param uid 用户id
	 * @return
	 */
	@RequestMapping("goods_collect")
	@ResponseBody
	public Map<String,Object> collectGoods(String gid,String uid){
		return collservice.collectGoods(gid, uid);
	}
	
	
	
	/**
	 * 查询用户收藏的商品
	 * @return
	 */
	@RequestMapping("goods_collectList")
	@ResponseBody
	public ModelAndView goodsCollect(){
		ModelAndView mav=new ModelAndView();
		Map<String,Object> map=collservice.collectList();
		mav.setViewName("collect");
		mav.addObject("goods", map);
		//System.out.println(map.get("data"));
		return mav;
	}
	
}
