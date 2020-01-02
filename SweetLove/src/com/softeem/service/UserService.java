package com.softeem.service;

import java.util.Map;

import com.softeem.pojo.User;

public interface UserService {
	
	//�û�ע��
	public Map<String,Object> reg(String phone,String password);
	
	//�û���¼
	public Map<String,Object> login(String phone,String password);
	
	//���ŵ�¼
	public Map<String,Object> loginByPhone(String phone);
	
	//�޸�ͷ��
	public Map<String,Object> changephoto(String id,String photo);
	
	//�û��޸��ǳƵ���Ϣ
	public Map<String,Object> changeUserinfo(String id,String nickname,String sex);
	
	//�޸�����
	public Map<String,Object> modifyPassword(String id,String oldpassword,String newpassword);
	
}
