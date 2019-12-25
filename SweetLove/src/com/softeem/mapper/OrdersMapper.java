package com.softeem.mapper;

import java.util.List;

import com.softeem.pojo.Orders;

public interface OrdersMapper {
    int deleteByPrimaryKey(String id);

    int insert(Orders record);

    int insertSelective(Orders record);

    Orders selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(Orders record);

    int updateByPrimaryKey(Orders record);
    
    //根据用户id查看所有未删除的订单
    List<Orders> selectByUid(String uid);
    
    //根据用户id查看所有符合条件的订单
    List<Orders> selectByUidAndStstus(Orders order);
    
    
    
}