package com.softeem.service;

import java.util.Map;

public interface CollectService {
	
	//�û��ղ���Ʒ�ķ���
	public Map<String,Object> collectGoods(String gid,String uid);
	
	//��ѯ�����ղص���Ʒ
	public Map<String,Object> collectList();
	
	
}
