<%@ page contentType="text/html; charset=gb2312" %>
<%@ page import="com.abc.pay.client.ebus.*" %>
<%@ page import="java.net.URLDecoder" %>
<% response.setHeader("Cache-Control", "no-cache"); %>
<%
    String tABC = request.getParameter("ABC");
    out.println("tABC         = [" + tABC + "]<br>");

//1��ȡ��MSG�����������ô˲���ֵ����֧���������
    String msg = URLDecoder.decode(request.getParameter("MSG"), "GBK");
    PaymentResult tResult = new PaymentResult(msg);

//2���ж�֧�����״̬�����к�������
    if (tResult.isSuccess()) {
        //3��֧���ɹ�
        out.println("MerchantID			= [" + tResult.getValue("MerchantID") + "]<br>");//���˵�λ���
        out.println("TrxType				= [" + tResult.getValue("TrxType") + "]<br>");//���Ľ������ͣ�֧�������
        out.println("OrderNo				= [" + tResult.getValue("OrderNo") + "]<br>");//���׺�(����ϵͳ�˵�ID��)
        out.println("ProductID 			= [" + tResult.getValue("ProductID") + "]<br>");//���˵�λ�˵���
        out.println("Amount				= [" + tResult.getValue("Amount") + "]<br>");//�˵����
        out.println("BatchNo				= [" + tResult.getValue("BatchNo") + "]<br>");//�˵��������κ�
        out.println("HostDate			= [" + tResult.getValue("HostDate") + "]<br>");//��������
        out.println("HostTime			= [" + tResult.getValue("HostTime") + "]<br>");//����ʱ��
        out.println("MerchantRemarks		= [" + tResult.getValue("MerchantRemarks") + "]<br>");//��ע
        out.println("PayType				= [" + tResult.getValue("PayType") + "]<br>");//֧����ʽ��PAY01ע��ͻ���PAY02�����ͻ���
    } else {
        //4��֧��ʧ��
        out.println("ReturnCode   = [" + tResult.getReturnCode() + "]<br>");//�������
        out.println("ErrorMessage = [" + tResult.getErrorMessage() + "]<br>");//������Ϣ
    }
%>