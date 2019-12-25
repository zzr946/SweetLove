package com.softeem.service;

import java.util.Map;

public interface AddressService {
	
	//添加收货地址的方法
	public Map<String,Object> addAddress(String uid,String adduser,String phone,String detailadd);
	
	//查询用户所有收货地址
	public Map<String,Object> addressAll(String uid);
	
	//修改默认地址
	public Map<String,Object> modifyDefaultAddress(String id,String uid);
	
	//删除地址的方法
	public Map<String,Object> delAddress(String id,String uid);
	
	
}
