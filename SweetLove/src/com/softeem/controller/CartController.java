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
	 * ����Ʒ��������ﳵ
	 * @param uid �û�id
	 * @param gid ��Ʒid
	 * @param number ��������
	 * @param session
	 * @return
	 */
	@RequestMapping("addcart")
	@ResponseBody
	public Map<String,Object> addCart(String uid,String gid,String number,HttpSession session){
		Map<String,Object> map=new HashMap<String, Object>();
		//��������뵽session��
		session.setAttribute("goodscart", map);
		return cartservice.addCart(uid, gid, number);
	}
	
	/**
	 * ������ﳵ���������й��ﳵ�е���Ʒ
	 * @param uid �û�id
	 * @return
	 */
	@RequestMapping("goodscarAll")
	public ModelAndView goodsCarAll(String uid,HttpSession session){
		ModelAndView mav=new ModelAndView();
		//����ҵ����ѯ������Ʒ
		Map<String,Object> map=cartservice.cartAll(uid);
		mav.setViewName("shoppingCar");
		session.setAttribute("goodscart", map);
		//mav.addObject("goodscart",map);
		return mav;
	}
	
	/**
	 * �û��ӹ��ﳵ��ɾ����Ʒ
	 * @param uid �û�id
	 * @param gid ��Ʒid
	 * @return
	 */
	@RequestMapping("delgoods")
	public ModelAndView delCartGoods(String uid,String gid,HttpSession session){
		ModelAndView mav=new ModelAndView();
		//����ҵ���ɾ����Ʒ
		Map<String,Object> map=cartservice.delGoods(uid, gid);
		session.setAttribute("goodscart", map);
		mav.setViewName("shoppingCar");
		return mav;
	}
	
	/**
	 * ������Ʒ����
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
		//����ҵ���������Ʒ����
		Map<String,Object> map=cartservice.addGoodsNumber(uid, gid,number,price);
		session.setAttribute("goodscart", map);
		mav.setViewName("shoppingCar");
		return mav;
	}
	
	/**
	 * ���ٹ��ﳵ����Ʒ������
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
		//����ҵ���������Ʒ����
		Map<String,Object> map=cartservice.subGoodsNumber(uid, gid,number,price);
		session.setAttribute("goodscart", map);
		mav.setViewName("shoppingCar");
		return mav;
	}
	
	/**
	 * �û����뵽ȷ�϶���ҳ��
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
		//����ҵ���
		Map<String,Object> map=cartservice.affirmBuy(uid, gids, sumprice);
		//�����ݴ���session��
		session.setAttribute("affirmAddress", map.get("addressList"));//��ַ
		session.setAttribute("cartItemList", map.get("cartItemList"));//�������Ʒ
		System.out.println(map.get("cartItemList"));
		mav.setViewName("affirm");
		mav.addObject("sumprice", sumprice);
		return mav;
	}
	
	
	
}
