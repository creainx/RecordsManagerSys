package com.sys.tool;

import java.util.HashMap;

public class ErrorList {
	
	private static HashMap<Integer,String> errorMap = null;
	
	static {
		errorMap = new HashMap<>();
		errorMap.put(0, "未知错误");
		errorMap.put(1, "账号不存在");
		errorMap.put(2, "账号密码错误");
		errorMap.put(3, "信息提交错误");
		errorMap.put(4, "当前用户没有此权限");
		errorMap.put(5, "查询无结果");
		errorMap.put(6, "账号不存在");
		errorMap.put(7, "账号不存在");
	}
	
	public static final String getErrorInfoByNum(int errorNum) {
		String message = errorMap.get(errorNum);
		if(message != null) {
			return message;
		}
		return "未知错误号:" + errorNum;
	}
}
