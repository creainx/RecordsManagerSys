package com.sys.tool;

import java.io.FileOutputStream;
import java.util.Date;
import java.util.UUID;
//import sun.misc.BASE64Decoder;

public class SystemTool {

	public static String createUUID() {
		return UUID.randomUUID().toString().replace("-", "");
	}

	public static Date getNowDate() {
		return new Date();
	}

	// ��ͼƬ��Base64�ַ�������תΪ�ֽ����飬���д��ָ��ͼƬ�ļ���
	/*
	 * public static void writeImgBase64ToFile(String imgBase64,String
	 * filePath)throws Exception{ if(imgBase64 == null || imgBase64.length() == 0)
	 * return;
	 * 
	 * //�ж��Ƿ����Э��ǰ׺��data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAA
	 * if(imgBase64.startsWith("data")){ imgBase64 =
	 * imgBase64.substring(imgBase64.indexOf(",") + 1); } BASE64Decoder decoder =
	 * new BASE64Decoder(); byte[] bs = decoder.decodeBuffer(imgBase64);
	 * FileOutputStream fos = new FileOutputStream(filePath); fos.write(bs);
	 * fos.close(); }
	 */
}
