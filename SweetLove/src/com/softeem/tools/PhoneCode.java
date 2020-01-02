package com.softeem.tools;

import java.util.Random;

import com.aliyuncs.CommonRequest;
import com.aliyuncs.CommonResponse;
import com.aliyuncs.DefaultAcsClient;
import com.aliyuncs.IAcsClient;
import com.aliyuncs.exceptions.ClientException;
import com.aliyuncs.exceptions.ServerException;
import com.aliyuncs.http.MethodType;
import com.aliyuncs.profile.DefaultProfile;

public class PhoneCode {
	/**
	 * @param phone
	 *            ���͵����ֻ���
	 * @param code
	 *            ��֤������
	 */
	public static void sendCode(String phone, String code) {
		DefaultProfile profile = DefaultProfile.getProfile(Constant.REGIONID, Constant.ACCESSKEYID,
				Constant.ACCESSKEYSECRET);
		IAcsClient client = new DefaultAcsClient(profile);

		CommonRequest request = new CommonRequest();
		request.setMethod(MethodType.POST);
		request.setDomain("dysmsapi.aliyuncs.com");
		request.setVersion("2017-05-25");
		request.setAction("SendSms");
		request.putQueryParameter("RegionId", "cn-hangzhou");
		request.putQueryParameter("PhoneNumbers", phone);// �ֻ�����
		request.putQueryParameter("SignName", Constant.SIGNNAME);// ����ǩ��
		request.putQueryParameter("TemplateCode", Constant.TEMPLATECODE);// ģ����

		request.putQueryParameter("TemplateParam", "{\"code\":\"" + code + "\"}");// ģ���еı���JSON�����ʽ
		try {
			CommonResponse response = client.getCommonResponse(request);
			System.out.println(response.getData());
		} catch (ServerException e) {
			e.printStackTrace();
		} catch (ClientException e) {
			e.printStackTrace();
		}
	}

	/**
	 * @return ������ɵ�6λ��֤��
	 */
	public static String getCode() {
		StringBuilder sb = new StringBuilder();
		for (int i = 0; sb.length() < 6; i++) {
			int num = new Random().nextInt(10);
			sb.append(num);
		}
		return sb.toString();
	}

}
