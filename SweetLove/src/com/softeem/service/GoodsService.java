package com.softeem.service;

import java.util.Map;

public interface GoodsService {
	//根据商品id查询所有商品信息
	public Map<String,Object> goodsinfo(String id);
	
	//查询所有商品列表
	public Map<String,Object> goodsList();
	
	//模糊查询
	public Map<String,Object> searchForGoods(String inp);
	
}
