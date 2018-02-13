package com.sys.tool;

import java.util.HashMap;

public class ErrorList {
	
	private static HashMap<Integer,String> errorMap = null;
	
	static {
		errorMap = new HashMap<>();
		errorMap.put(0, "δ֪����");
		errorMap.put(1, "�˺Ų�����");
		errorMap.put(2, "�˺��������");
		errorMap.put(3, "��Ϣ�ύ����");
		errorMap.put(4, "��ǰ�û�û�д�Ȩ��");
		errorMap.put(5, "��ѯ�޽��");
		errorMap.put(6, "�˺Ų�����");
		errorMap.put(7, "�˺Ų�����");
	}
	
	public static final String getErrorInfoByNum(int errorNum) {
		String message = errorMap.get(errorNum);
		if(message != null) {
			return message;
		}
		return "δ֪�����:" + errorNum;
	}
}
