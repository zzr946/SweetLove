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
	 * �û��Ѳ���Ʒ�ķ���
	 * @param gid ��Ʒid
	 * @param uid �û�id
	 * @return
	 */
	@RequestMapping("goods_collect")
	@ResponseBody
	public Map<String,Object> collectGoods(String gid,String uid){
		return collservice.collectGoods(gid, uid);
	}
	
	
	
	/**
	 * ��ѯ�û��ղص���Ʒ
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
