package com.softeem.service;

import java.util.Map;

public interface AddressService {
	
	//����ջ���ַ�ķ���
	public Map<String,Object> addAddress(String uid,String adduser,String phone,String detailadd);
	
	//��ѯ�û������ջ���ַ
	public Map<String,Object> addressAll(String uid);
	
	//�޸�Ĭ�ϵ�ַ
	public Map<String,Object> modifyDefaultAddress(String id,String uid);
	
	//ɾ����ַ�ķ���
	public Map<String,Object> delAddress(String id,String uid);
	
	
}
