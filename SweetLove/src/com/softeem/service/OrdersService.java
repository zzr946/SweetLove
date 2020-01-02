package com.softeem.service;

import java.util.Map;

public interface OrdersService {
	
	//���ɶ����ķ�������֧����
	public Map<String,Object> createOrder(String uid,String cartids,String addid);
	
	//�û����֧������֧������������
	public Map<String,Object> yetPay(String uid,String ids);
	
	//�鿴���ж���
	public Map<String,Object> orderAll(String uid);
	
	//ɾ������
	public Map<String,Object> delOrder(String uid,String orderid);
	
	//��ѯ�������
	public Map<String,Object> waitPayOrder(String uid);
	
	//��ѯ���д������Ķ���
	public Map<String,Object> yetSendOrder(String uid);
	
	//��ѯ���д�����
	public Map<String,Object> waitEvaluate(String uid);
	
}
