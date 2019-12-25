package com.softeem.mapper;

import java.util.List;

import com.softeem.pojo.Collect;

public interface CollectMapper {
    int deleteByPrimaryKey(String id);

    int insert(Collect record);

    int insertSelective(Collect record);

    Collect selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(Collect record);

    int updateByPrimaryKey(Collect record);
    
    //查询所有收藏的商品
    List<Collect> selectAll();
    
}