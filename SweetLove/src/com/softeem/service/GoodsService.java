package com.softeem.service;

import java.util.Map;

public interface GoodsService {
	//������Ʒid��ѯ������Ʒ��Ϣ
	public Map<String,Object> goodsinfo(String id);
	
	//��ѯ������Ʒ�б�
	public Map<String,Object> goodsList();
	
	//ģ����ѯ
	public Map<String,Object> searchForGoods(String inp);
	
}
