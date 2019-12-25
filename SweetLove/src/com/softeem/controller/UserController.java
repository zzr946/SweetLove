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
	
	//存储验证码
	private String phoneCode;
	
	/**
	 * 用户注册获取验证码status(0 成功)
	 * @param phone 注册的手机号
	 * @return
	 */
	@ResponseBody
	@RequestMapping("user_getcode")
	public Map<String,Object> getCode(String phone){
		Map<String,Object> map=new HashMap<String, Object>();
		//获取验证码
		phoneCode=PhoneCode.getCode();
		//发送短信
		PhoneCode.sendCode(phone, phoneCode);
		System.out.println("生成的短信验证码:"+phoneCode);
		map.put("status", "0");
		return map;
	}
	
	/**
	 * 用户注册status(0成功 1验证码错误 2注册失败 3手机号已注册)
	 * @param phone 注册的手机号
	 * @param password 用户输入的密码
	 * @param code 用户输入的验证码
	 * @return
	 */
	@RequestMapping("user_reg")
	@ResponseBody
	public Map<String,Object> reg(String phone,String password,String code){
		Map<String,Object> map=new HashMap<String,Object>();
		if(!phoneCode.equals(code)){
			//验证码错误
			map.put("status","1");
			map.put("msg", "验证码错误");
			map.put("data", null);
			return map;
		}else{
			//验证码正确,调用逻辑层存储数据
			return uservice.reg(phone, password);
		}
	}
	
	/**
	 * 用户登录的方法
	 * @param phone
	 * @param password
	 * @param session
	 * @return
	 */
	@RequestMapping("user_login")
	@ResponseBody
	public Map<String,Object> login(String phone,String password,HttpSession session){
		//调用实现层的方法
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
	 * 用户安全退出的方法
	 * @param session
	 * @return
	 */
	@RequestMapping("user_logout")
	@ResponseBody
	public ModelAndView logout(HttpSession session){
		ModelAndView mav=new ModelAndView();
		//清空session中的值
		session.invalidate();
		mav.setViewName("index");
		//返回到主界面
		return mav;
	}
	
	/**
	 * 用户修改头像的方法
	 * @param myfile
	 * @param hiddenuid
	 * @param session
	 * @return
	 */
	@RequestMapping("user_modifyphoto")
	@ResponseBody
	public ModelAndView modifyPhoto(MultipartFile myfile,String hiddenuid,HttpSession session){
		ModelAndView mav=new ModelAndView();
//		System.out.println("字段名:"+myfile.getName());
//		System.out.println("文件名:"+myfile.getOriginalFilename());
//		System.out.println("文件大小:"+myfile.getSize());
//		System.out.println("文件类型:"+myfile.getContentType());
		//修改头像的文件名
		String photo=myfile.getOriginalFilename();
		//获取后缀名
		String str=photo.substring(photo.lastIndexOf("."));
		//System.out.println("后缀名："+str);
		//重命名
		String newPhotoName=Tools.getUUID()+str;
		//调用业务层将头像存入数据库中
		//获取用户id
		String id=hiddenuid;
		//存头像
		Map<String,Object> map=uservice.changephoto(id, newPhotoName);
		if("0".equals(map.get("status"))){
			//修改成功
			//将用户信息存入到session中
			session.setAttribute("user", map);
			//将重命名的文件存储到指定的位置(存储的位置,需要存储的文件名)
			try {
				myfile.transferTo(new File(Constant.USERPHOTO,newPhotoName));
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
			//mav.addObject("status", "0");
		}else{
			//修改失败
			//mav.addObject("status", "1");
		}
		//跳转到当前页面
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
		//调用业务层将修改的数据存入数据库
		Map<String,Object> map=uservice.changeUserinfo(id, nickname, sex);
		if("0".equals(map.get("status"))){
			//成功
			session.setAttribute("user", map);
		}
		return map;
	}
	
	/**
	 * 用户修改密码
	 * @param id 用户id
	 * @param oldpassword 原密码
	 * @param newpassword 新密码
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
