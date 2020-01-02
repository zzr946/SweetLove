package com.softeem.mapper;

import java.util.List;

import com.softeem.pojo.Address;

public interface AddressMapper {
    int deleteByPrimaryKey(String id);

    int insert(Address record);

    int insertSelective(Address record);

    Address selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(Address record);

    int updateByPrimaryKey(Address record);
    
    //��ѯ�û��Ŀ��õ�ַ
    List<Address> selectAddressAll(String uid);
    
    //�޸ĵ�ַ״̬
    int updataByid(Address address);
    
    //����ַ�޸�ΪĬ��״̬
    int updateByDefault(Address address);
    
    //ɾ����ַ�ķ���
    int delAddress(Address address);
    
    
    
    
}