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
	 * 添加到购物车
	 */
	@Override
	public Map<String, Object> addCart(String uid, String gid,String number) {
		Map<String, Object> map =new HashMap<String, Object>();
		//首先判断用户是否已经添加到购物车
		Cart car=new Cart();
		car.setUid(uid);
		car.setGid(gid);
		Cart c=cartmapper.selectByUidAndGid(car);
		if(c!=null){
			//已经添加过了，则修改该商品的数量
			Cart updatecart=new Cart();
			updatecart.setId(c.getId());//根据查询到的商品id修改
			updatecart.setNumber(c.getNumber()+Integer.valueOf(number));//数量增加
			updatecart.setTotal((c.getNumber()+Integer.valueOf(number))*c.getPrice());//修改小计价格
			cartmapper.updateByPrimaryKeySelective(updatecart);//修改
			map.put("status", "0");
			map.put("msg", "添加成功");
			map.put("data", null);
			return map;
		}
		//根据商品id查询商品详细信息
		Goods goods=goodsmapper.selectByPrimaryKey(gid);
		//创建购物车对象
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
		//将商品项目添加到购物车表中
		int i=cartmapper.insert(cart);
		if(i>=1){
			//成功
			map.put("status", "0");
			map.put("msg", "添加成功");
			map.put("data", null);
		}else{
			//失败
			map.put("status", "1");
			map.put("msg", "添加失败");
			map.put("data", null);
		}
		return map;
	}


	/**
	 * 查询用户购物车中的所有商品
	 */
	@Override
	public Map<String, Object> cartAll(String uid) {
		Map<String, Object> map=new HashMap<String,Object>();
		//调用mapper层查询
		List<Cart> list=cartmapper.selectByuid(uid);
		map.put("status", "0");
		map.put("msg", "查询成功");
		map.put("data",list);
		return map;
	}


	/**
	 * 用户从购物车中删除商品
	 */
	@Override
	public Map<String, Object> delGoods(String uid, String gid) {
		Map<String, Object> map=new HashMap<String,Object>();
		//调用mapper的方法
		Cart cart=new Cart();
		cart.setUid(uid);
		cart.setGid(gid);
		int i=cartmapper.updateByUidAndGid(cart);
		if(i>=1){
			//删除成功
			//根据用户id查询所有购物车中的商品
			List<Cart> list=cartmapper.selectByuid(uid);
			map.put("status", "0");
			map.put("msg", "删除成功");
			map.put("data", list);
		}else{
			//删除失败
			map.put("status", "1");
			map.put("msg", "删除失败");
			map.put("data", null);
		}
		return map;
	}


	/**
	 * 增加购物车中商品数量
	 */
	@Override
	public Map<String, Object> addGoodsNumber(String uid, String gid, String number,String price) {
		Map<String, Object> map=new HashMap<String,Object>();
		//调用mapper层改修数量
		Cart car=new Cart();
		car.setUid(uid);
		car.setGid(gid);
		car.setNumber(Integer.valueOf(number)+1);//数量
		car.setTotal((Integer.valueOf(number)+1)*Double.valueOf(price));//小计
		int i=cartmapper.updateByid(car);
		//查询所有商品
		List<Cart> list=cartmapper.selectByuid(uid);
		map.put("status", "0");
		map.put("msg", "成功");
		map.put("data", list);
		return map;
	}


	/**
	 * 减少商品数量
	 */
	@Override
	public Map<String, Object> subGoodsNumber(String uid, String gid, String number, String price) {
		Map<String, Object> map=new HashMap<String,Object>();
		//调用mapper层改修数量
		Cart car=new Cart();
		car.setUid(uid);
		car.setGid(gid);
		car.setNumber(Integer.valueOf(number)-1);//数量
		car.setTotal((Integer.valueOf(number)-1)*Double.valueOf(price));//小计
		int i=cartmapper.updateByid(car);
		//查询所有商品
		List<Cart> list=cartmapper.selectByuid(uid);
		map.put("status", "0");
		map.put("msg", "成功");
		map.put("data", list);
		return map;
	}

	
	/**
	 * 查询用户确认购买的订单项
	 */
	@Override
	public Map<String, Object> affirmBuy(String uid, String gids, String sumprice) {
		Map<String, Object> map=new HashMap<String,Object>();
		//获取商品id数组
		String ids[]=gids.split("~");
		//定义一个购物车项集合
		List<Cart> cartItemList=new ArrayList<Cart>();
		for (String str : ids) {
			//根据商品id查询商品信息(从购物车表中)
			//System.out.println(str);
			Cart car=cartmapper.selectByPrimaryKey(str);
			cartItemList.add(car);//所有确认购买的商品
			//将确认购买的商品从购物车表中删除(状态设置为1)
			Cart cart=new Cart();
			cart.setId(str);
			cart.setStatus(1);
			cartmapper.updateByPrimaryKeySelective(cart);
		}
		//根据用户id查询用户的地址
		List<Address> addressList=addressmapper.selectAddressAll(uid);
		map.put("status", "0");
		map.put("msg", "查询成功");
		map.put("cartItemList", cartItemList);
		map.put("addressList", addressList);
		return map;
	}
	
	
	
	
	
	
	
}
