package com.softeem.mapper;

import java.util.List;

import com.softeem.pojo.Cart;

public interface CartMapper {
    int deleteByPrimaryKey(String id);

    int insert(Cart record);

    int insertSelective(Cart record);

    Cart selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(Cart record);

    int updateByPrimaryKey(Cart record);
    
    //��ѯ�û��Ƿ��Ѿ�����˴���Ʒ
    Cart selectByUidAndGid(Cart cart);
    
    //�����û�id��ѯ���ﳵ��������Ʒ
    List<Cart> selectByuid(String uid);
    
    //�ӹ��ﳵ��ɾ����Ʒ
    int updateByUidAndGid(Cart cart);
    
    //�ı乺�ﳵ����Ʒ������
    int updateByid(Cart cart);
    
    
    
    
}