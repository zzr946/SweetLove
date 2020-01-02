package com.softeem.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import com.softeem.mapper.AddressMapper;
import com.softeem.mapper.CartMapper;
import com.softeem.mapper.GoodsMapper;
import com.softeem.pojo.Address;
import com.softeem.pojo.Cart;
import com.softeem.pojo.Goods;
import com.softeem.service.CartService;
import com.softeem.tools.Tools;

@Component("cartServiceImpl")
public class CartServiceImpl implements CartService {

	@Resource
	CartMapper cartmapper;
	@Resource
	GoodsMapper goodsmapper;
	
	@Resource
	AddressMapper addressmapper;
	
	/**
	 * ��ӵ����ﳵ
	 */
	@Override
	public Map<String, Object> addCart(String uid, String gid,String number) {
		Map<String, Object> map =new HashMap<String, Object>();
		//�����ж��û��Ƿ��Ѿ���ӵ����ﳵ
		Cart car=new Cart();
		car.setUid(uid);
		car.setGid(gid);
		Cart c=cartmapper.selectByUidAndGid(car);
		if(c!=null){
			//�Ѿ���ӹ��ˣ����޸ĸ���Ʒ������
			Cart updatecart=new Cart();
			updatecart.setId(c.getId());//���ݲ�ѯ������Ʒid�޸�
			updatecart.setNumber(c.getNumber()+Integer.valueOf(number));//��������
			updatecart.setTotal((c.getNumber()+Integer.valueOf(number))*c.getPrice());//�޸�С�Ƽ۸�
			cartmapper.updateByPrimaryKeySelective(updatecart);//�޸�
			map.put("status", "0");
			map.put("msg", "��ӳɹ�");
			map.put("data", null);
			return map;
		}
		//������Ʒid��ѯ��Ʒ��ϸ��Ϣ
		Goods goods=goodsmapper.selectByPrimaryKey(gid);
		//�������ﳵ����
		Cart cart=new Cart();
		cart.setId(Tools.getUUID());
		cart.setGid(gid);
		cart.setUid(uid);
		cart.setGoodsphoto(goods.getSample1());
		cart.setGoodsname(goods.getGoodsname());
		cart.setSpce(goods.getSpce());
		cart.setPrice(goods.getPrice());
		cart.setNumber(Integer.valueOf(number));
		cart.setTotal(Integer.valueOf(number)*goods.getPrice());
		cart.setStatus(0);
		//����Ʒ��Ŀ��ӵ����ﳵ����
		int i=cartmapper.insert(cart);
		if(i>=1){
			//�ɹ�
			map.put("status", "0");
			map.put("msg", "��ӳɹ�");
			map.put("data", null);
		}else{
			//ʧ��
			map.put("status", "1");
			map.put("msg", "���ʧ��");
			map.put("data", null);
		}
		return map;
	}


	/**
	 * ��ѯ�û����ﳵ�е�������Ʒ
	 */
	@Override
	public Map<String, Object> cartAll(String uid) {
		Map<String, Object> map=new HashMap<String,Object>();
		//����mapper���ѯ
		List<Cart> list=cartmapper.selectByuid(uid);
		map.put("status", "0");
		map.put("msg", "��ѯ�ɹ�");
		map.put("data",list);
		return map;
	}


	/**
	 * �û��ӹ��ﳵ��ɾ����Ʒ
	 */
	@Override
	public Map<String, Object> delGoods(String uid, String gid) {
		Map<String, Object> map=new HashMap<String,Object>();
		//����mapper�ķ���
		Cart cart=new Cart();
		cart.setUid(uid);
		cart.setGid(gid);
		int i=cartmapper.updateByUidAndGid(cart);
		if(i>=1){
			//ɾ���ɹ�
			//�����û�id��ѯ���й��ﳵ�е���Ʒ
			List<Cart> list=cartmapper.selectByuid(uid);
			map.put("status", "0");
			map.put("msg", "ɾ���ɹ�");
			map.put("data", list);
		}else{
			//ɾ��ʧ��
			map.put("status", "1");
			map.put("msg", "ɾ��ʧ��");
			map.put("data", null);
		}
		return map;
	}


	/**
	 * ���ӹ��ﳵ����Ʒ����
	 */
	@Override
	public Map<String, Object> addGoodsNumber(String uid, String gid, String number,String price) {
		Map<String, Object> map=new HashMap<String,Object>();
		//����mapper���������
		Cart car=new Cart();
		car.setUid(uid);
		car.setGid(gid);
		car.setNumber(Integer.valueOf(number)+1);//����
		car.setTotal((Integer.valueOf(number)+1)*Double.valueOf(price));//С��
		int i=cartmapper.updateByid(car);
		//��ѯ������Ʒ
		List<Cart> list=cartmapper.selectByuid(uid);
		map.put("status", "0");
		map.put("msg", "�ɹ�");
		map.put("data", list);
		return map;
	}


	/**
	 * ������Ʒ����
	 */
	@Override
	public Map<String, Object> subGoodsNumber(String uid, String gid, String number, String price) {
		Map<String, Object> map=new HashMap<String,Object>();
		//����mapper���������
		Cart car=new Cart();
		car.setUid(uid);
		car.setGid(gid);
		car.setNumber(Integer.valueOf(number)-1);//����
		car.setTotal((Integer.valueOf(number)-1)*Double.valueOf(price));//С��
		int i=cartmapper.updateByid(car);
		//��ѯ������Ʒ
		List<Cart> list=cartmapper.selectByuid(uid);
		map.put("status", "0");
		map.put("msg", "�ɹ�");
		map.put("data", list);
		return map;
	}

	
	/**
	 * ��ѯ�û�ȷ�Ϲ���Ķ�����
	 */
	@Override
	public Map<String, Object> affirmBuy(String uid, String gids, String sumprice) {
		Map<String, Object> map=new HashMap<String,Object>();
		//��ȡ��Ʒid����
		String ids[]=gids.split("~");
		//����һ�����ﳵ���
		List<Cart> cartItemList=new ArrayList<Cart>();
		for (String str : ids) {
			//������Ʒid��ѯ��Ʒ��Ϣ(�ӹ��ﳵ����)
			//System.out.println(str);
			Cart car=cartmapper.selectByPrimaryKey(str);
			cartItemList.add(car);//����ȷ�Ϲ������Ʒ
			//��ȷ�Ϲ������Ʒ�ӹ��ﳵ����ɾ��(״̬����Ϊ1)
			Cart cart=new Cart();
			cart.setId(str);
			cart.setStatus(1);
			cartmapper.updateByPrimaryKeySelective(cart);
		}
		//�����û�id��ѯ�û��ĵ�ַ
		List<Address> addressList=addressmapper.selectAddressAll(uid);
		map.put("status", "0");
		map.put("msg", "��ѯ�ɹ�");
		map.put("cartItemList", cartItemList);
		map.put("addressList", addressList);
		return map;
	}
	
	
	
	
	
	
	
}
