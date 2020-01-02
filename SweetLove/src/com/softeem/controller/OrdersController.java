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
	 * �û�����ύ��������������Ϣ���뵽�������У�����ת��֧������
	 * @param uid �û�id
	 * @param cartids ���ﳵid�ַ���
	 * @param addid �ջ���ַid
	 * @return
	 */
	@RequestMapping("createOrder")
	@ResponseBody
	public ModelAndView createOrder(String uid,String cartids,String addid,String paymoney){
		ModelAndView mav=new ModelAndView();
		//����ҵ��������
		Map<String,Object> map=orderservice.createOrder(uid, cartids, addid);
		mav.addObject("ids",map.get("ids"));//������Ķ���id��
		mav.addObject("paymoney", paymoney);
		mav.setViewName("pay");
		return mav;
	}
	
	/**
	 * ��֧���ɹ���������״̬��Ϊ��֧��
	 * @param uid
	 * @param ids
	 * @return
	 */
	@RequestMapping("success")
	@ResponseBody
	public ModelAndView success(String uid,String ids){
		ModelAndView mav=new ModelAndView();
		//����ҵ��㽫����״̬��Ϊ֧��״̬
		orderservice.yetPay(uid, ids);
		mav.setViewName("success");
		
		return mav;
	}
	
	/**
	 * �鿴���ж���
	 * @param uid
	 * @return
	 */
	@RequestMapping("myorder")
	@ResponseBody
	public ModelAndView OrderAll(String uid){
		ModelAndView mav=new ModelAndView();
		Map<String,Object> map=orderservice.orderAll(uid);
		mav.addObject("orderItemAll", map);
		mav.addObject("code", 0);//��ʾ���ж���
		mav.setViewName("order");
		return mav;
	}
	
	/**
	 * ɾ������
	 * @param uid �û�id
	 * @param orderid ����id
	 * @return
	 */
	@RequestMapping("delOrder")
	@ResponseBody
	public ModelAndView delOrder(String uid,String orderid){	
		ModelAndView mav=new ModelAndView();
		//����ҵ���ɾ������
		Map<String,Object> map=orderservice.delOrder(uid, orderid);
		mav.addObject("orderItemAll", map);
		mav.setViewName("order");
		return mav;
	}
	
	/**
	 * �鿴���д������
	 * @param uid
	 * @return
	 */
	@RequestMapping("waitpayOrder")
	@ResponseBody
	public ModelAndView waitpayOrder(String uid){
		ModelAndView mav=new ModelAndView();
		//����ҵ���
		Map<String,Object> map=orderservice.waitPayOrder(uid);
		mav.addObject("orderItemAll", map);
		mav.addObject("code", 1);//��ʾ�������
		mav.setViewName("order");
		return mav;
	}
	
	/**
	 * �鿴�ѷ�������
	 * @param uid �û�id
	 * @return
	 */
	@RequestMapping("yetOrder")
	@ResponseBody
	public ModelAndView yetSendOrder(String uid){
		ModelAndView mav=new ModelAndView();
		//����ҵ���
		Map<String,Object> map=orderservice.yetSendOrder(uid);
		mav.addObject("orderItemAll", map);
		mav.addObject("code", 2);//��ʾ���ѷ�������
		mav.setViewName("order");
		return mav;
	}
	
	/**
	 * ��ѯ���д����۶���
	 * @param uid �û�id
	 * @return
	 */
	@RequestMapping("waitevaluate")
	@ResponseBody
	public ModelAndView waitEvaluate(String uid){
		ModelAndView mav=new ModelAndView();
		//����ҵ���
		Map<String,Object> map=orderservice.waitEvaluate(uid);
		mav.addObject("orderItemAll", map);
		mav.addObject("code", 3);//��ʾ�����ջ������۶���
		mav.setViewName("order");
		return mav;
	}
	
	
	
	
}
