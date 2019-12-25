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
	 * 生成订单的方法
	 */
	@Override
	public Map<String, Object> createOrder(String uid, String cartids, String addid) {
		Map<String, Object> map=new HashMap<String,Object>();
		//得到每一个购物车id
		String[] ids=cartids.split("~");
		String orderids="";
		for (String cartid : ids) {
			//调用cartMAPPER，根据id查询购物车项
			Cart cartItem=cartmapper.selectByPrimaryKey(cartid);
			//获取uuid
			String id=Tools.getUUID();
			//将订单id字符串保存到下一个页面
			orderids+=id+"~";
			//获取订单编号、
			String ordernumber=Tools.getNum();
			//获取下单时间
			String ordertime=Tools.dateToStr("yyyy-MM-dd HH:mm", new Date());
			//获取商品id
			String gid=cartItem.getGid();
			//获取商品数量
			int goodsnumber=cartItem.getNumber();
			//获取商品金额
			double total=cartItem.getTotal();
			//创建orders对象
			Orders order=new Orders();
			order.setId(id);
			order.setOrdernumber(ordernumber);
			order.setOrdertime(ordertime);
			order.setGid(gid);
			order.setGoodsnumber(goodsnumber);
			order.setTotal(total);
			order.setAddid(addid);
			order.setStatus(1);//等待付款状态
			order.setReserve1(uid);//用户id
			//调用mapper存数据
			ordermapper.insertSelective(order);
		}
		map.put("ids", orderids);
		return map;
	}

	/**
	 * 用户完成支付，将订单状态改为已支付2
	 * (用户id,订单id串)
	 */
	@Override
	public Map<String, Object> yetPay(String uid, String ids) {
		Map<String, Object> map=new HashMap<String,Object>();
		//得到每一个购物车id
		String[] cartid=ids.split("~");
		for (String id : cartid) {
			//根据订单id将订单状态修改
			Orders order=new Orders();
			order.setId(id);
			order.setStatus(2);//已支付状态
			ordermapper.updateByPrimaryKeySelective(order);
		}
		return map;
	}

	/**
	 * 查看所有订单
	 */
	@Override
	public Map<String, Object> orderAll(String uid) {
		Map<String, Object> map=new HashMap<String,Object>();
		//订单每一个单项
		List<OrderItem> list=new ArrayList<OrderItem>();
		//调用mapper查看订单
		List<Orders> lis=ordermapper.selectByUid(uid);
		for (Orders ord : lis) {
			//根据商品id查看商品信息
			Goods goods=goodsmapper.selectByPrimaryKey(ord.getGid());
			//创建订单item
			OrderItem item=new OrderItem();
			item.setOrdertime(ord.getOrdertime());//下单时间
			item.setOrdernumber(ord.getOrdernumber());//订单号
			item.setOrderid(ord.getId());//订单id
			item.setGoodsnumber(ord.getGoodsnumber());//购买数量
			item.setGid(ord.getGid());//商品id
			item.setSample1(goods.getSample1());//商品图片
			item.setPrice(goods.getPrice());//商品单价
			item.setSpec(goods.getSpce());//规格
			list.add(item);
		}
		map.put("status", "0");
		map.put("msg", "完毕");
		map.put("data", list);
		return map;
	}

	/**
	 * 删除订单
	 */
	@Override
	public Map<String, Object> delOrder(String uid, String orderid) {
		Map<String, Object> map=new HashMap<String,Object>();
		//调用ordermapper层修改状态为5
		Orders order=new Orders();
		order.setId(orderid);//订单id
		order.setStatus(5);
		//order.setReserve1(uid);//用户id
		int i=ordermapper.updateByPrimaryKeySelective(order);
		if(i>=1){
			//成功
			//查询该用户下所有未删除的订单
			return orderAll(uid);
			/*map.put("status", "0");
			map.put("msg", "删除成功");
			map.put("data", list);*/
		}else{
			//失败
			map.put("status", "1");
			map.put("msg", "删除失败");
			map.put("data", null);
		}
		return map;
	}

	
	/**
	 * 查询用户待付款的订单
	 */
	@Override
	public Map<String, Object> waitPayOrder(String uid) {
		Map<String, Object> map= new HashMap<String,Object>();
		Orders order=new Orders();
		order.setReserve1(uid);
		order.setStatus(1);
		//查询代付款订单
		List<Orders> lis=ordermapper.selectByUidAndStstus(order);
		//订单每一个单项
		List<OrderItem> list=new ArrayList<OrderItem>();
		for (Orders ord : lis) {
			//根据商品id查看商品信息
			Goods goods=goodsmapper.selectByPrimaryKey(ord.getGid());
			//创建订单item
			OrderItem item=new OrderItem();
			item.setOrdertime(ord.getOrdertime());//下单时间
			item.setOrdernumber(ord.getOrdernumber());//订单号
			item.setOrderid(ord.getId());//订单id
			item.setGoodsnumber(ord.getGoodsnumber());//购买数量
			item.setGid(ord.getGid());//商品id
			item.setSample1(goods.getSample1());//商品图片
			item.setPrice(goods.getPrice());//商品单价
			item.setSpec(goods.getSpce());//规格
			list.add(item);
		}
		map.put("status", "0");
		map.put("msg", "完毕");
		map.put("data", list);
		return map;
	}

	/**
	 * 查询所有已发货的按钮
	 */
	@Override
	public Map<String, Object> yetSendOrder(String uid) {
		Map<String, Object> map= new HashMap<String,Object>();
		Orders order=new Orders();
		order.setReserve1(uid);
		order.setStatus(3);
		//查询代付款订单
		List<Orders> lis=ordermapper.selectByUidAndStstus(order);
		//订单每一个单项
		List<OrderItem> list=new ArrayList<OrderItem>();
		for (Orders ord : lis) {
			//根据商品id查看商品信息
			Goods goods=goodsmapper.selectByPrimaryKey(ord.getGid());
			//创建订单item
			OrderItem item=new OrderItem();
			item.setOrdertime(ord.getOrdertime());//下单时间
			item.setOrdernumber(ord.getOrdernumber());//订单号
			item.setOrderid(ord.getId());//订单id
			item.setGoodsnumber(ord.getGoodsnumber());//购买数量
			item.setGid(ord.getGid());//商品id
			item.setSample1(goods.getSample1());//商品图片
			item.setPrice(goods.getPrice());//商品单价
			item.setSpec(goods.getSpce());//规格
			list.add(item);
		}
		map.put("status", "0");
		map.put("msg", "完毕");
		map.put("data", list);
		return map;
	}

	/**
	 * 查询所有待评价订单
	 */
	@Override
	public Map<String, Object> waitEvaluate(String uid) {
		Map<String, Object> map= new HashMap<String,Object>();
		Orders order=new Orders();
		order.setReserve1(uid);
		order.setStatus(4);
		//查询代付款订单
		List<Orders> lis=ordermapper.selectByUidAndStstus(order);
		//订单每一个单项
		List<OrderItem> list=new ArrayList<OrderItem>();
		for (Orders ord : lis) {
			//根据商品id查看商品信息
			Goods goods=goodsmapper.selectByPrimaryKey(ord.getGid());
			//创建订单item
			OrderItem item=new OrderItem();
			item.setOrdertime(ord.getOrdertime());//下单时间
			item.setOrdernumber(ord.getOrdernumber());//订单号
			item.setOrderid(ord.getId());//订单id
			item.setGoodsnumber(ord.getGoodsnumber());//购买数量
			item.setGid(ord.getGid());//商品id
			item.setSample1(goods.getSample1());//商品图片
			item.setPrice(goods.getPrice());//商品单价
			item.setSpec(goods.getSpce());//规格
			list.add(item);
		}
		map.put("status", "0");
		map.put("msg", "完毕");
		map.put("data", list);
		return map;
	}
	
	
	
	
	
	
}
