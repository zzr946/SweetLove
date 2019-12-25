package com.softeem.service;

import java.util.Map;

public interface CartService {
	
	//添加到购物车
	public Map<String,Object> addCart(String uid,String gid,String number);
	
	//查询用户购物车中的所有商品
	public Map<String,Object> cartAll(String uid);
	
	//从购物车中删除商品
	public Map<String,Object> delGoods(String uid,String gid);
	
	//增加购物车中商品数量的方法
	public Map<String,Object> addGoodsNumber(String uid,String gid,String number,String price);
	
	//减少购物车中商品数量的方法
	public Map<String,Object> subGoodsNumber(String uid,String gid,String number,String price);
	
	//查询用户确认购买的所有商品
	public Map<String,Object> affirmBuy(String uid,String gids,String sumprice);
	
	
	
	
}
