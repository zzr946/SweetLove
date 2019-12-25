package com.softeem.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import com.softeem.mapper.AddressMapper;
import com.softeem.pojo.Address;
import com.softeem.service.AddressService;
import com.softeem.tools.Tools;
@Component("addressServiceImpl")
public class AddressServiceImpl implements AddressService {

	@Resource
	AddressMapper addressmapper;
	
	/**
	 * 添加收货地址 status(0成功 1失败 2超过限制)
	 */
	@Override
	public Map<String, Object> addAddress(String uid, String adduser, String phone, String detailadd) {
		Map<String,Object> map=new HashMap<String, Object>();
		//查询该用户已经添加了几个地址
		List<Address> addlist=addressmapper.selectAddressAll(uid);
		if(addlist.size()>=3){
			map.put("status", "2");
			map.put("msg", "已经达到上限");
			map.put("data", addlist);
			return map;
		}
		//将地址信息存入数据库
		Address address=new Address();
		address.setId(Tools.getUUID());
		address.setUid(uid);
		address.setDetailadd(detailadd);
		address.setAdduser(adduser);
		address.setPhone(phone);
		address.setStatus(0);
		//存数据
		int i=addressmapper.insert(address);
		//存完后再查询所有数据
		List<Address> list=addressmapper.selectAddressAll(uid);
		if(i>=1){
			//成功
			map.put("status", "0");
			map.put("msg", "成功");
			map.put("data", list);
		}else{
			//失败
			map.put("status", "1");
			map.put("msg", "失败");
			map.put("data", list);
		}
		return map;
	}

	/**
	 * 查询用户所有地址
	 */
	@Override
	public Map<String, Object> addressAll(String uid) {
		Map<String,Object> map=new HashMap<String,Object>();
		//调用mapper层查询用户地址信息
		List<Address> list=addressmapper.selectAddressAll(uid);
		map.put("status", "0");
		map.put("msg", "查询成功");
		map.put("data", list);
		return map;
	}

	/**
	 * 修改默认地址
	 */
	@Override
	public Map<String, Object> modifyDefaultAddress(String id,String uid) {
		Map<String,Object> map=new HashMap<String,Object>();
		//首先将该用户的所有可用地址修改为非默认地址
		Address address=new Address();
		address.setId(id);
		address.setUid(uid);
		addressmapper.updataByid(address);
		//将该用户下的指定地址id的地址修改为默认状态
		int i=addressmapper.updateByDefault(address);
		if(i>=1){
			//成功
			map.put("status", "0");
			map.put("msg", "成功");
			map.put("data", null);
		}else{
			//失败
			map.put("status", "1");
			map.put("msg", "失败");
			map.put("data", null);
		}
		return map;
	}

	/**
	 * 删除地址
	 */
	@Override
	public Map<String, Object> delAddress(String id, String uid) {
		Map<String,Object> map=new HashMap<String,Object>();
		Address address=new Address();
		address.setId(id);
		address.setUid(uid);
		int i=addressmapper.delAddress(address);
		if(i>=1){
			//成功
			map.put("status", "0");
			map.put("msg", "删除成功");
			map.put("data", null);
		}else{
			//失败
			map.put("status", "1");
			map.put("msg", "删除失败");
			map.put("data", null);
		}
		return map;
	}

	
	
	
}
