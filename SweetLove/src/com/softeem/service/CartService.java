package com.softeem.service;

import java.util.Map;

public interface CartService {
	
	//��ӵ����ﳵ
	public Map<String,Object> addCart(String uid,String gid,String number);
	
	//��ѯ�û����ﳵ�е�������Ʒ
	public Map<String,Object> cartAll(String uid);
	
	//�ӹ��ﳵ��ɾ����Ʒ
	public Map<String,Object> delGoods(String uid,String gid);
	
	//���ӹ��ﳵ����Ʒ�����ķ���
	public Map<String,Object> addGoodsNumber(String uid,String gid,String number,String price);
	
	//���ٹ��ﳵ����Ʒ�����ķ���
	public Map<String,Object> subGoodsNumber(String uid,String gid,String number,String price);
	
	//��ѯ�û�ȷ�Ϲ����������Ʒ
	public Map<String,Object> affirmBuy(String uid,String gids,String sumprice);
	
	
	
	
}
