package com.softeem.mapper;

import java.util.List;

import com.softeem.pojo.Goods;

public interface GoodsMapper {
    int deleteByPrimaryKey(String id);

    int insert(Goods record);

    int insertSelective(Goods record);

    Goods selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(Goods record);

    int updateByPrimaryKey(Goods record);
    
    //��ѯ������Ʒ�б�
    List<Goods> selectGoodsAll();
    
    //ģ����ѯ��Ʒ
    List<Goods> selectByInp(String name);
    
    
}