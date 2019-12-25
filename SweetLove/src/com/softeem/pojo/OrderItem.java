package com.softeem.pojo;

public class OrderItem {
	private String ordertime;//下单时间
	private String ordernumber;//订单号
	private String orderid;//订单id
	private int goodsnumber;//购买数量
	
	
	private String gid;//商品id
	private String sample1;//商品图片
	private String goodsname;//商品名
	private String spec;//商品规格
	private double price;//单价
	public OrderItem() {
		super();
	}
	public OrderItem(String ordertime, String ordernumber, String orderid, int goodsnumber, String gid, String sample1,
			String goodsname, String spec, double price) {
		super();
		this.ordertime = ordertime;
		this.ordernumber = ordernumber;
		this.orderid = orderid;
		this.goodsnumber = goodsnumber;
		this.gid = gid;
		this.sample1 = sample1;
		this.goodsname = goodsname;
		this.spec = spec;
		this.price = price;
	}
	public String getOrdertime() {
		return ordertime;
	}
	public void setOrdertime(String ordertime) {
		this.ordertime = ordertime;
	}
	public String getOrdernumber() {
		return ordernumber;
	}
	public void setOrdernumber(String ordernumber) {
		this.ordernumber = ordernumber;
	}
	public String getOrderid() {
		return orderid;
	}
	public void setOrderid(String orderid) {
		this.orderid = orderid;
	}
	public int getGoodsnumber() {
		return goodsnumber;
	}
	public void setGoodsnumber(int goodsnumber) {
		this.goodsnumber = goodsnumber;
	}
	public String getGid() {
		return gid;
	}
	public void setGid(String gid) {
		this.gid = gid;
	}
	public String getSample1() {
		return sample1;
	}
	public void setSample1(String sample1) {
		this.sample1 = sample1;
	}
	public String getGoodsname() {
		return goodsname;
	}
	public void setGoodsname(String goodsname) {
		this.goodsname = goodsname;
	}
	public String getSpec() {
		return spec;
	}
	public void setSpec(String spec) {
		this.spec = spec;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	
}
