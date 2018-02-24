package com.sys.tool;

import com.alibaba.fastjson.JSON;

public class ResultData {
	
	private Boolean result = false;
	
	private Object data = null;
	
	private String message = null;
	
	private String errorMessage = null;
	
	private String successUrl = null;

	private String errorUrl = null;

	private Integer errorNum = null;/*´íÎóºÅ*/
	
	public String jsonFormat() {
		if(result == false && errorNum == null) {
			this.setErrorNum(0);
		}
		return JSON.toJSONString(this);
	}

	public Boolean getResult() {
		return result;
	}

	public void setResult(Boolean result) {
		this.result = result;
	}

	public Object getData() {
		return data;
	}

	public void setData(Object data) {
		this.data = data;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public String getErrorMessage() {
		return errorMessage;
	}

	public String getSuccessUrl() {
		return successUrl;
	}

	public void setSuccessUrl(String successUrl) {
		this.successUrl = successUrl;
	}

	public String getErrorUrl() {
		return errorUrl;
	}

	public void setErrorUrl(String errorUrl) {
		this.errorUrl = errorUrl;
	}

	public Integer getErrorNum() {
		return errorNum;
	}

	public void setErrorNum(Integer errorNum) {
		this.errorMessage = ErrorList.getErrorInfoByNum(errorNum);
		this.errorNum = errorNum;
	}
	
	public void setErrorNum(Integer errorNum,String errorMessage) {
		this.errorMessage = errorMessage;
		this.errorNum = errorNum;
	}

	@Override
	public String toString() {
		return "ResultData [result=" + result + ", data=" + data + ", message=" + message + ", errorMessage="
				+ errorMessage + ", successUrl=" + successUrl + ", errorUrl=" + errorUrl + ", errorNum=" + errorNum
				+ "]";
	}

	
}
