package com.sys.tool;

import com.aliyuncs.DefaultAcsClient;
import com.aliyuncs.IAcsClient;
import com.aliyuncs.dysmsapi.model.v20170525.SendSmsRequest;
import com.aliyuncs.dysmsapi.model.v20170525.SendSmsResponse;
import com.aliyuncs.exceptions.ClientException;
import com.aliyuncs.profile.DefaultProfile;
import com.aliyuncs.profile.IClientProfile;

public abstract class PhoneVerificationTool {
	//产品名称
    static final String product = "Dysmsapi";
    //产品域名
    static final String domain = "dysmsapi.aliyuncs.com";
    //用于访问阿里大于API
    static final String accessKeyId = "LTAIsfACHXRRlMCR";
    
    static final String accessKeySecret = "BYnv1UCRwAD3A5ddbOYeSu8V4LBkzA";
    
    //发短信到手机
    public static SendSmsResponse sendSms(String PhoneNumber) throws ClientException {
        //可自助调整超时时间
        System.setProperty("sun.net.client.defaultConnectTimeout", "10000");
        System.setProperty("sun.net.client.defaultReadTimeout", "10000");

        //初始化acsClient,暂不支持region化
        IClientProfile profile = DefaultProfile.getProfile("cn-hangzhou", accessKeyId, accessKeySecret);
        DefaultProfile.addEndpoint("cn-hangzhou", "cn-hangzhou", product, domain);
        IAcsClient acsClient = new DefaultAcsClient(profile);

        //组装请求对象
        SendSmsRequest request = new SendSmsRequest();
        //必填:待发送的手机号
        request.setPhoneNumbers(PhoneNumber);
        //必填:短信签名-可在短信控制台中找到
        request.setSignName("肖鸿乐");
        //必填:短信模板-可在短信控制台中找到
        request.setTemplateCode("SMS_120770119");
        //生成六位验证码(到时候手机收到的验证码)
        int verificationCode = (int)((Math.random() * 9 + 1) * 100000);
        //可选:模板中的变量替换JSON串,如模板内容为"亲爱的${name},您的验证码为${code}"时,此处的值为
        request.setTemplateParam("{\"code\":\""+ verificationCode +"\"}");
        //选填-上行短信扩展码(无特殊需求用户请忽略此字段)
        //request.setSmsUpExtendCode("90997");

        //可选:outId为提供给业务方扩展字段,最终在短信回执消息中将此值带回给调用者
        //request.setOutId("yourOutId");

        //hint 此处可能会抛出异常，注意catch
        SendSmsResponse sendSmsResponse = acsClient.getAcsResponse(request);
        //将发送的验证码存储到Response中
        sendSmsResponse.setCode(String.valueOf(verificationCode));
        return sendSmsResponse;
    }
    
    //java程序入口（测试）
    public static void main(String[] args) throws ClientException {
    	//调用发送短信到手机的方法
        SendSmsResponse response = sendSms("13827649619");
        //输出数据
        System.out.println("短信API返回的数据----------------");
        System.out.println("Code=" + response.getCode());
        System.out.println("Message=" + response.getMessage());
        System.out.println("RequestId=" + response.getRequestId());
        System.out.println("BizId=" + response.getBizId());
	}
}
