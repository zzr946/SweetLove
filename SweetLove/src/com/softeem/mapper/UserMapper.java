package com.softeem.mapper;

import org.springframework.stereotype.Component;

import com.softeem.pojo.User;

@Component
public interface UserMapper {
	//通过id删除
    int deleteByPrimaryKey(String id);

    //插入数据
    int insert(User record);

    //插入部分数据
    int insertSelective(User record);

    //通过id查询
    User selectByPrimaryKey(String id);

    //通过id修改部分信息
    int updateByPrimaryKeySelective(User record);
    
    //通过id修改所有信息
    int updateByPrimaryKey(User record);
    
    //查询手机号是否被占用
    User selectByPhone(String phone);
    
    //用户登录 根据手机号和密码查询
    User selectByLogin(User user);
    
    //修改用户登录状态
    int updateByPhone(User user);
    
    //根据id与用户密码查询用户
    User selectByIdAndPassword(User user);
    
    //根据id修改密码
    int updatePassword(User user);
    
    
    
}