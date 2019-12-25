package com.softeem.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import com.softeem.mapper.CollectMapper;
import com.softeem.mapper.GoodsMapper;
import com.softeem.pojo.Collect;
import com.softeem.pojo.Goods;
import com.softeem.service.CollectService;
import com.softeem.tools.Tools;

@Component("collectServiceImpl")
public class CollectServiceImpl implements CollectService {
	
	@Resource
	GoodsMapper goodsmapper;
	
	@Resource
	CollectMapper collectmapper;
	
	/**
	 * 用户收藏商品的方法
	 */
	@Override
	public Map<String, Object> collectGoods(String gid,String uid) {
		Map<String,Object> map=new HashMap<String, Object>();
		//获取id
		String id=Tools.getUUID();
		//获取收藏时间
		String colltime=Tools.dateToStr("yyyy-MM-dd HH:ss:mm", new Date());
		Collect collect=new Collect();
		collect.setId(id);
		collect.setGid(gid);
		collect.setUid(uid);
		collect.setColltime(colltime);
		collect.setStatus(0);
		//调用mapper层的方法存入数据库
		int i=collectmapper.insert(collect);
		if(i>=1){
			//成功
			map.put("status", "0");
			map.put("msg", "收藏成功");
			map.put("data", null);
		}else{
			//失败
			map.put("status", "1");
			map.put("msg", "收藏失败");
			map.put("data", null);
		}
		return map;
	}

	/**
	 * 查询用户收藏的商品
	 */
	@Override
	public Map<String, Object> collectList() {
		Map<String,Object> map=new HashMap<>();
		//调用mapper层的方法查询所有收藏项
		List<Collect> coll_list=collectmapper.selectAll();
		//定义一个集合装商品
		List<Goods> list=new ArrayList<Goods>();
		for (Collect collect : coll_list) {
			//调用Goodsmapper层的方法，根据商品id查询商品信息
			//收藏的商品id
			String id=collect.getGid();
			//查询商品信息信息
			Goods goods=goodsmapper.selectByPrimaryKey(id);
			//将集合装入list中
			list.add(goods);
		}
		if(!list.isEmpty()){
			map.put("status", "0");
			map.put("msg", "查询成功");
			map.put("data", list);
		}else{
			//查询失败
			map.put("status", "1");
			map.put("msg", "查询失败");
			map.put("data", null);
		}
		return map;
	}

	
	
}
