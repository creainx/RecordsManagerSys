package com.sys.tool;

import com.aliyuncs.DefaultAcsClient;
import com.aliyuncs.IAcsClient;
import com.aliyuncs.dysmsapi.model.v20170525.SendSmsRequest;
import com.aliyuncs.dysmsapi.model.v20170525.SendSmsResponse;
import com.aliyuncs.exceptions.ClientException;
import com.aliyuncs.profile.DefaultProfile;
import com.aliyuncs.profile.IClientProfile;

public abstract class PhoneVerificationTool {
	//��Ʒ����
    static final String product = "Dysmsapi";
    //��Ʒ����
    static final String domain = "dysmsapi.aliyuncs.com";
    //���ڷ��ʰ������API
    static final String accessKeyId = "LTAIsfACHXRRlMCR";
    
    static final String accessKeySecret = "BYnv1UCRwAD3A5ddbOYeSu8V4LBkzA";
    
    //�����ŵ��ֻ�
    public static SendSmsResponse sendSms(String PhoneNumber) throws ClientException {
        //������������ʱʱ��
        System.setProperty("sun.net.client.defaultConnectTimeout", "10000");
        System.setProperty("sun.net.client.defaultReadTimeout", "10000");

        //��ʼ��acsClient,�ݲ�֧��region��
        IClientProfile profile = DefaultProfile.getProfile("cn-hangzhou", accessKeyId, accessKeySecret);
        DefaultProfile.addEndpoint("cn-hangzhou", "cn-hangzhou", product, domain);
        IAcsClient acsClient = new DefaultAcsClient(profile);

        //��װ�������
        SendSmsRequest request = new SendSmsRequest();
        //����:�����͵��ֻ���
        request.setPhoneNumbers(PhoneNumber);
        //����:����ǩ��-���ڶ��ſ���̨���ҵ�
        request.setSignName("Ф����");
        //����:����ģ��-���ڶ��ſ���̨���ҵ�
        request.setTemplateCode("SMS_120770119");
        //������λ��֤��(��ʱ���ֻ��յ�����֤��)
        int verificationCode = (int)((Math.random() * 9 + 1) * 100000);
        //��ѡ:ģ���еı����滻JSON��,��ģ������Ϊ"�װ���${name},������֤��Ϊ${code}"ʱ,�˴���ֵΪ
        request.setTemplateParam("{\"code\":\""+ verificationCode +"\"}");
        //ѡ��-���ж�����չ��(�����������û�����Դ��ֶ�)
        //request.setSmsUpExtendCode("90997");

        //��ѡ:outIdΪ�ṩ��ҵ����չ�ֶ�,�����ڶ��Ż�ִ��Ϣ�н���ֵ���ظ�������
        //request.setOutId("yourOutId");

        //hint �˴����ܻ��׳��쳣��ע��catch
        SendSmsResponse sendSmsResponse = acsClient.getAcsResponse(request);
        //�����͵���֤��洢��Response��
        sendSmsResponse.setCode(String.valueOf(verificationCode));
        return sendSmsResponse;
    }
    
    //java������ڣ����ԣ�
    public static void main(String[] args) throws ClientException {
    	//���÷��Ͷ��ŵ��ֻ��ķ���
        SendSmsResponse response = sendSms("13827649619");
        //�������
        System.out.println("����API���ص�����----------------");
        System.out.println("Code=" + response.getCode());
        System.out.println("Message=" + response.getMessage());
        System.out.println("RequestId=" + response.getRequestId());
        System.out.println("BizId=" + response.getBizId());
	}
}
