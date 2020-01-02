package com.softeem.mapper;

import org.springframework.stereotype.Component;

import com.softeem.pojo.User;

@Component
public interface UserMapper {
	//ͨ��idɾ��
    int deleteByPrimaryKey(String id);

    //��������
    int insert(User record);

    //���벿������
    int insertSelective(User record);

    //ͨ��id��ѯ
    User selectByPrimaryKey(String id);

    //ͨ��id�޸Ĳ�����Ϣ
    int updateByPrimaryKeySelective(User record);
    
    //ͨ��id�޸�������Ϣ
    int updateByPrimaryKey(User record);
    
    //��ѯ�ֻ����Ƿ�ռ��
    User selectByPhone(String phone);
    
    //�û���¼ �����ֻ��ź������ѯ
    User selectByLogin(User user);
    
    //�޸��û���¼״̬
    int updateByPhone(User user);
    
    //����id���û������ѯ�û�
    User selectByIdAndPassword(User user);
    
    //����id�޸�����
    int updatePassword(User user);
    
    
    
}