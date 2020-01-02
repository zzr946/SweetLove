package com.softeem.controller;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.softeem.service.AddressService;

@Controller
public class AddressController {
	
	@Resource(name="addressServiceImpl")
	AddressService aservice;
	
	/**
	 * �û�����ջ���ַ
	 * @param uid �û�id
	 * @param adduser �ջ�����
	 * @param phone �ջ����ֻ���
	 * @param detailadd ��ϸ��ַ
	 * @return
	 */
	@RequestMapping("address_add")
	@ResponseBody
	public ModelAndView addAddress(String uid,String adduser,String phone,String detailadd,HttpSession session){
		ModelAndView mav=new ModelAndView();
		//����ҵ���
		Map<String,Object> map=aservice.addAddress(uid, adduser, phone, detailadd);
		session.setAttribute("address", map);
		
		if("2".equals(map.get("status"))){
			//�ﵽ����
			mav.addObject("code", map.get("status"));
		}
		mav.setViewName("address");
		return mav;
	}
	
	/**
	 * ���뵽��ַ��������ʼ�����е�ַ��Ϣ
	 * @param uid �û�id
	 * @return
	 */
	@RequestMapping("addressAll")
	@ResponseBody
	public ModelAndView addressAll(String uid){
		ModelAndView mav=new ModelAndView();
		//����ҵ����ѯ���е�ַ��Ϣ
		Map<String,Object> map=aservice.addressAll(uid);
		mav.setViewName("address");
		mav.addObject("address", map);
		return mav;
	}
	
	/**
	 * �޸�Ĭ�ϵ�ַ�ķ���
	 * @param id ��ַid
	 * @param uid �û�id
	 * @return
	 */
	@RequestMapping("address_changeDefault")
	@ResponseBody
	public Map<String,Object> modifyDefaultAddress(String id,String uid){
		//����ҵ����޸�״̬
		Map<String,Object> map=aservice.modifyDefaultAddress(id, uid);
		return map;
	}
	
	/**
	 * ɾ����ַ
	 * @param id ��ַid
	 * @param uid �û�id
	 * @return
	 */
	@RequestMapping("address_del")
	@ResponseBody
	public Map<String,Object> delAddress(String id,String uid){
		//����ҵ���
		//addressAll(uid);
		return aservice.delAddress(id, uid);
	}
	
	
	
}
