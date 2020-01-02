package com.softeem.tools;

import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;
import java.util.UUID;
import com.softeem.encrypt.MD5;


/**
 * ͨ�ù�����
 * @author ��־Ȼ
 *
 */
public class Tools {
	
	/**
	 * ��������Dateʱ��תΪָ���ĸ�ʽ�ַ���
	 * @param path ָ����ʽ
	 * @param date ������Dateʱ��
	 * @return ����ָ����ʽת���õ�ʱ���ַ���
	 */
	public static String dateToStr(String path,Date date){
		return new SimpleDateFormat(path).format(date);
	}

	/**
	 * ��ȡUUID
	 * @return
	 */
	public static String getUUID(){
		return UUID.randomUUID().toString();
	}
	/**
	 * ͨ��MD5���ַ������м��ܴ���
	 * @param password ��Ҫ���ܵ��ַ���
	 * @return ���ܺ���ַ���
	 */
	public static String getMD5(String password){
		return new MD5().getMD5ofStr(password);
	}
	
	/**
	 * ������Ʒ��ŵķ���
	 * @return ����������ɵ�10Ϊ��
	 */
	public static String getNum(){
		StringBuffer sb=new StringBuffer();
		for(int i=1;i<=10;i++){
			int n=new Random().nextInt(10);
			sb.append(n+"");
		}
		return sb.toString();
	}
	
	
//	public static void main(String[] args) {
//		System.out.println(getUUID());
//		System.out.println(getNum());
//		System.out.println(13172+9136+1256+2167);
//	}
	
	

}