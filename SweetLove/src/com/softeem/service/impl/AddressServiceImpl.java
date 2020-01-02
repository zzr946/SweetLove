package com.softeem.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import com.softeem.mapper.AddressMapper;
import com.softeem.pojo.Address;
import com.softeem.service.AddressService;
import com.softeem.tools.Tools;
@Component("addressServiceImpl")
public class AddressServiceImpl implements AddressService {

	@Resource
	AddressMapper addressmapper;
	
	/**
	 * ����ջ���ַ status(0�ɹ� 1ʧ�� 2��������)
	 */
	@Override
	public Map<String, Object> addAddress(String uid, String adduser, String phone, String detailadd) {
		Map<String,Object> map=new HashMap<String, Object>();
		//��ѯ���û��Ѿ�����˼�����ַ
		List<Address> addlist=addressmapper.selectAddressAll(uid);
		if(addlist.size()>=3){
			map.put("status", "2");
			map.put("msg", "�Ѿ��ﵽ����");
			map.put("data", addlist);
			return map;
		}
		//����ַ��Ϣ�������ݿ�
		Address address=new Address();
		address.setId(Tools.getUUID());
		address.setUid(uid);
		address.setDetailadd(detailadd);
		address.setAdduser(adduser);
		address.setPhone(phone);
		address.setStatus(0);
		//������
		int i=addressmapper.insert(address);
		//������ٲ�ѯ��������
		List<Address> list=addressmapper.selectAddressAll(uid);
		if(i>=1){
			//�ɹ�
			map.put("status", "0");
			map.put("msg", "�ɹ�");
			map.put("data", list);
		}else{
			//ʧ��
			map.put("status", "1");
			map.put("msg", "ʧ��");
			map.put("data", list);
		}
		return map;
	}

	/**
	 * ��ѯ�û����е�ַ
	 */
	@Override
	public Map<String, Object> addressAll(String uid) {
		Map<String,Object> map=new HashMap<String,Object>();
		//����mapper���ѯ�û���ַ��Ϣ
		List<Address> list=addressmapper.selectAddressAll(uid);
		map.put("status", "0");
		map.put("msg", "��ѯ�ɹ�");
		map.put("data", list);
		return map;
	}

	/**
	 * �޸�Ĭ�ϵ�ַ
	 */
	@Override
	public Map<String, Object> modifyDefaultAddress(String id,String uid) {
		Map<String,Object> map=new HashMap<String,Object>();
		//���Ƚ����û������п��õ�ַ�޸�Ϊ��Ĭ�ϵ�ַ
		Address address=new Address();
		address.setId(id);
		address.setUid(uid);
		addressmapper.updataByid(address);
		//�����û��µ�ָ����ַid�ĵ�ַ�޸�ΪĬ��״̬
		int i=addressmapper.updateByDefault(address);
		if(i>=1){
			//�ɹ�
			map.put("status", "0");
			map.put("msg", "�ɹ�");
			map.put("data", null);
		}else{
			//ʧ��
			map.put("status", "1");
			map.put("msg", "ʧ��");
			map.put("data", null);
		}
		return map;
	}

	/**
	 * ɾ����ַ
	 */
	@Override
	public Map<String, Object> delAddress(String id, String uid) {
		Map<String,Object> map=new HashMap<String,Object>();
		Address address=new Address();
		address.setId(id);
		address.setUid(uid);
		int i=addressmapper.delAddress(address);
		if(i>=1){
			//�ɹ�
			map.put("status", "0");
			map.put("msg", "ɾ���ɹ�");
			map.put("data", null);
		}else{
			//ʧ��
			map.put("status", "1");
			map.put("msg", "ɾ��ʧ��");
			map.put("data", null);
		}
		return map;
	}

	
	
	
}
