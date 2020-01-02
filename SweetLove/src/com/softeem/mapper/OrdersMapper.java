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
    
    //�����û�id�鿴����δɾ���Ķ���
    List<Orders> selectByUid(String uid);
    
    //�����û�id�鿴���з��������Ķ���
    List<Orders> selectByUidAndStstus(Orders order);
    
    
    
}