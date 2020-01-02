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
	 * �鿴��Ʒ��ϸ��Ϣ
	 * @param id
	 * @return
	 */
	@RequestMapping("goods_xiangqing")
	@ResponseBody
	public ModelAndView xiangqing(String id){
		ModelAndView mav=new ModelAndView();
		//��ȡ��Ʒid
		//System.out.println(id);
		//����ҵ���ķ���
		Map<String,Object> map=gservice.goodsinfo(id);
		mav.addObject("goods", map);
		mav.setViewName("xiangqing");
		return mav;
	}
	
	/**
	 * ��ѯ������Ʒ�б�
	 * @return
	 */
	@RequestMapping("goods_list")
	@ResponseBody
	public ModelAndView goodsList(){
		ModelAndView mav=new ModelAndView();
		//���÷���㣬��ѯ������Ʒ
		Map<String,Object> map=gservice.goodsList();
//		System.out.println(map.get("status"));
//		System.out.println(map.get("msg"));
//		System.out.println(map.get("data"));
		if("0".equals(map.get("status"))){
			//�ɹ�
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
	 * ������Ʒ(ģ����ѯ)
	 * @param name
	 * @return
	 */
	@RequestMapping("selectGoods")
	@ResponseBody
	public ModelAndView searchGoods(String name){
		ModelAndView mav=new ModelAndView();
		//����ҵ���ģ����ѯ
		Map<String,Object> map=gservice.searchForGoods(name);
		mav.setViewName("list");
		mav.addObject("goodslist", map);
		return mav;
	}
	
	
	
	
	
	
	
}
