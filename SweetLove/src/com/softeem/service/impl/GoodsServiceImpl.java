package com.softeem.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import com.softeem.mapper.GoodsMapper;
import com.softeem.pojo.Goods;
import com.softeem.service.GoodsService;
@Component("goodsServiceImpl")
public class GoodsServiceImpl implements GoodsService {
	
	@Resource
	GoodsMapper goodsmapper;
	
	
	/**
	 * 根据商品id查询所有商品信息
	 */
	@Override
	public Map<String, Object> goodsinfo(String id) {
		Map<String,Object> map=new HashMap<String, Object>();
		//调用mapper层的方法
		Goods goods=goodsmapper.selectByPrimaryKey(id);
		if(goods!=null){
			//查询成功
			map.put("status", "0");
			map.put("msg", "查询成功");
			map.put("data", goods);
		}else{
			//查询失败
			map.put("status", "1");
			map.put("msg", "查询失败");
			map.put("data", null);
		}
		return map;
	}


	@Override
	public Map<String, Object> goodsList() {
		Map<String,Object> map=new HashMap<String,Object>();
		//调用mapper层的方法访问数据库
		List<Goods> list=goodsmapper.selectGoodsAll();
		if(!list.isEmpty()){
			//查询成功
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


	/**
	 * 模糊查询商品
	 */
	@Override
	public Map<String, Object> searchForGoods(String inp) {
		Map<String,Object> map=new HashMap<String,Object>();
		inp="%"+inp+"%";
		//调用mapper模糊查询商品
		List<Goods> list=goodsmapper.selectByInp(inp);
		map.put("status", "0");
		map.put("msg", "查询成功");
		map.put("data", list);
		return map;
	}
	
	
	

}
