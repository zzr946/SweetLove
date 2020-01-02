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
	 * ������Ʒid��ѯ������Ʒ��Ϣ
	 */
	@Override
	public Map<String, Object> goodsinfo(String id) {
		Map<String,Object> map=new HashMap<String, Object>();
		//����mapper��ķ���
		Goods goods=goodsmapper.selectByPrimaryKey(id);
		if(goods!=null){
			//��ѯ�ɹ�
			map.put("status", "0");
			map.put("msg", "��ѯ�ɹ�");
			map.put("data", goods);
		}else{
			//��ѯʧ��
			map.put("status", "1");
			map.put("msg", "��ѯʧ��");
			map.put("data", null);
		}
		return map;
	}


	@Override
	public Map<String, Object> goodsList() {
		Map<String,Object> map=new HashMap<String,Object>();
		//����mapper��ķ����������ݿ�
		List<Goods> list=goodsmapper.selectGoodsAll();
		if(!list.isEmpty()){
			//��ѯ�ɹ�
			map.put("status", "0");
			map.put("msg", "��ѯ�ɹ�");
			map.put("data", list);
		}else{
			//��ѯʧ��
			map.put("status", "1");
			map.put("msg", "��ѯʧ��");
			map.put("data", null);
		}
		return map;
	}


	/**
	 * ģ����ѯ��Ʒ
	 */
	@Override
	public Map<String, Object> searchForGoods(String inp) {
		Map<String,Object> map=new HashMap<String,Object>();
		inp="%"+inp+"%";
		//����mapperģ����ѯ��Ʒ
		List<Goods> list=goodsmapper.selectByInp(inp);
		map.put("status", "0");
		map.put("msg", "��ѯ�ɹ�");
		map.put("data", list);
		return map;
	}
	
	
	

}
