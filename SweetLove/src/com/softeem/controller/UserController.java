package com.softeem.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.softeem.service.UserService;
import com.softeem.tools.Constant;
import com.softeem.tools.PhoneCode;
import com.softeem.tools.Tools;

@Controller
public class UserController {
	
	@Resource(name="userServiceImpl")
	UserService uservice;
	
	//�洢��֤��
	private String phoneCode;
	
	/**
	 * �û�ע���ȡ��֤��status(0 �ɹ�)
	 * @param phone ע����ֻ���
	 * @return
	 */
	@ResponseBody
	@RequestMapping("user_getcode")
	public Map<String,Object> getCode(String phone){
		Map<String,Object> map=new HashMap<String, Object>();
		//��ȡ��֤��
		phoneCode=PhoneCode.getCode();
		//���Ͷ���
		PhoneCode.sendCode(phone, phoneCode);
		System.out.println("���ɵĶ�����֤��:"+phoneCode);
		map.put("status", "0");
		return map;
	}
	
	/**
	 * �û�ע��status(0�ɹ� 1��֤����� 2ע��ʧ�� 3�ֻ�����ע��)
	 * @param phone ע����ֻ���
	 * @param password �û����������
	 * @param code �û��������֤��
	 * @return
	 */
	@RequestMapping("user_reg")
	@ResponseBody
	public Map<String,Object> reg(String phone,String password,String code){
		Map<String,Object> map=new HashMap<String,Object>();
		if(!phoneCode.equals(code)){
			//��֤�����
			map.put("status","1");
			map.put("msg", "��֤�����");
			map.put("data", null);
			return map;
		}else{
			//��֤����ȷ,�����߼���洢����
			return uservice.reg(phone, password);
		}
	}
	
	/**
	 * �û���¼�ķ���
	 * @param phone
	 * @param password
	 * @param session
	 * @return
	 */
	@RequestMapping("user_login")
	@ResponseBody
	public Map<String,Object> login(String phone,String password,HttpSession session){
		//����ʵ�ֲ�ķ���
		Map<String,Object> map=uservice.login(phone, password);
		//System.out.println(map.get("status"));
		//System.out.println(map.get("msg"));
		session.setAttribute("user", map);
//		if("0".equals(map.get("status"))){
//			return "index";
//		}
		return map;
	}
	
	/**
	 * �û���ȫ�˳��ķ���
	 * @param session
	 * @return
	 */
	@RequestMapping("user_logout")
	@ResponseBody
	public ModelAndView logout(HttpSession session){
		ModelAndView mav=new ModelAndView();
		//���session�е�ֵ
		session.invalidate();
		mav.setViewName("index");
		//���ص�������
		return mav;
	}
	
	/**
	 * �û��޸�ͷ��ķ���
	 * @param myfile
	 * @param hiddenuid
	 * @param session
	 * @return
	 */
	@RequestMapping("user_modifyphoto")
	@ResponseBody
	public ModelAndView modifyPhoto(MultipartFile myfile,String hiddenuid,HttpSession session){
		ModelAndView mav=new ModelAndView();
//		System.out.println("�ֶ���:"+myfile.getName());
//		System.out.println("�ļ���:"+myfile.getOriginalFilename());
//		System.out.println("�ļ���С:"+myfile.getSize());
//		System.out.println("�ļ�����:"+myfile.getContentType());
		//�޸�ͷ����ļ���
		String photo=myfile.getOriginalFilename();
		//��ȡ��׺��
		String str=photo.substring(photo.lastIndexOf("."));
		//System.out.println("��׺����"+str);
		//������
		String newPhotoName=Tools.getUUID()+str;
		//����ҵ��㽫ͷ��������ݿ���
		//��ȡ�û�id
		String id=hiddenuid;
		//��ͷ��
		Map<String,Object> map=uservice.changephoto(id, newPhotoName);
		if("0".equals(map.get("status"))){
			//�޸ĳɹ�
			//���û���Ϣ���뵽session��
			session.setAttribute("user", map);
			//�����������ļ��洢��ָ����λ��(�洢��λ��,��Ҫ�洢���ļ���)
			try {
				myfile.transferTo(new File(Constant.USERPHOTO,newPhotoName));
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
			//mav.addObject("status", "0");
		}else{
			//�޸�ʧ��
			//mav.addObject("status", "1");
		}
		//��ת����ǰҳ��
		mav.setViewName("userinfo");
		return mav;
	}
	
	
	@RequestMapping("user_modifyuserinfo")
	@ResponseBody
	public Map<String,Object> modifyUserinfo(String id,String nickname,String sex,HttpSession session){
		//Map<String,Object> map=new HashMap<>();
		//System.out.println(id);
		//System.out.println(nickname);
		//System.out.println(sex);
		//����ҵ��㽫�޸ĵ����ݴ������ݿ�
		Map<String,Object> map=uservice.changeUserinfo(id, nickname, sex);
		if("0".equals(map.get("status"))){
			//�ɹ�
			session.setAttribute("user", map);
		}
		return map;
	}
	
	/**
	 * �û��޸�����
	 * @param id �û�id
	 * @param oldpassword ԭ����
	 * @param newpassword ������
	 * @return
	 */
	@RequestMapping("changpassword")
	@ResponseBody
	public Map<String,Object> modifyPassword(String id,String oldpassword,String newpassword){
		System.out.println(id);
		System.out.println(oldpassword);
		System.out.println(newpassword);
		return uservice.modifyPassword(id, oldpassword, newpassword);
	}
	
	
	
	
}
