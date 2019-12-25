package com.softeem.service;

import java.util.Map;

import com.softeem.pojo.User;

public interface UserService {
	
	//用户注册
	public Map<String,Object> reg(String phone,String password);
	
	//用户登录
	public Map<String,Object> login(String phone,String password);
	
	//短信登录
	public Map<String,Object> loginByPhone(String phone);
	
	//修改头像
	public Map<String,Object> changephoto(String id,String photo);
	
	//用户修改昵称等信息
	public Map<String,Object> changeUserinfo(String id,String nickname,String sex);
	
	//修改密码
	public Map<String,Object> modifyPassword(String id,String oldpassword,String newpassword);
	
}
