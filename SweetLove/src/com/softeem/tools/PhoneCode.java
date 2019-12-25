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
	 *            发送到的手机号
	 * @param code
	 *            验证码内容
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
		request.putQueryParameter("PhoneNumbers", phone);// 手机号码
		request.putQueryParameter("SignName", Constant.SIGNNAME);// 短信签名
		request.putQueryParameter("TemplateCode", Constant.TEMPLATECODE);// 模板编号

		request.putQueryParameter("TemplateParam", "{\"code\":\"" + code + "\"}");// 模板中的变量JSON对象格式
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
	 * @return 随机生成的6位验证码
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
