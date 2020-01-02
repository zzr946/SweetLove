package com.softeem.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import com.softeem.mapper.CartMapper;
import com.softeem.mapper.GoodsMapper;
import com.softeem.mapper.OrdersMapper;
import com.softeem.pojo.Cart;
import com.softeem.pojo.Goods;
import com.softeem.pojo.OrderItem;
import com.softeem.pojo.Orders;
import com.softeem.service.OrdersService;
import com.softeem.tools.Tools;
@Component("ordersServiceImpl")
public class OrdersServiceImpl implements OrdersService {
	
	@Resource
	OrdersMapper ordermapper;
	@Resource
	CartMapper cartmapper;
	@Resource
	GoodsMapper goodsmapper;
	
	/**
	 * ���ɶ����ķ���
	 */
	@Override
	public Map<String, Object> createOrder(String uid, String cartids, String addid) {
		Map<String, Object> map=new HashMap<String,Object>();
		//�õ�ÿһ�����ﳵid
		String[] ids=cartids.split("~");
		String orderids="";
		for (String cartid : ids) {
			//����cartMAPPER������id��ѯ���ﳵ��
			Cart cartItem=cartmapper.selectByPrimaryKey(cartid);
			//��ȡuuid
			String id=Tools.getUUID();
			//������id�ַ������浽��һ��ҳ��
			orderids+=id+"~";
			//��ȡ������š�
			String ordernumber=Tools.getNum();
			//��ȡ�µ�ʱ��
			String ordertime=Tools.dateToStr("yyyy-MM-dd HH:mm", new Date());
			//��ȡ��Ʒid
			String gid=cartItem.getGid();
			//��ȡ��Ʒ����
			int goodsnumber=cartItem.getNumber();
			//��ȡ��Ʒ���
			double total=cartItem.getTotal();
			//����orders����
			Orders order=new Orders();
			order.setId(id);
			order.setOrdernumber(ordernumber);
			order.setOrdertime(ordertime);
			order.setGid(gid);
			order.setGoodsnumber(goodsnumber);
			order.setTotal(total);
			order.setAddid(addid);
			order.setStatus(1);//�ȴ�����״̬
			order.setReserve1(uid);//�û�id
			//����mapper������
			ordermapper.insertSelective(order);
		}
		map.put("ids", orderids);
		return map;
	}

	/**
	 * �û����֧����������״̬��Ϊ��֧��2
	 * (�û�id,����id��)
	 */
	@Override
	public Map<String, Object> yetPay(String uid, String ids) {
		Map<String, Object> map=new HashMap<String,Object>();
		//�õ�ÿһ�����ﳵid
		String[] cartid=ids.split("~");
		for (String id : cartid) {
			//���ݶ���id������״̬�޸�
			Orders order=new Orders();
			order.setId(id);
			order.setStatus(2);//��֧��״̬
			ordermapper.updateByPrimaryKeySelective(order);
		}
		return map;
	}

	/**
	 * �鿴���ж���
	 */
	@Override
	public Map<String, Object> orderAll(String uid) {
		Map<String, Object> map=new HashMap<String,Object>();
		//����ÿһ������
		List<OrderItem> list=new ArrayList<OrderItem>();
		//����mapper�鿴����
		List<Orders> lis=ordermapper.selectByUid(uid);
		for (Orders ord : lis) {
			//������Ʒid�鿴��Ʒ��Ϣ
			Goods goods=goodsmapper.selectByPrimaryKey(ord.getGid());
			//��������item
			OrderItem item=new OrderItem();
			item.setOrdertime(ord.getOrdertime());//�µ�ʱ��
			item.setOrdernumber(ord.getOrdernumber());//������
			item.setOrderid(ord.getId());//����id
			item.setGoodsnumber(ord.getGoodsnumber());//��������
			item.setGid(ord.getGid());//��Ʒid
			item.setSample1(goods.getSample1());//��ƷͼƬ
			item.setPrice(goods.getPrice());//��Ʒ����
			item.setSpec(goods.getSpce());//���
			list.add(item);
		}
		map.put("status", "0");
		map.put("msg", "���");
		map.put("data", list);
		return map;
	}

	/**
	 * ɾ������
	 */
	@Override
	public Map<String, Object> delOrder(String uid, String orderid) {
		Map<String, Object> map=new HashMap<String,Object>();
		//����ordermapper���޸�״̬Ϊ5
		Orders order=new Orders();
		order.setId(orderid);//����id
		order.setStatus(5);
		//order.setReserve1(uid);//�û�id
		int i=ordermapper.updateByPrimaryKeySelective(order);
		if(i>=1){
			//�ɹ�
			//��ѯ���û�������δɾ���Ķ���
			return orderAll(uid);
			/*map.put("status", "0");
			map.put("msg", "ɾ���ɹ�");
			map.put("data", list);*/
		}else{
			//ʧ��
			map.put("status", "1");
			map.put("msg", "ɾ��ʧ��");
			map.put("data", null);
		}
		return map;
	}

	
	/**
	 * ��ѯ�û�������Ķ���
	 */
	@Override
	public Map<String, Object> waitPayOrder(String uid) {
		Map<String, Object> map= new HashMap<String,Object>();
		Orders order=new Orders();
		order.setReserve1(uid);
		order.setStatus(1);
		//��ѯ�������
		List<Orders> lis=ordermapper.selectByUidAndStstus(order);
		//����ÿһ������
		List<OrderItem> list=new ArrayList<OrderItem>();
		for (Orders ord : lis) {
			//������Ʒid�鿴��Ʒ��Ϣ
			Goods goods=goodsmapper.selectByPrimaryKey(ord.getGid());
			//��������item
			OrderItem item=new OrderItem();
			item.setOrdertime(ord.getOrdertime());//�µ�ʱ��
			item.setOrdernumber(ord.getOrdernumber());//������
			item.setOrderid(ord.getId());//����id
			item.setGoodsnumber(ord.getGoodsnumber());//��������
			item.setGid(ord.getGid());//��Ʒid
			item.setSample1(goods.getSample1());//��ƷͼƬ
			item.setPrice(goods.getPrice());//��Ʒ����
			item.setSpec(goods.getSpce());//���
			list.add(item);
		}
		map.put("status", "0");
		map.put("msg", "���");
		map.put("data", list);
		return map;
	}

	/**
	 * ��ѯ�����ѷ����İ�ť
	 */
	@Override
	public Map<String, Object> yetSendOrder(String uid) {
		Map<String, Object> map= new HashMap<String,Object>();
		Orders order=new Orders();
		order.setReserve1(uid);
		order.setStatus(3);
		//��ѯ�������
		List<Orders> lis=ordermapper.selectByUidAndStstus(order);
		//����ÿһ������
		List<OrderItem> list=new ArrayList<OrderItem>();
		for (Orders ord : lis) {
			//������Ʒid�鿴��Ʒ��Ϣ
			Goods goods=goodsmapper.selectByPrimaryKey(ord.getGid());
			//��������item
			OrderItem item=new OrderItem();
			item.setOrdertime(ord.getOrdertime());//�µ�ʱ��
			item.setOrdernumber(ord.getOrdernumber());//������
			item.setOrderid(ord.getId());//����id
			item.setGoodsnumber(ord.getGoodsnumber());//��������
			item.setGid(ord.getGid());//��Ʒid
			item.setSample1(goods.getSample1());//��ƷͼƬ
			item.setPrice(goods.getPrice());//��Ʒ����
			item.setSpec(goods.getSpce());//���
			list.add(item);
		}
		map.put("status", "0");
		map.put("msg", "���");
		map.put("data", list);
		return map;
	}

	/**
	 * ��ѯ���д����۶���
	 */
	@Override
	public Map<String, Object> waitEvaluate(String uid) {
		Map<String, Object> map= new HashMap<String,Object>();
		Orders order=new Orders();
		order.setReserve1(uid);
		order.setStatus(4);
		//��ѯ�������
		List<Orders> lis=ordermapper.selectByUidAndStstus(order);
		//����ÿһ������
		List<OrderItem> list=new ArrayList<OrderItem>();
		for (Orders ord : lis) {
			//������Ʒid�鿴��Ʒ��Ϣ
			Goods goods=goodsmapper.selectByPrimaryKey(ord.getGid());
			//��������item
			OrderItem item=new OrderItem();
			item.setOrdertime(ord.getOrdertime());//�µ�ʱ��
			item.setOrdernumber(ord.getOrdernumber());//������
			item.setOrderid(ord.getId());//����id
			item.setGoodsnumber(ord.getGoodsnumber());//��������
			item.setGid(ord.getGid());//��Ʒid
			item.setSample1(goods.getSample1());//��ƷͼƬ
			item.setPrice(goods.getPrice());//��Ʒ����
			item.setSpec(goods.getSpce());//���
			list.add(item);
		}
		map.put("status", "0");
		map.put("msg", "���");
		map.put("data", list);
		return map;
	}
	
	
	
	
	
	
}
