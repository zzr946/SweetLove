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
    
    //查询所有商品列表
    List<Goods> selectGoodsAll();
    
    //模糊查询商品
    List<Goods> selectByInp(String name);
    
    
}