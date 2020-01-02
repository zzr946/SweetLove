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
	 * �û��ղ���Ʒ�ķ���
	 */
	@Override
	public Map<String, Object> collectGoods(String gid,String uid) {
		Map<String,Object> map=new HashMap<String, Object>();
		//��ȡid
		String id=Tools.getUUID();
		//��ȡ�ղ�ʱ��
		String colltime=Tools.dateToStr("yyyy-MM-dd HH:ss:mm", new Date());
		Collect collect=new Collect();
		collect.setId(id);
		collect.setGid(gid);
		collect.setUid(uid);
		collect.setColltime(colltime);
		collect.setStatus(0);
		//����mapper��ķ����������ݿ�
		int i=collectmapper.insert(collect);
		if(i>=1){
			//�ɹ�
			map.put("status", "0");
			map.put("msg", "�ղسɹ�");
			map.put("data", null);
		}else{
			//ʧ��
			map.put("status", "1");
			map.put("msg", "�ղ�ʧ��");
			map.put("data", null);
		}
		return map;
	}

	/**
	 * ��ѯ�û��ղص���Ʒ
	 */
	@Override
	public Map<String, Object> collectList() {
		Map<String,Object> map=new HashMap<>();
		//����mapper��ķ�����ѯ�����ղ���
		List<Collect> coll_list=collectmapper.selectAll();
		//����һ������װ��Ʒ
		List<Goods> list=new ArrayList<Goods>();
		for (Collect collect : coll_list) {
			//����Goodsmapper��ķ�����������Ʒid��ѯ��Ʒ��Ϣ
			//�ղص���Ʒid
			String id=collect.getGid();
			//��ѯ��Ʒ��Ϣ��Ϣ
			Goods goods=goodsmapper.selectByPrimaryKey(id);
			//������װ��list��
			list.add(goods);
		}
		if(!list.isEmpty()){
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

	
	
}
