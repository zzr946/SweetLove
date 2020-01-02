package com.softeem.service.impl;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import com.softeem.mapper.UserMapper;
import com.softeem.pojo.User;
import com.softeem.service.UserService;
import com.softeem.tools.Tools;

@Component("userServiceImpl")
public class UserServiceImpl implements UserService {
	//mapper��ʵ��
	@Resource
	UserMapper usermapper;
	
	/**
	 * �û�ע��ķ���
	 */
	@Override
	public Map<String, Object> reg(String phone, String password) {
		Map<String,Object> map=new HashMap<String, Object>();
		//��ѯ�ֻ����Ƿ�ռ��
		User u=usermapper.selectByPhone(phone);
		if(u!=null){
			//�ֻ����Ѿ���ע��
			map.put("status", "3");
			map.put("msg", "�ֻ�����ע��");
			map.put("data", u);
			return map;
		}
		//���û���Ϣ���뵽���ݿ���
		//��ȡuuid
		String id=Tools.getUUID();
		//�������
		password=Tools.getMD5(password);
		User user=new User();
		user.setId(id);
		user.setPhone(phone);
		user.setPassword(password);
		int i=usermapper.insertSelective(user);
		if(i>=1){
			//����ɹ�
			//���û�״̬��Ϊ�Ѽ���״̬
			User use=new User();
			use.setPhone(phone);
			use.setStatus(0);
			usermapper.updateByPhone(use);
			map.put("status", "0");
			map.put("msg", "ע��ɹ�");
			map.put("data", user);
		}else{
			//����ʧ��
			map.put("status", "2");
			map.put("msg", "ע��ʧ��");
			map.put("data", null);
		}
		return map;
	}

	/**
	 * �û��˺������¼
	 */
	@Override
	public Map<String, Object> login(String phone, String password) {
		Map<String,Object> map=new HashMap<String, Object>();
		//�������
		password=Tools.getMD5(password);
		User u=new User();
		u.setPhone(phone);
		u.setPassword(password);
		//����mapper�еķ�����ѯ
		User user=usermapper.selectByLogin(u);
		if(user==null){
			//�û������������
			map.put("status", "1");
			map.put("msg", "�û������������");
			map.put("data", null);
		}else{
			map.put("status", "0");
			map.put("msg", "��¼�ɹ�");
			map.put("data", user);
		}
		return map;
	}

	/**
	 * �û�������֤���¼
	 */
	@Override
	public Map<String, Object> loginByPhone(String phone) {
		Map<String,Object> map=new HashMap<String, Object>();
		return map;
	}

	/**
	 * �û��޸�ͷ��ķ���
	 */
	@Override
	public Map<String, Object> changephoto(String id, String photo) {
		Map<String,Object> map=new HashMap<String,Object>();
		//����mapper��ķ����޸�ͷ��
		User u=new User();
		u.setId(id);
		u.setPhoto(photo);
		int i=usermapper.updateByPrimaryKeySelective(u);
		if(i>=1){
			//�޸ĳɹ�
			//���޸ĺ���û���Ϣ��ѯ��
			User user=usermapper.selectByPrimaryKey(id);
			map.put("status", "0");
			map.put("msg", "�޸ĳɹ�");
			map.put("data", user);
		}else{
			//�޸�ʧ��
			map.put("status", "1");
			map.put("msg", "�޸�ʧ��");
			map.put("data", null);
		}
		return map;
	}

	/**
	 * �û��޸ĸ�����Ϣ
	 */
	@Override
	public Map<String, Object> changeUserinfo(String id, String nickname, String sex) {
		Map<String,Object> map=new HashMap<>();
		//����mapper�ķ����޸���Ϣ
		User u=new User();
		u.setId(id);
		u.setNickname(nickname);
		u.setSex(sex);
		int i=usermapper.updateByPrimaryKeySelective(u);
		if(i>=1){
			//�޸ĳɹ�
			//��ѯ�û���Ϣ
			User user=usermapper.selectByPrimaryKey(id);
			map.put("status", "0");
			map.put("msg", "�޸ĳɹ�");
			map.put("data", user);
		}else{
			//�޸�ʧ��
			map.put("status", "1");
			map.put("msg", "�޸�ʧ��");
			map.put("data", null);
		}
		return map;
	}

	/**
	 * �û��޸�����(status 0�ɹ� 1ʧ�� 2ԭ�������)
	 */
	@Override
	public Map<String, Object> modifyPassword(String id, String oldpassword, String newpassword) {
		Map<String,Object> map=new HashMap<String,Object>();
		//�鿴ԭ�����Ƿ�������ȷ
		//�������
		oldpassword=Tools.getMD5(oldpassword);
		newpassword=Tools.getMD5(newpassword);
		User u=new User();
		u.setId(id);
		u.setPassword(oldpassword);
		User use=usermapper.selectByIdAndPassword(u);
		if(use==null){
			//�������
			map.put("status", "2");
			map.put("msg", "ԭ�����������");
			map.put("data", null);
			return map;
		}
		//ԭ������ȷ,�޸�����
		User user=new User();
		user.setId(id);
		user.setPassword(newpassword);
		int i=usermapper.updatePassword(user);
		if(i>=1){
			//�޸ĳɹ�
			map.put("status", "0");
			map.put("msg", "�޸ĳɹ�");
			map.put("data", null);
		}else{
			//�޸�ʧ��
			map.put("status", "1");
			map.put("msg", "�޸�ʧ��");
			map.put("data", null);
		}
		return map;
	}
	
	
	
}
