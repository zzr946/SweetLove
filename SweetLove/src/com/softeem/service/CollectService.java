package com.softeem.service;

import java.util.Map;

public interface CollectService {
	
	//用户收藏商品的方法
	public Map<String,Object> collectGoods(String gid,String uid);
	
	//查询所有收藏的商品
	public Map<String,Object> collectList();
	
	
}
